package DBController;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import pojo.AssignToLearners;
import pojo.Hadith;
import pojo.Learners;
import pojo.TaskAssignments;

public class DBOper {
	private static Connection con = ConnectionSingleton._getConnection();
	private static int lastTaskAssigmentId = -1;//		For Responses table logic
	// ------------------ Hadith ------------------
	public static List<Hadith> getHadith() {
		try {

			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery("select * from HADITH");
			Hadith hadith;
			List<Hadith> list = new ArrayList<Hadith>();
			while (rs.next()) {
				hadith = new Hadith();
				hadith.setId(rs.getString(1));
				hadith.setHadithData(rs.getString(2));
				hadith.setHadithDataArabic(rs.getString(3));
				hadith.setHadithReference(rs.getString(4));
				list.add(hadith);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {

		}
	}

	// ------------------ Task Assignments ------------------

	public static Learners authenticateMe(String email, String pass) {
		// This method just authenticate the user and
		// send the info back to device once authenticated.
		Learners learner = new Learners();
		try {

			PreparedStatement stmt = con.prepareStatement("SELECT * FROM LEARNERS WHERE EMAIL = ? AND PASSWORD = ?");
			stmt.setString(1, email);
			stmt.setString(2, pass);

			ResultSet rs = stmt.executeQuery();
			if (rs == null)
				learner.setId(Integer.toString(-1));
			else {
				while (rs.next()) {
					learner.setId(Integer.toString(rs.getInt(1)));
					learner.setName(rs.getString(2));
					learner.setEmail(rs.getString(3));
					learner.setPassword(rs.getString(4));
					learner.setInterest(rs.getString(5));
					learner.setRank(Integer.toString(rs.getInt(6)));
					learner.setIsExpert(Integer.toString(rs.getInt(7)));
					learner.setIsLogin(rs.getString(8));
					learner.setIsAlive(rs.getString(9));
					learner.setDateOfBirth(rs.getString(10));
					learner.setGender(rs.getString(11));
					learner.setAvatar(rs.getString(12));
					learner.setCellNumber(rs.getString(13));
					learner.setCountry(rs.getString(14));
					break;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return learner;
	}

	// Returns the status of task attempted, total assigned, skipped and total
	// available.
	// Similarity based tasks...
	public static void getStatusSimilarity(int learnerId) {
		int assigned = -1, attempted = -1, skipped = -1, available = -1;
		try 
		{
			//	How much attempted i.e submit their response.
			PreparedStatement stmt = con.prepareStatement("SELECT COUNT(*) AS ATTEMPTED FROM RESPONSES "
					+ "WHERE LID = ? AND IS_ASSIGN = 1 AND ( RESPONSE LIKE %YES% OR  RESPONSE LIKE %NO%  RESPONSE LIKE %SKIP% )");
			stmt.setInt(1, learnerId);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){
				attempted = rs.getInt("ATTEMPTED");
			}
			// 		How much assigned to learner no matter he attempted or not.
			stmt = con.prepareStatement("SELECT COUNT(*) AS ASSIGNED FROM RESPONSES "
					+ "WHERE LID = ? AND IS_ASSIGN = 1 ");
			stmt.setInt(1, learnerId);
			rs = stmt.executeQuery();
			while(rs.next()){
				assigned = rs.getInt("ASSIGNED");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	public static void saveHadiths(List<Hadith> hadiths){
		String sql = "INSERT INTO hadith"
				+" (HADITH_DATA, HADITH_DATA_ARABIC, HADITH_REFERENCE) "
				+ " VALUES (?,?,?)";
		for(int i=0;i<hadiths.size();i++){
			try(PreparedStatement prepared = con.prepareStatement(sql)){
				prepared.setString(1, hadiths.get(i).getHadithData());
				prepared.setString(2, hadiths.get(i).getHadithDataArabic());
				prepared.setString(3, hadiths.get(i).getHadithReference());

				prepared.executeUpdate();
				System.out.println("Hadith Inserted Succesffully");
			}
			catch(SQLException e){
				e.printStackTrace();

				System.out.println("Error");
			}
		}

	}

	//		Theses tasks are uploaded by Admin side...
	//		And assignment to all the users
	//		Queries and db interaction in this method...
	//		Once published automatically assign to all the learners... (important)
	public static void saveUploadedTask(List<TaskAssignments> tasks) throws SQLException{
		int learners_info[] = {-1, -1};	//	0th index contain first id of learner and 1st contain total count of learners.
		String sql = "INSERT INTO task_assignments"
				+ " (MODIFIED_BY, HADITH_01, HADITH_02, TYPE, STATUS, DATE_GENERATED, LAST_MODIFIED, RESPONSE_REQUIRE, RESPONSE_COUNT_TRIGGER, QUESTION) "
				+ " VALUES (?,?,?,?,?,?,?,?,?,?)";

		//	This query should run as trigger so that each task creates 
		//	it's own entry in response table.
		//	Because once response arrived it's status could be changed.
		String sql_response = "INSERT INTO responses "
				+ "(LID, TASK_ASSIGNMENT_ID, RESPONSE, DESCRIPTION, CREATED_DATE, RESPONSE_DATE, IS_ASSIGN) "
				+ "VALUES (?,?,?,?,?,?,?)";
		ResultSet rs = con.prepareStatement("SELECT MAX(id) FROM task_assignments").executeQuery();
		lastTaskAssigmentId = rs.next() ? rs.getInt(1) : -1;
		rs = con.prepareStatement("SELECT ID, COUNT(*) FROM LEARNERS ORDER BY ID ASC").executeQuery();
		if(rs.next()){
			learners_info[0] = rs.getInt(1);
			learners_info[1] = rs.getInt(2);
		}
		for(int i=0;i<tasks.size();i++){
			//		Outer loop is for insertion of task in task Assignment table
			try(PreparedStatement prepared = con.prepareStatement(sql)){
				prepared.setInt(1, Integer.parseInt(tasks.get(i).getModifiedBy()));	
				prepared.setInt(2, Integer.parseInt(tasks.get(i).getHadith01()));	
				prepared.setInt(3, Integer.parseInt(tasks.get(i).getHadith02()));	
				prepared.setInt(4, Integer.parseInt(tasks.get(i).getType()));	
				prepared.setString(5, tasks.get(i).getStatus());	
//				prepared.setString(6, (tasks.get(i).getDateGenerated()));
				prepared.setString(6, new SimpleDateFormat("dd/MM/yyyy hh:mm:ss a").format(new Date()));
				
				prepared.setString(7, new SimpleDateFormat("dd/MM/yyyy hh:mm:ss a").format(new Date()));
				prepared.setInt(8, Integer.parseInt(tasks.get(i).getResponseRequire()));	
				prepared.setInt(9, Integer.parseInt(tasks.get(i).getResponseCountTrigger()));	
				prepared.setString(10, tasks.get(i).getQuestions());
				prepared.executeUpdate();
				System.out.println("Assignment Created Successfully.");
			}
			catch(SQLException e){
				e.printStackTrace();
				System.out.println("Error");
			}

			//		Inner loop is for insertion of tasks in response table
			//		This is for registering it against all the learners

			for(int j=learners_info[0];j<=learners_info[1];j++){
				try(PreparedStatement prepared = con.prepareStatement(sql_response)){
					//					LID, TASK_ASSIGNMENT_ID, RESPONSE, DESCRIPTION, DUE_DATE, RESPONSE_DATE, IS_ASSIGN
					prepared.setInt(1, j);	//	Learner ID
					prepared.setInt(2, (i+1)+lastTaskAssigmentId);	//Task Assignment ID added one bcz i is starting from zero.
					prepared.setString(3, "Not Collected Yet");	//	Response
					prepared.setString(4, "No Description");	//	Description
					prepared.setString(5, new SimpleDateFormat("dd/MM/yyyy hh:mm:ss a").format(new Date()));	//	Response-Record Created Date
					prepared.setString(6, "");	//	Date when you collect response from learner
					prepared.setInt(7, 1);
					prepared.executeUpdate();
					System.out.println("Assigned to Learner # "+ j+ " Successfully");

				}
				catch(SQLException e){
					e.printStackTrace();
					System.out.println("Error");
				}
			}

		}
	}
	//		In this function tasks are assigned
	//		Logic is all the uploaded tasks are assigned to all the learners currently in our database.
	public static List<AssignToLearners> assignSimilarityTaskLearners(int learnerID) throws SQLException{
		PreparedStatement prepared = con.prepareStatement("SELECT rs.id AS responseID, rs.task_assignment_id AS taskID  ,"
				+ " tab.hadith_01, tab.arabic_1, tab.reference_1,tab.hadith_02, tab.arabic_2, tab.reference_2   "
				+ "FROM responses rs INNER JOIN  "
				+ "(SELECT ta.ID AS TaskID, h1.Hadith_data AS hadith_01, "
				+ "h1.Hadith_data_arabic AS arabic_1, h1.hadith_reference AS reference_1,  "
				+ "h2.Hadith_data AS hadith_02, h2.Hadith_data_arabic AS arabic_2, h2.hadith_reference AS reference_2  "
				+ "FROM task_assignments ta INNER  JOIN  hadith h1  ON    ( h1.id=ta.Hadith_01 ) "
				+ "INNER  JOIN  Hadith h2 ON (  h2.id=ta.Hadith_02 )   WHERE ta.id IN (SELECT r1.task_assignment_ID FROM responses r1 "
				+ "  WHERE r1.is_assign=1 AND r1.LID = 1 )  LIMIT 10) tab ON rs.Task_Assignment_id = tab.taskid AND rs.LID =?");
		prepared.setInt(1, learnerID);
		ResultSet rs = prepared.executeQuery();
		ArrayList<AssignToLearners> tasks = new ArrayList<AssignToLearners>();
		while(rs.next()){
			AssignToLearners atl = new AssignToLearners();
			atl.setResponseID(rs.getInt(1));
			atl.setTaskID(rs.getInt(2));
			atl.setHadith_01(rs.getString(3));
			atl.setHadith_01_Arabic(rs.getString(4));
			atl.setHadith_01_Reference(rs.getString(5));

			atl.setHadith_02(rs.getString(6));
			atl.setHadith_02_Arabic(rs.getString(7));
			atl.setHadith_02_Reference(rs.getString(8));
			tasks.add(atl);
		}
		return tasks;
	}
}
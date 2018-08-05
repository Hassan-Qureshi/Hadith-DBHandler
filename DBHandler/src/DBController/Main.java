package DBController;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import pojo.AssignToLearners;
import pojo.Hadith;
import pojo.TaskAssignments;

/**
 * @author AliHassan
 *
 */

public class Main {
	
	/**
	 * @param args
	 */
	public static void getHadith() {
		try {
			Statement s = ConnectionSingleton._getConnection().createStatement();
			ResultSet rs = s.executeQuery("select * from Hadith");
			while (rs.next()) {
				System.out.println(rs.getString(2));
			}
		} catch (Exception e) {

		}
	}

	public static ResultSet getLearners(Connection con) {
		ResultSet rs = null;
		try {
			Statement s = con.createStatement();
			rs = s.executeQuery("select * from learneruser");
		} catch (Exception e) {

		}
		return rs;
	}

	public static void main(String[] args) throws SQLException {
		List<TaskAssignments> tasks = new ArrayList<TaskAssignments>();
		List<Hadith> hadiths = new ArrayList<Hadith>();
		Hadith h = new Hadith();
		h.setHadithData("This is hadith 1");
		h.setHadithDataArabic("Arabic data");
		h.setHadithReference("this is reference");
		hadiths.add(h);
		
		TaskAssignments t = new TaskAssignments();
		t.setModifiedBy("1");
		t.setHadith01("4");
		t.setHadith02("5");
		t.setDateGenerated(new SimpleDateFormat("dd/MM/yyyy hh:mm:ss a").format(new Date()));
		t.setLastModified(new SimpleDateFormat("dd/MM/yyyy hh:mm:ss a").format(new Date()));
		t.setQuestions("Search Similarity?");
		t.setResponseCountTrigger("8");
		t.setResponseRequire("12");
		t.setStatus("In-Progress");
		t.setType("1");
		
		tasks.add(t);
//		DBOper.saveUploadedTask(tasks);
//		DBOper.saveHadiths(hadiths);
		int size = DBOper.assignSimilarityTaskLearners(1).size();
		for(int i=0;i<size;i++){
			System.out.println(DBOper.assignSimilarityTaskLearners(1).get(i).getHadith_01());
		}
	}
	
}
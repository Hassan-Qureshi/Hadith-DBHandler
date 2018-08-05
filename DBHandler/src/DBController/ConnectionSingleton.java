package DBController;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionSingleton {
	private static Connection con;
	private final static String db = "demo";
	private ConnectionSingleton(){}
	public static Connection _getConnection(){
		if(con == null){
			try{
			String driver = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/"+db;
			String username = "root";
			String password = "root";
			Class.forName(driver);
	   
		   con = (Connection) DriverManager.getConnection(url,username,password);
		   System.out.println("Connected");
			}
			catch(Exception e){
				System.out.println(e.getMessage());
			}
		}//end of if
		return con;	

	}
}

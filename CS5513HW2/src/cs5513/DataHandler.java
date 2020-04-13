package cs5513;

//import all necessary libraries 
import java.io.FileNotFoundException; 
import java.sql.*; 
import java.sql.SQLException; 
import oracle.jdbc.pool.OracleDataSource; 
import java.sql.Statement; 
import java.sql.ResultSet; 
import javax.servlet.http.HttpSession;
//import java.util.ArrayList;


public class DataHandler {
	
	  //specify the database connection string and log in information 
	 
	  String jdbcUrl = "jdbc:oracle:thin:@//oracle18.cs.ou.edu:1521/orclpdb"; 
	  String userid = "gant0006";
	  String password = "CSmo5Fh1"; 
	  Connection conn; 
	  PreparedStatement stmt; 
	  ResultSet rset; 
	  String query; 
	  String sqlString, sqlString1; 
	  
	  //create a new database connection 
	 
	  public void getDBConnection() throws SQLException { 
	    OracleDataSource ds; 
	    ds = new OracleDataSource(); 
	    ds.setURL(jdbcUrl); 
	    conn=ds.getConnection(userid,password); 
	  } 
	  
	  
	  //authenticate user, if valid then connect to the database, else display error message 
	 
	  public int authenticateUser(String jdbcUrl, String userid, String  password,
			  HttpSession session) throws SQLException { 
	    this.jdbcUrl= jdbcUrl; 
	    this.userid = userid; 
	    this.password = password; 
	    try { 
	      OracleDataSource ds; 
	      ds = new OracleDataSource(); 
	      ds.setURL(jdbcUrl); 
	      conn = ds.getConnection(userid, password); //connect to DB 
	      System.out.println("Succesfuly logged in");
	      return 1; 
	  } 
	    catch ( SQLException ex ) { 
	      System.out.println("Invalid Credentials"); 
	      session.setAttribute("loginerrormsg", "Invalid Login. Try	Again."); 
	      this.jdbcUrl = null; 
	      this.userid = null; 
	      this.password = null; 
	      return 0; 
	    } 
	  }

	
	  //insert Car
	  
	  public void insertCar( String liscenseplate, String model, String make, int year,
			  String op1, String op2, String op3, int numdoors) throws SQLException, FileNotFoundException {
		  System.out.println(liscenseplate+model+make);
		  
		  int updatedRows = 0;
		  getDBConnection();
  
		  sqlString= "INSERT INTO car_table VALUES(?,?,?,?, equipment_options_obj(?,?,?),?)";		  		  
		  stmt=conn.prepareStatement(sqlString);
		  
		  stmt.setString(1, liscenseplate);
		  stmt.setString(2, model);
		  stmt.setString(3, make);
		  stmt.setInt(4, year);
		  stmt.setString(5, op1);
		  stmt.setString(6, op2);
		  stmt.setString(7, op3);
		  stmt.setInt(8, numdoors);
		  		  
		  updatedRows = stmt.executeUpdate();
		  System.out.println(" rows updated are: "+updatedRows);
		  
	  }
	  
	  
//insert Truck
	  
	  public void insTruck( String liscenseplate, String model, String make, int year,
			  String op1, String op2, String op3,String CabinType, int Weight) throws SQLException, FileNotFoundException {
		  System.out.println(liscenseplate+model+make);
		  
		  int updatedRows = 0;
		  getDBConnection();
  
		  sqlString= "INSERT INTO truck_table VALUES(?,?,?,?, equipment_options_obj(?,?,?),?,?)";		  		  
		  stmt=conn.prepareStatement(sqlString);
		  
		  stmt.setString(1, liscenseplate);
		  stmt.setString(2, model);
		  stmt.setString(3, make);
		  stmt.setInt(4, year);
		  stmt.setString(5, op1);
		  stmt.setString(6, op2);
		  stmt.setString(7, op3);
		  stmt.setString(8, CabinType);
		  stmt.setInt(9, Weight);
		  		  
		  updatedRows = stmt.executeUpdate();
		  System.out.println(" rows updated are: "+updatedRows);
		  
	  }
	  
	  
	  // insert driver
	  
	  public void insertDriver( String driverid, String drivername,String liscenseplate) throws SQLException, FileNotFoundException {
		  System.out.println(driverid+drivername+liscenseplate);
		  int updatedRows = 0;
		  getDBConnection();
  
		  sqlString= "INSERT INTO drivinginst_table VALUES(?,?)";		  		  
		  stmt=conn.prepareStatement(sqlString);
		  
		  stmt.setString(1, driverid);
		  stmt.setString(2, drivername);
		  updatedRows = stmt.executeUpdate();
		  System.out.println(" rows updated for drivinginst_table are: "+updatedRows);
		  // inserting record into has_session
		  
		  sqlString= "INSERT INTO has_car_table SELECT REF (D), REF (C) FROM drivinginst_table D, car_table C WHERE D.driver_id=? AND C.licenseplate=?";		  		  
		  stmt=conn.prepareStatement(sqlString);
		  
		  stmt.setString(1, driverid);
		  stmt.setString(2, liscenseplate);
		  updatedRows = stmt.executeUpdate();
		  System.out.println(" rows updated for has_car_table are: "+updatedRows);
		  if(updatedRows==0) {
			  sqlString= "INSERT INTO has_truck_table SELECT REF (D), REF (C) FROM drivinginst_table D, truck_table C WHERE D.driver_id=? AND C.licenseplate=?";		  		  
			  stmt=conn.prepareStatement(sqlString);
			  
			  stmt.setString(1, driverid);
			  stmt.setString(2, liscenseplate);
			  updatedRows = stmt.executeUpdate();
			  System.out.println(" rows updated for has_car_table are: "+updatedRows);
		  }
		  	  
		  
	  }
	
	  //insert a student driver
	  
 // insert driver
	  
	  public void insertStudent( String studentid, String studentname,String street, String city,int day, String month, int year,String driverid) throws SQLException, FileNotFoundException {
		  System.out.println(studentid+studentname+driverid);
		  int updatedRows = 0;
		  getDBConnection();
  
		  sqlString= "INSERT INTO student_table VALUES(?,?,student_address_obj(?,?))";		  		  
		  stmt=conn.prepareStatement(sqlString);
		  
		  stmt.setString(1, studentid);
		  stmt.setString(2, studentname);
		  stmt.setString(3, street);
		  stmt.setString(4, city);
		  
		  
		  updatedRows = stmt.executeUpdate();
		  System.out.println(" rows updated for student_table are: "+updatedRows);
		  // inserting record into hassession_table
		  
		  sqlString= "INSERT INTO hassession_table SELECT hassession_obj ( REF (D), REF (S), date_obj(?,?, ?)) FROM drivinginst_table D, student_table S WHERE D.driver_id=? AND S.student_id=?";		  		  
		  stmt=conn.prepareStatement(sqlString);
		  
		  stmt.setInt(1, day);
		  stmt.setString(2, month);
		  stmt.setInt(3, year);
		  stmt.setString(4, driverid);
		  stmt.setString(5, studentid);
		  updatedRows = stmt.executeUpdate();
		  System.out.println(" rows updated for hassession_table are: "+updatedRows);
	  
	  }
	  
	  // query 4 find students in the particular city
	  public ResultSet findStudent(String city) throws SQLException { 
		  getDBConnection(); 
		  query= "SELECT S.student_id, S.student_name FROM student_table S WHERE (S.student_address.city=?)";		  		  
		  stmt=conn.prepareStatement(query);
		  
		  stmt.setString(1, city);
			  
		  
		  System.out.println("\nExecuting query: " + query); 
		  rset = stmt.executeQuery(); 
		  return rset; 
	  } 
	  
	  // query5 find students assoicated with the driver
	  public ResultSet findStudentid(String driverid) throws SQLException { 
		  getDBConnection(); 
		  System.out.println("driver id"+driverid);
		  query= "select S.student_id from student_table S where REF(S) in (SELECT H.student_id FROM hassession_table H where H.driver_id in (Select REF(D) from drivinginst_table D WHERE D.driver_id=?))" ;
		  			  		  
		  stmt=conn.prepareStatement(query);
		  
		  stmt.setString(1, driverid);
			  
		  
		  System.out.println("\nExecuting query: " + query); 
		  rset = stmt.executeQuery(); 
		  
		  return rset; 
	  } 
	  
	  // query 6 List the names, IDs and addresses of all the student drivers who had a session on a particular date in a 2-door Honda Civic.  
	  public ResultSet findStudentdetails(String model,String make, int numdoors) throws SQLException { 
		  getDBConnection(); 
		  
		  query= "select S.student_id, S.student_name, S.student_address.street,S.student_address.city from student_table S where REF(S) in (select student_id from hassession_table H where H.driver_id in (select driver_id from has_car_table where licenseplate in (select REF(c) from car_table c where c.model=? and c.make=? and c.numdoors=?)))";  		  
		  stmt=conn.prepareStatement(query);
		  
		  stmt.setString(1, model);
		  stmt.setString(2, make);
		  stmt.setInt(3, numdoors);
			  
		  
		  System.out.println("\nExecuting query: " + query); 
		  rset = stmt.executeQuery(); 
		  
		  return rset; 
	  } 
	  
	  // query 7 Display the license plates, models, makes and years of all the cars that are equipped with a particular equipment option.
	
	  public ResultSet findCarDetails(String equipmentoption) throws SQLException { 
		  getDBConnection(); 
		  
		  query= "select C.licenseplate, C.model,C.make,C.year from car_table C where (?) in(SELECT * FROM  table(C.EQUIPMENT_OPTIONS))";  		  
		  stmt=conn.prepareStatement(query);
		  
		  stmt.setString(1, equipmentoption );
			  
		  
		  System.out.println("\nExecuting query: " + query); 
		  rset = stmt.executeQuery(); 
		  
		  return rset; 
	  } 
	  
	  // query 8
	  
	  public ResultSet findDriverName(int weight) throws SQLException { 
		  getDBConnection(); 
		  
		  query= "select D.driver_name from drivinginst_table D where REF(D) in(select driver_id from has_truck_table where licenseplate in (select REF(t) from truck_table t where t.weight>?))";
		  stmt=conn.prepareStatement(query);
		  
		  stmt.setInt(1, weight );
			  
		  
		  rset = stmt.executeQuery(); 
		  
		  return rset; 
	  } 
	  
	  // query 9 delete the cars
	  
	  public void deleteCars(int numdoors) throws SQLException, FileNotFoundException {
		  
		  int updatedRows = 0;
		  getDBConnection();
		  System.out.println("number of doors"+numdoors);
  
		  sqlString= "DELETE FROM has_car_table where licenseplate in ( select REF(C) from car_table C WHERE C.numdoors=?)";		  		  
		  stmt=conn.prepareStatement(sqlString);
		  
		  stmt.setInt(1, numdoors);
		 
		  updatedRows = stmt.executeUpdate();
		  System.out.println(" rows updated  are: "+updatedRows);
		  // inserting record into has_session
		  
		  sqlString= "DELETE FROM car_table C WHERE C.numdoors=?";
		  stmt=conn.prepareStatement(sqlString);
		  
		  stmt.setInt(1, numdoors);
		  
		  updatedRows = stmt.executeUpdate();
		  System.out.println(" rows updated  are: "+updatedRows);
		 
		  
	  }  
	  
}	  

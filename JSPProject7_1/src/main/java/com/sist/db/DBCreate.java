package com.sist.db;
import java.sql.*;
public class DBCreate {
  private Connection conn;
  private final String URL="jdbc:oracle:thin:@localhost:1521:XE"; 
  public DBCreate()
  {
	  try
	  {
		  Class.forName("oracle.jdbc.driver.OracleDriver");
	  }catch(Exception ex) {}
  }
  public Connection getConnection()
  {
	  try
	  {
		  conn=DriverManager.getConnection(URL,"hr","happy");
	  }catch(Exception ex){}
	  return conn;
  }
  public void disConnection(Connection conn,PreparedStatement ps)
  {
	  try
	  {
		  if(ps!=null) ps.close();
		  if(conn!=null) conn.close();
	  }catch(Exception ex) {}
  }
  
}

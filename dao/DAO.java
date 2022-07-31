package study.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;



public class DAO {
	
	public static HashMap<String,String> hm= new HashMap<String,String>();

	public Connection myGetConection() 
	{
		Connection con =null;
		try
		{
		Class.forName("com.mysql.cj.jdbc.Driver");

		
		String url ="jdbc:mysql://localhost:3306/jdbc";
		String uname="root";
		String pwd ="root";
		
		con =	DriverManager.getConnection(url,uname,pwd);
		} catch(ClassNotFoundException | SQLException e)
		{
			System.out.println("The Connection could not be Possible!! "+e);
		}
		
		return con;
	}
	
	public ResultSet getRows(String sql) 
	{
		Connection con = myGetConection();
		Statement stmt = null;
		ResultSet rs=null;
		
		try
		{
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
		}
		catch(SQLException e)
		{
			System.out.println(e);
		}
		return rs;
		
	}
	
	public void showResultSet(ResultSet rs)
	{
		try
		{
			System.out.println("\n-----Product Table-----");
			System.out.println("ID  "+"NAME "+" COST ");
			while(rs.next())
			{
				System.out.println(rs.getInt(1)+"   "+rs.getString(2)+"  "+rs.getInt(3));
			}
		}catch(SQLException e)
		{
			System.out.println(e);
		}
	}
	
	public void addProduct(int id,String name,int cost)
	{
		//get a Connection
		Connection con = myGetConection();
		try {
			PreparedStatement pstmt = con.prepareStatement("insert into product values(?,?,?)");
			pstmt.setInt(1,id);
			pstmt.setString(2, name);
			pstmt.setInt(3, cost);
			
			pstmt.executeUpdate();
			con.commit();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public  void updateCostName(int id,int cost,String pname)
	{
		Connection con = myGetConection();

		try
		{
			PreparedStatement pstmt = con.prepareStatement("Update Product set cost=? , name=? where id=?");
			pstmt.setInt(3, id);
			pstmt.setInt(1, cost);
			pstmt.setString(2, pname);

			if(pstmt.executeUpdate()==1)
				System.out.println("Product Name and Cost Updated!!");
		}catch(SQLException e)
		{
			System.out.println(e);
		}

	}
	
	public  void deleteRecord(int id)
	{
		Connection con = myGetConection();

		try
		{
			PreparedStatement pstmt = con.prepareStatement("Delete from  Product  where id=?");
			pstmt.setInt(1, id);
			
			if(pstmt.executeUpdate()==1)
				System.out.println("Record Deleted!!");
		}catch(SQLException e)
		{
			System.out.println(e);
		}
		

	}
	
	public  void adding()
	{

		DAO dao= new DAO();

		ResultSet rs=dao.getRows("select username,password from user_info");
		String uname=null;
		String pwd=null;

		try {
			while(rs.next())
			{
				uname=rs.getString(1);
				pwd=rs.getString(2);
				System.out.println(uname+" "+pwd);

				hm.put(uname, pwd);
			}
		} catch (SQLException e) {

			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public boolean SignIn(String username, String password)
	{
		
		DAO dao = new DAO();
		dao.adding();
		if(hm.containsKey(username) )
		{
			if(hm.get(username).equals(password))
			{
				System.out.println("true");
				return true;
			}
			else
			{
				System.out.println("false");

				return false;
			}
		}
		else
		{				System.out.println("false");

			return false;
		}
	}
	
	public void SignUp(String name, String gender,String contact, String username, String password)
	{
		// get a connection 
		Connection con = myGetConection();
		try {
			PreparedStatement pstmt = con.prepareStatement("insert into user_info values(?,?,?,?,?)");
			pstmt.setString(1, name);
			pstmt.setString(2, gender);
			pstmt.setString(3, contact);
			pstmt.setString(4, username);
			pstmt.setString(5,password );
			pstmt.executeUpdate();
			con.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	

	
	public void addAppoint(String username,String date,String choice,String ftime,String ttime)
	{
		//get a Connection
		Connection con = myGetConection();
		try {
			PreparedStatement pstmt = con.prepareStatement("insert into appointment values(?,?,?,?,?)");
			pstmt.setString(1,username);
			pstmt.setString(2, date);
			pstmt.setString(3, choice);
			pstmt.setString(4, ftime);
			pstmt.setString(5, ttime);
			
			pstmt.executeUpdate();
			con.close();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		

	}

}

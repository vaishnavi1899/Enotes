package com.DAO;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.User.UserDetails;
public class UserDAO {
    private Connection conn;

	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}
    
	public boolean addUser(UserDetails us)
	{
		boolean f=false;
		
		try {
			String query= "insert into user(name,email,password) values(?,?,?)";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPassword());
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	private static String hash(String data) {
		String hashed=" ";
		try {
			MessageDigest md5=MessageDigest.getInstance("MD5");
			md5.update(data.getBytes());
			byte[] byteData=md5.digest();
			StringBuilder sb=new StringBuilder();
			for(int i=0;i<byteData.length;i++) {
				sb.append(Integer.toString(byteData[i] & 0xff)+
						0x100, 16, i).substring(1);
				
			}
			hashed=sb.toString();
		}catch(NoSuchAlgorithmException e) {
			
		}
		return hashed;
		
	}
	
	public UserDetails loginUser(UserDetails us)
	{
		UserDetails user=null;
		try {
			String query="select * from user where email=? and password=?";
			
			String email=us.getEmail();
			String pass=us.getPassword();
			
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, pass);
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				user=new UserDetails();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword("password");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
}

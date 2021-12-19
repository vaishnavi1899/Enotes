package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.User.Post;
import com.User.UserDetails;

public class PostDAO {
	
	private  Connection conn;

	public PostDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean AddNotes(String ti,String co,int ui)
	{
		boolean f=false;
		try {
			
			String qu="insert into post(title,content,uid) values(?,?,?)";
			
			PreparedStatement ps=conn.prepareStatement(qu);
			ps.setString(1,ti);
			ps.setString(2,co);
			ps.setInt(3,ui);
			
		   int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		}catch(Exception e) {
			
		}
		
		return f;
	}
	
	public List<Post> getData(int id){
		List<Post> list=new ArrayList<Post>();
		Post po=new Post();
		try {
			String qu="select * from post where id=?";
			PreparedStatement ps=conn.prepareStatement(qu);
			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				po.setId(rs.getInt(1));
				po.setTitle(rs.getString(2));
				po.setContent(rs.getString(3));
				po.setPdate(rs.getTimestamp(4));
				list.add(po);
			}
			
			
		} catch(Exception e) {
			
		}
		
		
		
		
		return list;
	}
}

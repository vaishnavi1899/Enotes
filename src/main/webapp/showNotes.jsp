<%@page import="com.Db.DBConnect"%>
<%@page import="com.DAO.PostDAO"%>
<%@page import="com.User.Post"%>
<%@page import="java.util.List"%>


<%@ page language="java" contentType="text/html charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
UserDetails user3 = (UserDetails) session.getAttribute("userD");

if (user3 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login....");
}
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Notes</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<h2 class="text-center">All Notes</h2>

		<div class="row">
			<div class="col-md-12">
			  <% 
	
			     if(user3!=null){
			    	 PostDAO ob=new PostDAO(DBConnect.getConn());
			    	 List<Post> pos=ob.getData(user3.getId());
			    	 for(Post po:pos){%>
			  
			    	<div class="card mt-3">

					<img alt="" src="image/notebook.png"
						class="card-img-top mt-3 mx-auto" style="max-width: 100px;">

					<div class="card-body p-4">

						<h5 class="card-title"><%=po.getTitle() %></h5>
 

						<p>
							<b class="text-success">Published By:hii</b></br> <b
								class="text-primary"></b>
						</p>

						<p>
							<b class="text-success">Published Date:love u
							</b></br> <b class="text-success"></b>
						</p>


						<div class="container text-center mt-2">
							<a href=" " class="btn btn-danger">Delete</a> <a href=""
								class="btn btn-primary">Edit</a>
						</div>
					</div>
				</div>
			    	
			    		 
			 	 
			    <% }
			     }
			  %>

			</div>
		</div>
	</div>

<%@include file="all_component/footer.jsp"%>
	
</body>
</html>
<%@page import="com.Db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.Db.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img {
	background: url("image/E-notebook.jpg");
	width: 20%;
	height: 80vh;
	background-position: center;
	background-repeat: no-repeat;
	background-size:cover;
}

.button {
	cursor: pointer;
	position: relative;
	padding: 2.5rem 7.5rem;
	border-radius: 3.75rem;
	line-height: 2.5rem;
	font-size: 2rem;
	font-color:white;
	font-weight: 600;
	border: 1px solid #012880;
	background-image: linear-gradient(-180deg, #FF89D6 0%, #C01F9E 100%);
	box-shadow: 0 1rem 1.25rem 0 rgba(22, 75, 195, 0.50), 0 -0.25rem 1.5rem
		rgba(110, 15, 155, 1) inset, 0 0.75rem 0.5rem rgba(255, 255, 255, 0.4)
		inset, 0 0.25rem 0.5rem 0 rgba(180, 70, 207, 1) inset;
		
}


.button::before {
	content: "";
	display: block;
	height: 0.25rem;
	position: absolute;
	top: 0.5rem;
	left: 50%;
	transform: translateX(-50%);
	width: calc(100% - 7.5rem);
	background: #fff;
	border-radius: 100%;
	
	opacity: 0.7;
	background-image: linear-gradient(-270deg, rgba(255,255,255,0.00) 0%, #FFFFFF 20%, #FFFFFF 80%, rgba(255,255,255,0.00) 100%);
}


</style>

<meta charset="ISO-8859-1">
<title>Home Page</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
    

	<div class="container-fluid back-img">
	<div class="text-center">
		<h1 class="text-blacklight"><i class="fa fa-book" aria-hidden="true"></i>E Notes-Save Your Notes</h1>
		<a href="login.jsp" class="btn btn-dark"><i class="fa fa-user-circle-o" aria-hidden="true"></i>Login</a>                    
		<a href="register.jsp" class="btn btn-dark"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a>
	</div>
	
	</div>

	
	<%@include file="all_component/footer.jsp"%>
</body>
</html>
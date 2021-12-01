<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib
    prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" 
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta charset="ISO-8859-1">

<style>
.card{
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	padding: 50px;
}
</style>

<title>Welcome to Commsult!</title>
</head>
<body>
	<div class="card">
		<div class="container">
			<h1>Login</h1>
			<form action="LoginServlet" method="post" name="login">
				<div class="form-group mt-5">
					<label for="username">Username</label>
				    <input type="text" name="username" id="username" class="form-control" placeholder="Enter username">
				</div>
				<div class="form-group">
				    <label for="password">Password</label>
				    <input type="password" name="password" id="password" class="form-control" placeholder="Password">
				</div>
				<c:if test="${errMsg != null || errMsg != ''}">
					<div style="color:red;">${errMsg}</div>
				</c:if>
				<input type="button" name="submitBtn" id="submitBtn" value="Login" onclick="checkLogin()" class="btn btn-primary mt-4"/>
			</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
<script>
function checkLogin(){
	var username = document.getElementById("username").value
	var password = document.getElementById("password").value
	
	if(username == null || username == ""){
		alert("Username can't be blank!");
		return false;
	} else if(password == null || password == ""){
		alert("Password can't be blank!");
		return false;
	} else document.login.submit();
}
</script>
</html>
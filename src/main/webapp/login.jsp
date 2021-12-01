<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib
    prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to Commsult!</title>
</head>
<body>
	<div align="center">
		<h1>User Login Form</h1>
		<form action="LoginServlet" method="post" name="login">
			<table>
				<tr>
					<td>email</td>
					<td>:</td>
					<td><input type="text" name="username" id="username"/></td>
				</tr>
				<tr>
					<td>password</td>
					<td>:</td>
					<td><input type="password" name="password" id="password"/></td>
				</tr>
				<tr>
					<td><input type="button" name="submitBtn" id="submitBtn" value="Login" onclick="checkLogin()"/></td>
				</tr>
				<c:if test="${errMsg != null || errMsg != ''}">
					<tr>
						<td colspan="3" align="center">
							<span style="color:red">${errMsg }</span>
						</td>
					</tr>
				</c:if>
				
			</table>
		</form>
	</div>
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
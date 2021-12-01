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
<title>Create New Stock</title>

</head>
<body>
	<div align="center">
		<h1>Create New Stock</h1>
		<form action="insert" method="post">
			<fieldset style="width:500px;">
				<table>
					<tr>
						<td>Product Name</td>
						<td>:</td>
						<td><input type="text" name="name" required="required"></td>
					</tr>
					<tr>
						<td>Quantity</td>
						<td>:</td>
						<td><input type="number" name="quantity" required="required"></td>
					</tr>
					<tr>
						<td>Price</td>
						<td>:</td>
						<td><input type="number" step="0.01" min="0" name="price" required="required"></td>
					</tr>
					<tr>
						<td colspan="3">
							<input type="submit" value="Save"/>
						</td>
					</tr>
				</table>
			</fieldset>
			<!-- <fieldset>
				<label>Product Name</label> 
				<input type="text" name="name" required="required">
			</fieldset>

			<fieldset>
				<label>Quantity</label> 
				<input type="number" name="email">
			</fieldset>

			<fieldset>
				<label>Price</label> 
				<input type="number" step="0.01" min="0" name="country">
			</fieldset> -->
		</form>
	</div>
</body>
</html>
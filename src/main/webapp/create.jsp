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
	width: 40%;
}
</style>

<title>Create New Stock</title>
</head>
<body>
	<div class="card">
		<div class="container">
			<h1 align="center">Create New Stock</h1>
			<form action="insert" method="post">
				<div class="form-group mt-5 row">
					<div class="col-3">
						<label for="name">Product Name</label>
					</div>
					<div class="col-9">
				    	<input type="text" name="name" required="required" class="form-control" style="display:inline-block !important;">
				    </div>
				</div>
				<div class="form-group row">
					<div class="col-3">
				    	<label for="quantity">Quantity</label>
				    </div>
				    <div class="col-9">
				    	<input type="number" name="quantity" required="required" class="form-control">
				    </div>
				</div>
				<div class="form-group row">
					<div class="col-3">
				    	<label for="price">Price</label>
				    </div>
				    <div class="col-9">
				    	<input type="number" step="0.01" min="0" name="price" required="required" class="form-control">
				    </div>
				</div>
				<div>
					<input type="submit" value="Save" class="btn btn-primary mt-4" style="width: 100%;"/>
				</div>
				<!-- <fieldset style="width:500px;">
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
				</fieldset> -->
			</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
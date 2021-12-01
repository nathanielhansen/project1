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
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

.modal-content {
  display: none;
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 30%;
  
}

.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

table#listTable {
    border-collapse: collapse;   
}
#listTable tr {
    background-color: #eee;
    border-top: 1px solid #fff;
}
#listTable tr:hover {
    background-color: #ccc;
}
#listTable th {
    background-color: #fff;
}
#listTable th, #listTable td {
    padding: 3px 5px;
}
#listTable td:hover {
    cursor: pointer;
}

.clickable-row{
}
</style>

<title>Insert title here</title>
</head>
<body>
	<div>
		<c:choose>
			<c:when test="${listStock != null}">
				<div class="container">
				<h1 align="center" style="margin-top:50px">Product List</h1>
					<table id="listTable" class="table" style="margin-top:50px;">
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Name</th>
							<th scope="col">Quantity</th>
							<th scope="col">Price</th>
							<!-- <th scope="col">Action</th> -->
						</tr>
						<c:set var="num" value = "1" scope="page"/>
						<c:forEach var="item" items="${listStock }">
							<tr class="clickable-row" id="update${num}" onclick="buttonPress(${num})">
								<td>
									${num}
									<input type="hidden" value="${item.id}" id="itemId${num}"/>
								</td>
								<td>
									${item.name}
									<input type="hidden" value="${item.name}" id="itemName${num}"/>
								</td>
								<td>
									${item.quantity}
									<input type="hidden" value="${item.quantity}" id="itemQuantity${num}"/>	
								</td>
								<td>
									${item.price}
									<input type="hidden" value="${item.price}" id="itemPrice${num}"/>
								</td>
								<%-- <td style="width: 100px"><input type="button" id="1update${num}" value="Update" onclick="buttonPress()" class="btn btn-outline-primary"/></td> --%>
								<c:set var="num" value="${num+1}" scope="page"/>
							</tr>
						</c:forEach>
					</table>
					<a href="${pageContext.request.contextPath}/create" >
						<input type="button" value="Create" class="btn btn-primary" style="width: 125px"/>
					</a>
				</div>
			</c:when>
			<c:otherwise>
				<c:out value="There is no data!"></c:out>
			</c:otherwise>
		</c:choose>
	</div>
	<div id="modal1" class="modal">
		  <div id="modalUpdate" class="modal-content" align="center">
		    <span class="close" id="spanUpdate">&times;</span>
		    <p align="center">Update Product</p>
		    <form action="update" method="post">
			    <table class="table">
			    	<tr>
						<td>Product Name</td>
						<td>:</td>
						<td><input type="text" id="name" name="name" required="required" style="border:0;"><input type="hidden" id="updatedId" name="updatedId"/></td>
					</tr>
					<tr>
						<td>Quantity</td>
						<td>:</td>
						<td><input type="number" id="quantity" name="quantity" required="required" style="border:0;"></td>
					</tr>
					<tr>
						<td>Price</td>
						<td>:</td>
						<td><input type="number" id="price" step="0.01" min="0" name="price" required="required" style="border:0;"></td>
					</tr>
			    </table>
			    <div class="d-flex justify-content-center mx-2">
			    	<input type="submit" name="update" value="Save" class="btn btn-primary mr-3"/>
					<input type="submit" name="delete" value="Delete" class="btn btn-danger"/>
			    </div>
		    </form>
		  </div>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
<script>
function buttonPress(x){
	/* var id = event.srcElement.id
	var array = id.split("update");
	alert(x); */
	
	var itemId = "itemId" + x;
	var itemName = "itemName" + x;
	var itemQuantity = "itemQuantity" + x;
	var itemPrice = "itemPrice" + x;
	
	document.getElementById("updatedId").value = document.getElementById(itemId).value;
	document.getElementById("name").value = document.getElementById(itemName).value;
	document.getElementById("quantity").value = document.getElementById(itemQuantity).value;
	document.getElementById("price").value = document.getElementById(itemPrice).value;
	
	var modal1 = document.getElementById("modal1");
	var modalUpdate = document.getElementById("modalUpdate");
	modal1.style.display = "block";
	modalUpdate.style.display = "block";
	
	var span = document.getElementById("spanUpdate");

	span.onclick = function() {
		modal1.style.display = "none";
		modalUpdate.style.display = "none";
	}

	window.onclick = function(event) {
	  if (event.target == modal1) {
		modal1.style.display = "none";
		modalUpdate.style.display = "none";
	  }
	}
}

function cobaNihDiConsole(data){
	//var id = event.srcElement.id;
}


</script>
</html>
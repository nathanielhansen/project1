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
  width: 80%;
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
</style>

<title>Insert title here</title>
</head>
<body>
	<div>
		<c:choose>
			<c:when test="${listStock != null}">
				<table id="listTable">
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Quantity</th>
						<th>Price</th>
					</tr>
					<c:set var="num" value = "1" scope="page"/>
					<c:forEach var="item" items="${listStock }">
						<tr>
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
							<td><input type="button" id="update${num}" value="Update" onclick="buttonPress()"/></td>
							<c:set var="num" value="${num+1}" scope="page"/>
						</tr>
					</c:forEach>
				</table>
			</c:when>
			<c:otherwise>
				<c:out value="There is no data!"></c:out>
			</c:otherwise>
		</c:choose>
		<a href="${pageContext.request.contextPath}/create">
			<input type="button"value="Create"/>
		</a>
	</div>
	<div id="modal1" class="modal">
		  <div id="modalUpdate" class="modal-content" align="center">
		    <span class="close" id="spanUpdate">&times;</span>
		    <p align="center">Update Product</p>
		    <form action="update" method="post">
			    <table>
			    	<tr>
						<td>Product Name</td>
						<td>:</td>
						<td><input type="text" id="name" name="name" required="required"><input type="hidden" id="updatedId" name="updatedId"/></td>
					</tr>
					<tr>
						<td>Quantity</td>
						<td>:</td>
						<td><input type="number" id="quantity" name="quantity" required="required"></td>
					</tr>
					<tr>
						<td>Price</td>
						<td>:</td>
						<td><input type="number" id="price" step="0.01" min="0" name="price" required="required"></td>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<input type="submit" name="update" value="Save"/>
							<input type="submit" name="delete" value="Delete"/>
						</td>
					</tr>
			    </table>
		    </form>
		  </div>
	</div>
</body>
<script>
function buttonPress(){
	var id = event.srcElement.id
	var array = id.split("update");
	
	var itemId = "itemId" + array[1];
	var itemName = "itemName" + array[1];
	var itemQuantity = "itemQuantity" + array[1];
	var itemPrice = "itemPrice" + array[1];
	
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
</script>
</html>
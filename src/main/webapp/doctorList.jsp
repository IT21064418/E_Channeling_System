<%@ page language="java" contentType="text/html; charset=charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Future Doc - Admin Section</title>
   
   <!-- CSS Styles -->
   <style>
	   	@charset "ISO-8859-1";
	
		*{
		   font-family: Arial, sans-serif;
		   margin: 0;
		   padding: 0;  
		}
		
		/*---- sub header ----*/
		
		.sub-header{
			height: 300px;
			width: 100%;
			background-image: linear-gradient(rgba(4,9,30,0.7),rgba(4,9,30,0.7)),
			url(subbanner.png);
			background-position: center;
			background-size: cover;
			text-align: center;
			color: #fff;
		}
		
		.sub-header h1{
			margin-top: 30px;
		}
		
		nav{
			display: flex;
			padding: 2% 6%;
			justify-content: space-between;
			align-items: center;
		}
		
		nav{
			display: flex;
			padding: 2% 6%;
			justify-content: space-between;
			align-items: center;
		}
		
		nav img{
			width: 150px;
		}
		
		.nav-links{
			flex: 1;
			text-align: right;
		}
		
		.nav-links ul li{
			list-style: none;
			display: inline-block;
			padding: 8px 12px;
			position: relative;
		}
		
		.nav-links ul li a{
			color: #fff;
			text-decoration: none;
			font-size: 13px;
		}
		
		.nav-links ul li::after{
			content:'';
			width: 0%;
			height: 2px;
			background: #F8FD02;
			display: block;
			margin: auto;
			transition: 0.5s;
		}
		
		.nav-links ul li:hover::after{
			width: 100%;
		}
		
		
		h1{
			font-size: 36px;
			font-weight: 600;
		}
		
		p{
			color: #777;
			font-size: 14px;
			font-weight: 300;
			line-height: 22px;
			padding: 10px;
		}
		
		h3{
			text-align: center;
			font-weight: 600;
			margin: 10px 0;	
		}
		
			
		/*--- Admin feedback  ---*/
		
		.admin-content {
			height: calc(100% -200px);
			padding: 40px 100px 100px;
		}
		
		.admin-btn{
			display: inline-block;
			text-decoration: none;
			color: #333;
			border: 1px solid #063970;
			padding: 12px 34px;
			font-size:  13px;
			background: transparent;
			position: relative;
			cursor: pointer;
		}
		
		.admin-btn:hover {
			border: 1px solid #F8FD02;
			background: #F8FD02;
		    transition: 1s;	
		}
		
		.admin-btn a {
			color: #333;
			text-decoration: none;
			font-size: 13px;
		}
		
		.content table {
			margin-top: 50px;
			width: 100%;
			border-collapse: collapse;
			font-size: 1.1 ren;
			border-top: 1px solid blue;
			border-bottom: 1px solid blue;
		}
		
		.content table td {
			padding: 15px;
			text-align: left;
			border-top: 1px solid #F8FD02;
		}
		
		.content table th {
			padding: 15px;
			text-align: left;
			border-bottom: 1px solid blue;
		}
		
		.update{
			color: #333;
			text-decoration: none;	
		}
		
		.delete{
			color: red;
			text-decoration: none;	
		}
		
		.update:hover {
			text-decoration: underline;
		}
		
		.delete:hover {
			text-decoration: underline;
		}
		
		/*--- add flight page ---*/
		
		.new-flight{
			margin-top: 50px;
		}
		
		.content input{
			margin-top: 5px;
			width: 100%;
			padding: 15px;
			margin-bottom: 17px;
			outline: none;
			border: 1px solid #063970;
		}
		
		/*--- add staff account page ---*/
		
		.add-account{
			margin-top: 50px;
		}
   </style>
   
</head>
<body>
<!--header-->
   <section class="sub-header">
     <nav>
        <!-- <a href=""><img src="https://image.flaticon.com/icons/png/512/3/3901.png" /></a> -->
		<!-- nav bar -->
		<div class="nav-links" >
		    <ul>
			    <li><a href="">REPORTS</a></li>
				<li><a href="">USERS</a></li>
				<li><a href="">HOSPITALS</a></li>
				<li><a href="addDoctors.jsp">DOCTORS</a></li>
			</ul>	
		</div>		
	 </nav>
	 <h1>MANAGE DOCTORS</h1>
   </section>

<!--- Doctor accounts page content ---> 
        
   <section class="admin-content">
   
     <!--- Admin buttons --->	 
     <div class="flight-btn">
	    <a href="addDoctors.jsp" class="admin-btn"> Add Doctor </a>
		<a href="<%=request.getContextPath()%>/list" class="admin-btn"> Doctor List </a>
     </div>

     <div class="content">
	 
	    <!--- Doctor table --->
		<table>
			<thead>
				 <tr>
				 	<th> Doctor ID </th>
					 <th> Name </th>
					 <th> Specialization </th>
					 <th> Email </th>
					 <th> Contact No </th>
					 <th> Hospital </th>
					 <th> Action </th>
				 </tr>
			</thead>
			<tbody>
				<c:forEach var="listDoctor" items="${listDoctor}">
				
					 <tr>
						 <td><c:out value="${listDoctor.dID}" /></td>
						 <td><c:out value="${listDoctor.dName}" /></td>
						 <td><c:out value="${listDoctor.dSpec}" /></td>
						 <td><c:out value="${listDoctor.dEmail}" /></td>
						 <td><c:out value="${listDoctor.dContactNo}" /></td>
						 <td><c:out value="${listDoctor.dHospital}" /></td>
						 <td><a href="edit?dID=<c:out value='${listDoctor.dID}' />" class="update">Update</a>
						 &nbsp;&nbsp;&nbsp;&nbsp; <a 
						 href="delete?dID=<c:out value='${listDoctor.dID}' />" class="delete">Delete</a></td>
					 </tr>
					  
				 </c:forEach>                    
			</tbody>
		 </table>
		 <!-- end of doctor table -->
		 		
     </div>	 
   </section> 
</body>
</html>
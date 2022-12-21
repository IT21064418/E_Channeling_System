<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Future Doctor - Admin Section</title>
   <link rel="stylesheet" href="admin.css">
   
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
<!-- End of CSS Styles -->

</head>
<body>
<!--header-->
   <section class="sub-header">
     <nav>
        <!--  <a href=""><img src="LOGO.png"></a> -->
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
	 <h1>	
	 	<c:if test="${doctor != null}">
	 	UPDATE DOCTOR
	 	</c:if>
	 	<c:if test="${doctor == null}">
	 	ADD DOCTOR
	 	</c:if>
	 </h1> 
   </section>

<!--- Add Doctor page content --->    
    
   <section class="admin-content">
   
     <!--- Admin buttons --->
     <div class="flight-btn">
	    <a href="addDoctor.jsp" class="admin-btn"> Add Doctor </a>
		<a href="<%=request.getContextPath()%>/list" class="admin-btn"> Doctor List </a>
     </div>
     	 
     <div class="content">
	 
	     <!--- add / update doctor form --->
	     <c:if test="${doctor != null}">
	     	<form action="update" class="add-account" method="post"> 
	     </c:if>
	     <c:if test="${doctor == null}">
	     	<form action="insert" class="add-account" method="post">
	    </c:if>
	    	
	    	<c:if test="${doctor != null}">
	    		<input type="hidden" name= "dID" value="<c:out value='${doctor.dID}' />"/>
	    	</c:if>
	    	
		    <label class="input-label">Enter Doctor Name: </label>
		    <input type="text" id="name" name="dName" value="<c:out value='${doctor.dName}' />" class="txt-input" required>
			
			<label class="input-label">Enter email: </label>
		    <input type="email" id="email" name="dEmail" value="<c:out value='${doctor.dEmail}' />" class="txt-input" required>
								
		    <label class="input-label">Specialization: </label>
		    <input type="text" id="spec" name="dSpec" value="<c:out value='${doctor.dSpec}'/>" class="txt-input" required>
			
			<label class="input-label">Contact No: </label>
		    <input type="text" id="contactNo" name="dContactNo" pattern=".{10}" title="10 Digits required!" value="<c:out value='${doctor.dContactNo}' />" class="txt-input" required>
		    
		    <label class="input-label">Hospital: </label>
		    <input type="text" id="hospital" name="dHospital" value="<c:out value='${doctor.dHospital}' />" class="txt-input" required>
		
		    <button type="reset" class="admin-btn"> Clear </button>
		    <button type="submit" name = "submit" class="admin-btn"> Save Doctor </button>
		</form>
		<!-- end of doctor form  -->
		
     </div>	
	 
   </section>
   
</body>
</html>
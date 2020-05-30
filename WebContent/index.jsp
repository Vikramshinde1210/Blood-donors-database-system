<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="myweb.db" %>
    <%@ page errorPage="wentWrong.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="description" content="Blood Donors Database System">
  <meta name="keywords" content="blood bank,hospital,donors,blood donation,blood donors">
<title>Home Page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body, html {
  height: 100%;
  margin: 0;
  font-family: Arial;
}
.centered {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.bg {
  /* The image used */
  background-image: url("https://www.wellthy.care/wp-content/uploads/2017/12/Untitled-design-2-e1516466610281.jpg");

  /* Full height */
  height: 80%; 

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  max-width:100%;
}
* {
  box-sizing: border-box;
}

form.example input[type=text] {
  padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 100%;
  background: #f1f1f1;
  
}

select{
padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 100%;
  background: #f1f1f1;
}

form.example button {
  float: left;
  width: 20%;
  padding: 10px;
  background: #2196F3;
  color: white;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none;
  cursor: pointer;
}

form.example button:hover {
  background: #0b7dda;
}
.bottom-left {
  position: absolute;
  bottom: 8px;
  left: 16px;
}
.bottom-right {
  position: absolute;
  bottom: 8px;
  right: 16px;
}

form.example::after {
  content: "";
  clear: both;
  display: table;
}
table {
  border-collapse: collapse;
  width: 100%;
}
.col-75 {
  float: center;
  width: 75%;
  margin-top: 6px;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
<div class="w3-top">
  <div class="w3-row w3-large w3-light-grey">
    <div class="w3-col s3">
      <a href="index.jsp" class="w3-button w3-block">Home</a>
    </div>
    <div class="w3-col s3">
      <a href="blood.jsp" class="w3-button w3-block"><img width=20 height=15 src="data:image/jpeg;base64,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">Bank</a>
       </div>
    <div class="w3-col s3">
      <a href="hospital.jsp" class="w3-button w3-block">Hospital</a>
    </div>
    <div class="w3-col s3">
      <a href="login.jsp" class="w3-button w3-block">Login</a>
    </div>
  </div>
</div>
<br>
<br>
<div class="container p-3 text-center">
<h2><b><i>We make a living by what we get. We make a life by what we give.</i></b></h2>
<a href="register.jsp"><img src="https://ichef.bbci.co.uk/news/1024/cpsprodpb/182FF/production/_107317099_blooddonor976.jpg" class="img-fluid"/></a>
<a href="register.jsp"><img alt="register" src="https://www.friends2support.org/imgs/landingpage/register.gif" class="img-fluid"/></a>
<p>Click on above image to start registration</p>

</div>


<div class="container p-3 text-center">
<h2 align="center">Find Donor In Your City</h2>

    
    
  
  
  



<form class="example" action="index.jsp" method="post">

   
  <input type="text" placeholder="Enter City" name="search" required>
  <h2>Select Blood group</h2>
   <select  id="blood" name="blood" required>
    <option value="">None</option>
	<option value="A+">A+</option>
	<option value="A-">A-</option>
	<option value="A1+">A1+</option>
	<option value="A1-">A1-</option>
	<option value="A1B+">A1B+</option>
	<option value="A1B-">A1B-</option>
	<option value="A2+">A2+</option>
	<option value="A2-">A2-</option>
	<option value="A2B+">A2B+</option>
	<option value="A2B-">A2B-</option>
	<option value="AB+">AB+</option>
	<option value="AB-">AB-</option>
	<option value="B+">B+</option>
	<option value="B-">B-</option>
	<option value="O+">O+</option>
	<option value="O-">O-</option>
      </select>
      <br><br>
      <input type="submit" value="Search" onchange="this.form.submit()" >
      
      
      
    
</form>
</div>


<br>

<%
try
{   int count=1;
	db d=new db();
	Connection con=d.getConnection();
	Statement stm=con.createStatement();
	//ResultSet rs=stm.executeQuery("select * from donor where blood=\""+request.getParameter("blood")+"\"and lower(city) like '%"+request.getParameter("search")+"%' or upper(city) like '%"+request.getParameter("search")+"%' or concat(upper(substring(city,1,1)),lower(substring(city,2))) like '%"+request.getParameter("search")+"%'");
	ResultSet rs=stm.executeQuery("select * from donor where blood=\""+request.getParameter("blood")+"\"and concat(upper(substring(city,1,1)),lower(substring(city,2))) like '%"+request.getParameter("search")+"%'");

	while(rs.next())
	{   
		if(count==1)
		{
			%>
			<table border="1">
				<tr>
    				<th>Name</th>
     				<th>Last Donation Date</th>
     				<th>Contact Number</th>
				</tr>
			<%
			count=count+1;
		}
		%>
		<tr>
       <td><%= rs.getString("name") %></td>
       <td><%= rs.getString("donation") %></td>
       <td><%= rs.getString("mob") %></td>
       </tr>
		
		<%
	}
	rs.close();
	con.close();

}
catch(Exception e)
{
	e.printStackTrace();
}


%>




</table>

<footer class="w3-container w3-padding-32 w3-light-grey w3-center">
  <p>&copy; 2020 lifesaver.azurewebsites.net<p>
  <a href="#" class="w3-button w3-black w3-margin"><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
  </footer>
</body>
</html>
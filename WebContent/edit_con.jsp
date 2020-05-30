<%@page import="myweb.tp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="myweb.db"%>
<%@page import="myweb.edit1"%>
<%@page import="myweb.User_Bean"%>
<%@ page errorPage="wentWrong.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String user=request.getParameter("user");
String pass=request.getParameter("pass");

String name=request.getParameter("fname");
String country=request.getParameter("country");
String state=request.getParameter("state");
String city=request.getParameter("city");
String donation=request.getParameter("date");
String mob=request.getParameter("mob");


User_Bean u1=new User_Bean();
u1.setName(name);
u1.setCountry(country);
u1.setState(state);
u1.setCity(city);
u1.setDonation(donation);
u1.setMob(mob);
u1.setUser(user);
u1.setPassword(pass);
tp t1=new tp();
t1.edit(u1);



%>

<script type="text/javascript">
window.location.href="login.jsp"
</script>
</body>
</html>
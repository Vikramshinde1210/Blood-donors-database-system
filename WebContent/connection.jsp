<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="myweb.insertValues" %>
    <%@ page errorPage="wentWrong.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String nm=request.getParameter("fname");
String bl=request.getParameter("blood");
String cou=request.getParameter("country");
String state=request.getParameter("state");
String city=request.getParameter("city");
String date=request.getParameter("date");
String mob=request.getParameter("mob");
String user=request.getParameter("user");
String pass=request.getParameter("pass");



insertValues i1=new insertValues();
i1.insert(nm,bl,cou,state,city,date,mob,user,pass);



%>
<script type="text/javascript">
window.location.href="redirect.html"
</script>
</body>
</html>
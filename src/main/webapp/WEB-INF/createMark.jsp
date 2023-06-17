<%--
  Created by IntelliJ IDEA.
  User: Eden
  Date: 6/13/2023
  Time: 9:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Mark</title>
</head>
<body>
<h1>Create Mark</h1>
<%-- Display success or error message if available --%>
<% if (request.getAttribute("success") != null) { %>
<p style="color: green;"><%= request.getAttribute("success") %></p>
<% } else if (request.getAttribute("error") != null) { %>
<p style="color: red;"><%= request.getAttribute("error") %></p>
<% } %>

<form method="post" action="createmark.php?page=creatMark">
    <input type="hidden" name="page" value="createmark">

    <label for="student_name">Student Name:</label>
    <input type="text" name="student_name" id="student_name" required><br><br>

    <label for="score">Score:</label>
    <input type="number" name="score" id="score" required><br><br>

    <button type="submit">Create</button>
</form>

<br>
<a href="listmarks.php?action=list">View All Marks</a>
</body>
</html>


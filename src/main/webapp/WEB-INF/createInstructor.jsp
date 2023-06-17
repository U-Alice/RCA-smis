<%--
  Created by IntelliJ IDEA.
  User: Eden
  Date: 6/11/2023
  Time: 8:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Create Instructor</title>
</head>
<body>
<h1>Create Instructor</h1>
<form action="createInstructor.php?page=createInstructor" method="post" >
  <label for="firstName">First Name:</label>
  <input type="text" id="firstName" name="firstName" required><br>

  <label for="lastName">Last Name:</label>
  <input type="text" id="lastName" name="lastName" required><br>

  <label for="salary">Salary:</label>
  <input type="number" id="salary" name="salary" required><br>

  <label for="remunerationDate">Remuneration Date:</label>
  <input type="date" id="remunerationDate" name="remunerationDate" required><br>

  <input type="submit" value="Create Instructor">
</form>
</body>
</html>


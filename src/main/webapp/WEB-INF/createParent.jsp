<%--
  Created by IntelliJ IDEA.
  User: Eden
  Date: 6/13/2023
  Time: 8:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Parent</title>
</head>
<body>
<h1>Create Parent</h1>
<form action="createparent.php?page=creatParent" method="post">
    <label for="firstName">First Name:</label>
    <input type="text" id="firstName" name="firstName" required><br>

    <label for="lastName">Last Name:</label>
    <input type="text" id="lastName" name="lastName" required><br>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br>

    <input type="submit" value="Create Parent">
</form>
</body>
</html>


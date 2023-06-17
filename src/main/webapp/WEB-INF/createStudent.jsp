<%--
  Created by IntelliJ IDEA.
  User: Eden
  Date: 6/13/2023
  Time: 8:06 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <meta charset="UTF-8">
    <title>Create Student</title>
</head>
<body>
<h1>Create Student</h1>
<form action="createstudent.php?page=createStudent" method="post" style="width:100vw; display: flex; align-items: center; justify-items: center">
    <div style="width: 30%;">


    <div class="form-group">

    <label for="firstName">First Name:</label>
    <input type="text"  class="form-control" id="firstName" name="firstName" required><br>
    <small id="emailHelp" class="form-text text-muted">We'll never share your info with anyone else.</small>
    </div>

    <div class="form-group">

    <label for="lastName">Last Name:</label>
    <input type="text" class="form-control"  id="lastName" name="lastName" required><br>
    </div>

    <div class="form-group">

    <label for="dateOfBirth">Date of Birth:</label>
    <input type="date" class="form-control"  id="dateOfBirth" name="dateOfBirth" required><br>
    </div>

    <div class="form-group">

    <label for="phoneNumber">Phone Number:</label>
    <input type="text" class="form-control"  id="phoneNumber" name="phoneNumber" required><br>
    </div>

    <div class="form-group">

    <label for="studentId">Student ID:</label>
    <input type="text" class="form-control"  id="studentId" name="studentId" required><br>

    </div>

    <div class="form-group">

    <label for="major">Major:</label>
    <input type="text" class="form-control"  id="major" name="major" required><br>
    </div>

    <input type="submit" value="Create Student" class="bg-dark" style="color: white">
    </div>
</form>
</body>
</html>


<%--
  Created by IntelliJ IDEA.
  User: Eden
  Date: 5/16/2023
  Time: 7:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Create Course</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500&display=swap" rel="stylesheet">
  <style>
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      background-color: #f2f2f2;

    }

    form {
      background-color: #ffffff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);

    }

    .form-group {
      margin-bottom: 20px;
    }

    label {
      font-weight: bold;
      color: #333333;
    }

    .form-control {
      display: block;
      width: 100%;
      height: calc(1.5em + 0.75rem + 2px);
      padding: 0.375rem 0.75rem;
      font-size: 1rem;
      font-weight: 400;
      line-height: 1.5;
      color: #333333;
      background-color: #ffffff;
      background-clip: padding-box;
      border: 1px solid #ced4da;
      border-radius: 0.25rem;
      transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    }

    .form-control:focus {
      color: #333333;
      background-color: #ffffff;
      border-color: #80bdff;
      outline: 0;
      box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
      /*border: 2px solid red;*/
    }

    .btn-primary {
      color: #ffffff;
      background-color: #007bff;
      border-color: #007bff;
    }

    .btn-primary:hover {
      color: #ffffff;
      background-color: #0069d9;
      border-color: #0062cc;
    }

    .text-center {
      text-align: center;
    }
  </style>

</head>
<body>
<div class="container">
  <h2>Create Course</h2>
  <c:if test="${error != null}">
    <p>
      <span style="color: red"> ${error}</span>
    </p>
  </c:if>
  <c:if test="${success != null}">
    <p>
      <span style="color: green"> ${success}</span>
    </p>
  </c:if>

  <div class="col form-container">
    <form action="createcourse.php?page=createcourse" method="post">
    <div class="form-group" >
      <label for="name">Name:</label>
      <input type="text" class="form-control" id="name" name="name" required>
    </div>
    <div class="form-group">
      <label for="code">Code:</label>
      <input type="text" class="form-control" id="code" name="code" required>
    </div>
    <div class="form-group">
      <label for="min">Minimum Number of Students:</label>
      <input type="number" class="form-control" id="min" name="min" required>
    </div>
    <div class="form-group">
      <label for="max">Maximum Number of Students:</label>
      <input type="number" class="form-control" id="max" name="max" required>
    </div>
    <div class="form-group">
      <label for="start">Start Date:</label>
      <input type="date" class="form-control" id="start" name="start" required>
    </div>
    <div class="form-group">
      <label for="end">End Date:</label>
      <input type="date" class="form-control" id="end" name="end" required>
    </div>
    <div class="text-center">
      <button type="submit" class="btn btn-primary">Create </button>
    </div>

      <button>
        <p>
          <a href="listcourse.php?page=courses&&action=list">
            All Courses
          </a>
        </p>
      </button>
  </form>
  </div>



</div>
</body>
</html>
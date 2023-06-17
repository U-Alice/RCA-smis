<%--
  Created by IntelliJ IDEA.
  User: Eden
  Date: 6/10/2023
  Time: 9:07 PM
  To change this template use File | Settings | File Templates.
--%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"/>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
     <style><%@include file="/cssfile.css" %></style>
    <link rel="stylesheet" href="css/displaytag.css" type="text/css" />
    <link rel="stylesheet" href="css/screen.css" type="text/css" />
    <link rel="stylesheet" href="css/site.css" type="text/css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <title>Course Registrations</title>
    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #ddddd;
            text-align: left;
            padding: 8px;
        }

        thead{
            background-color: #008dd4;
            color: white;
            font-family: 'Quicksand', sans-serif;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div id="layout">
    <div id="banner">
        <div class="bannerlogo"></div>
        <div class="text_header">RCA Management Information System</div>
        <div class="right" style="text-align: right;">
            <c:if test="${authenticatedUser !=null}">
                <b> <a
                        href="listuser.php?page=profile&&id=${authenticatedUser.id}"><button>Profile
                </button></a> | <img src="icons/cou.png" /> <font color="#ffffff">${authenticatedUser.userRole}:
                        ${authenticatedUser.username}</font> | <a href="login.ap?page=logout"><font
                        color="#ffffff">Logout</font></a>
                </b>
            </c:if>
            <c:if test="${authenticatedUser ==null}">
                <div class="menu" align="left">
                    | <a href="login.php?">Login</a> |
                </div>
            </c:if>
        </div>
    </div>
    <div>
        <%@ include file="menu.jsp"%>
    </div>
    <div id="middle">
        <c:if test="${authenticatedUser !=null}">
            <div class="options">

                <a href="createstudent.php?page=createstudent.php"><button>
                    <img src="icons/add.png" /> New Student Registration
                </button></a>
            </div>
            <div class="search">
                <form action="liststudents.php?page=liststudents.php" method="get">
                    <table>
                        <tr>
                            <td style="color: #000000;">Enter Student ID</td>
                            <td><input type="text" name="id" id="id" /></td>
                            <td><input type='submit' name="Search"
                                       value='search' /></td>
                        </tr>
                    </table>
                </form>
            </div>
            <hr />
            <table style="border: 0;">
                <td align="left"><input type="text" size="15"
                                        maxlength="50" readonly="readonly" name="savedBy" id="savedBy"
                                        hidden="hidden" value="${authenticatedUser.id}" /></td>


                <table class="table">
                    <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Phone Number</th>

                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${students}" var="student">
                        <tr>
                            <td>${student.id}</td>
                            <td>${student.firstName}</td>
                            <td>${student.lastName}</td>
                            <td>${student.phoneNumber}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty students}">
                        <tr>
                            <td colspan="4">No students found.</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </table>
        </c:if>
    </div>
    <%@ include file="footer.jsp"%>


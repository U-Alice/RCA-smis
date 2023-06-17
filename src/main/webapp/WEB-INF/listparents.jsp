<%--
  Created by IntelliJ IDEA.
  User: Eden
  Date: 6/13/2023
  Time: 8:27 PM
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

                <a href="createInstructor.php?page=creatInstructor"><button>
                    <img src="icons/add.png" /> New Instructor Registration
                </button></a>
            </div>
            <div class="search">
                <form action="listinstructor.php" method="get">
                    <table>
                        <tr>
                            <td style="color: #000000;">Enter Instructor ID</td>
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


                <table>
                    <thead>
                    <tr>
                        <th>Parent ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Student</th>
                        <th>Phone Number</th>

                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${parents}" var="parent">
                        <tr>
                            <td>${parent.parentId}</td>
                            <td>${parent.firstName}</td>
                            <td>${parent.lastName}</td>
                            <td>${parent.student}</td>
                            <td>${parent.phoneNumber}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty parents}">
                        <tr>
                            <td colspan="5">No parents found.</td>
                        </tr>
                    </c:if>

                    </tbody>
                </table>
            </table>
        </c:if>
    </div>
    <%@ include file="footer.jsp"%>




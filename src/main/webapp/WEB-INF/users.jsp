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
<title>User Registrations</title>
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
							</button></a> | <img src="icons/user.png" /> <font color="#ffffff">${authenticatedUser.userRole}:
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

					<a href="createuser.php?page=createuser"><button>
							<img src="icons/user_add.png" /> New User Registration
						</button></a>
				</div>
				<div class="search">
					<form action="listuser.php" method="get">
						<table>
							<tr>
								<td style="color: #000000;">Enter User ID</td>
								<td><input type="text" name="id" id="id" /></td>
								<td><input type='submit' name="userregistrationsearch"
									value='search' /></td>
							</tr>
						</table>
					</form>
				</div>
				<hr />
				<form action="listuser.php?page=statusapproval" method="post">
					<fieldset>
						<table style="border: 0;">
							<tr>
								<td align="left"><input type="text" size="15"
									maxlength="50" readonly="readonly" name="savedBy" id="savedBy"
									hidden="hidden" value="${authenticatedUser.id}" /></td>
								
								<td><select name="userRole" id="userRole">
										<option selected="selected" value="NONE">Select Role</option>
										<c:forEach items="${userRoles}" var="usrRole"
											varStatus="usrRolestatus">
											<option value="${usrRole}">
												<c:out value="${usrRole.getRoleDescription()}" />
											</option>
										</c:forEach>
								</select></td>
								<td align="right"><input type="submit"
									name="saveDataUserStatus" value="Save Status" /></td>
							</tr>
						</table>

						<table class="table">
							<thead>
								<tr>
									<td scope="col">ID</td>
									<td scope="col">Name</td>
									<td scope="col">Email</td>
									<td scope="col">Role</td>
									<td scope="col">Check User</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${users}" var="usr" varStatus="usrstatus">
									<tr>
										<td scope="row">${usr.id}</td>
										<td>${usr.fullName}</td>
										<td>${usr.email}</td>
										<td>${usr.userRole.getRoleDescription()}</td>
										<td><input type="checkbox" name="usrIds"
											value="${usr.id}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</fieldset>
				</form>
			</c:if>
		</div>
		<%@ include file="footer.jsp"%>
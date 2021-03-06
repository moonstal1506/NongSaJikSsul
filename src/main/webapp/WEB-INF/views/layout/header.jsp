<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<!DOCTYPE html>
<html lang="en">
<head>
<title>λμ¬μ§μ€</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-light navbar-light" >
		<a class="navbar-brand" href="/"><strong>πΎλμ¬μ§μ€πΎ</strong></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
		    <ul class="navbar-nav">
            	<li class="nav-item"><a class="nav-link" href="/shop">λμ°λ¬Όμ§κ±°λ</a></li>
            	<li class="nav-item"><a class="nav-link" href="/agriculture/tech">λμκΈ°μ </a></li>
            	<li class="nav-item"><a class="nav-link" href="/agriculture/calculator">λμ½κ³μ°</a></li>
            </ul>
			<c:choose>
				<c:when test="${empty principal }">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="/auth/loginForm">λ‘κ·ΈμΈ</a></li>
						<li class="nav-item"><a class="nav-link" href="/auth/joinForm">νμκ°μ</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="navbar-nav">
					    <li class="nav-item"><a class="nav-link" href="/feed">νΌλ</a></li>
					    <li class="nav-item"><a class="nav-link" href="/user/${principal.user.id}">λ§μ΄νμ΄μ§</a></li>
						<li class="nav-item"><a class="nav-link" href="/board/saveForm">κΈμ°κΈ°</a></li>
						<li class="nav-item"><a class="nav-link" href="/admin/item/new">μν λ±λ‘</a></li>
						<li class="nav-item"><a class="nav-link" href="/admin/items">μν κ΄λ¦¬</a></li>
						<li class="nav-item"><a class="nav-link" href="/cart">μ₯λ°κ΅¬λ</a></li>
						<li class="nav-item"><a class="nav-link" href="/orders">κ΅¬λ§€μ΄λ ₯</a></li>
						<li class="nav-item"><a class="nav-link" href="/user/updateForm">νμμ λ³΄</a></li>
						<li class="nav-item"><a class="nav-link" href="/logout">λ‘κ·Έμμ</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>

	</nav>
	<br />
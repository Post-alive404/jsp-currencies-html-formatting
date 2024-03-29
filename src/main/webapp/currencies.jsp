<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.text.*, com.epam.rd.jsp.currencies.CurrenciesOfCurrentTestCase" %>

<jsp:useBean id="currencies" class="com.epam.rd.jsp.currencies.CurrenciesOfCurrentTestCase" scope="request"/>

<!DOCTYPE html>

<html>
<head>
    <title>Currencies</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<header>
    <h1>Currencies</h1>
</header>
<ul>
    <c:forEach var="currency" items="${currencies.currencies}">
        <li><c:out value="${currency}"/></li>
    </c:forEach>
</ul>
</body>
</html>
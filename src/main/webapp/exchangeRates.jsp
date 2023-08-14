<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.text.*, com.epam.rd.jsp.currencies.CurrenciesOfCurrentTestCase" %>

<jsp:useBean id="currencies" class="com.epam.rd.jsp.currencies.CurrenciesOfCurrentTestCase" scope="request"/>

<!DOCTYPE html>
<html>
<head>
    <title>Exchange Rates</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<c:set var="from" value="from" scope="request" />
<c:set var="referenceCurrency" value="${param.get(from)}" scope="request"/>
<c:set var="listCurrencies" value="${currencies.getExchangeRates(referenceCurrency)}" scope="request" />
<header>
    <h1>Exchange Rates for ${referenceCurrency}</h1>
</header>
<table>
    <c:forEach var="currencyWithValue" items="${listCurrencies}">
        <c:if test="${!currencyWithValue.getKey().equals(referenceCurrency)}">
            <tr>
                <td>${currencyWithValue.getKey()}</td>
                <td>${currencyWithValue.getValue()}</td>
            </tr>
        </c:if>
    </c:forEach>
</table>
</body>
</html>
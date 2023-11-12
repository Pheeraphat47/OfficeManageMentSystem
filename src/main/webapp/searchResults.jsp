<%@ page import="sit.int202.classicmodels.entities.Office" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Search Results</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<h2 class="mt-5 text-center">Search Results</h2>
<div class="p-5">
    <table class="table table-bordered table-hover mt-5">
        <!-- Table header for search results -->
        <thead>
        <tr>
            <th>Office Code</th>
            <th>City</th>
            <th>Phone</th>
            <th>AddressLine1</th>
            <th>AddressLine2</th>
            <th>State</th>
            <th>Country</th>
            <th>PostalCode</th>
            <th>territory</th>
            <!-- Add other columns as needed -->
        </tr>
        </thead>
        <!-- Table body for search results -->
        <tbody>
        <c:forEach var="result" items="${requestScope.searchResults}">
            <tr>
                <td>${result.officeCode}</td>
                <td>${result.city}</td>
                <td>${result.phone}</td>
                <td>${result.addressLine1}</td>
                <td>${result.addressLine2}</td>
                <td>${result.state}</td>
                <td>${result.country}</td>
                <td>${result.postalCode}</td>
                <td>${result.territory}</td>
                <!-- Add other columns as needed -->
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>


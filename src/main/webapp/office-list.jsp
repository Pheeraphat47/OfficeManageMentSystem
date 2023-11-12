<%--
  Created by IntelliJ IDEA.
  User: P
  Date: 11/6/2023
  Time: 11:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Office-Employee</title>
</head>
<body>
<div class="container">
    <div class="row bg-primary">
        <h2>Classic Model Offices ::</h2>
    </div>
    <div class="row">
        <c:forEach items="${offices}" var="office">
            <div class="col-2 border border-secondary p-2 m-2
${office.officeCode == selectedOffice.id ? 'bg-warning' : ''}">
                <div>
                    <a href="office-list?officeCode=${office.officeCode}">
                            ${office.city}</a>, ${office.country}
                </div>
                <div> ${office.phone}</div>
            </div>
        </c:forEach>

        <br>
        <div class="row bg-light">
            <b>Employees ::</b>
        </div>
        <div class="row">
            <c:forEach items="${selectedOffice.employeeList}" var="employee">
                <div class="col-2 pl-2 m-2 border border-secondary rounded-pill">
                    <div> ${employee.firstName}
                            ${employee.lastName} - ${employee.jobTitle}
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

</body>
</html>

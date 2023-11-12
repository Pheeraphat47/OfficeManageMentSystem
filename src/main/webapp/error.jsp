<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Error Page</title>
</head>
<body>

<h2>Error Page</h2>

<%-- Display the error message if available --%>
<c:if test="${not empty requestScope.errorMessage}">
<p style="color: red;">${requestScope.errorMessage}</p>
</c:if>

<%-- Display stack trace if available --%>
<c:if test="${not empty requestScope.exception}">
<p style="color: red;">Exception Details:</p>
<pre><c:out value="${requestScope.exception}" /></pre>
</c:if>

<p>Please contact support for assistance.</p>
</html>




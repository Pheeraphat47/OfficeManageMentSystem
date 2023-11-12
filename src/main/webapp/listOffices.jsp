<%@ page import="sit.int202.classicmodels.entities.Office" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Office Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        body {
            padding-top: 56px; /* Adjust this value based on your navbar height */
        }

        /* custom scrollbar */
        ::-webkit-scrollbar {
            width: 12px;
        }

        ::-webkit-scrollbar-track {
            background: white;
        }

        ::-webkit-scrollbar-thumb {
            background: grey;
            border-radius: 25px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: dimgray;
        }
    </style>
</head>
<body>

<c:if test="${not empty requestScope.errorMessage}">
    <p style="color: red;">${requestScope.errorMessage}</p>
</c:if>

<nav class="navbar navbar-light bg-info fixed-top">
    <div class="container-fluid">
        <ul class="navbar-nav flex flex-row mx-auto fs-3 text-uppercase text-white">
            <li class="nav-item ms-4">
                <a class="nav-link" href="#">Home</a>
            </li>
            <li class="nav-item ms-4">
                <a class="nav-link" href="#insert">Insert</a>
            </li>
            <li class="nav-item ms-4">
                <a class="nav-link" href="#delete">Delete</a>
            </li>
            <li class="nav-item ms-4">
                <a class="nav-link" href="#update">Update</a>
            </li>
            <li class="nav-item ms-4">
                <a class="nav-link" href="#search">Search</a>
            </li>
        </ul>
    </div>
</nav>




<div class="p-5">
    <h2 class="text-center mt-5 text-uppercase fw-bold">Office List Table</h2>
    <table class="table table-bordered table-hover mt-5">
        <!-- Table header -->
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
        <!-- Table body -->
        <tbody>
        <c:forEach var="office" items="${requestScope.offices}">
            <tr>
                <td>${office.officeCode}</td>
                <td>${office.city}</td>
                <td>${office.phone}</td>
                <td>${office.addressLine1}</td>
                <td>${office.addressLine2}</td>
                <td>${office.state}</td>
                <td>${office.country}</td>
                <td>${office.postalCode}</td>
                <td>${office.territory}</td>
                <!-- Add other columns as needed -->
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


<!-- Insert Form -->
<br id="insert">
<section>
    <h3 class="mb-5 mt-5 text-center text-uppercase fw-bold">Insert Office</h3>
    <form action="ListOfficesServlet" method="post" class="border border-1 rounded p-5 m-5">
        <div class="mb-3 fw-bold">
            <label class="form-label">Office Code</label>
            <input type="text" name="officeCode" class="form-control" required>
        </div>
        <div class="mb-3 fw-bold">
            <label class="form-label"> City</label>
            <input type="text" name="city" class="form-control" required>
        </div>
        <div class="mb-3 fw-bold">
            <label class="form-label"> Phone</label>
            <input type="text" name="phone" class="form-control" required>

        </div>
        <div class="mb-3 fw-bold">
            <label class="form-label">AddressLine 1</label>
            <input type="text" name="addressLine1" class="form-control" required>
        </div>
        <div class="mb-3 fw-bold">
            <label class="form-label">AddressLine 2</label>
            <input type="text" name="addressLine2" class="form-control">
        </div>
        <div class="mb-3 fw-bold">
            <label class="form-label">State </label>
            <input type="text" name="state" class="form-control">
        </div>
        <div class="mb-3 fw-bold">
            <label class="form-label"> Country</label>
            <input type="text" name="country" class="form-control" required>
        </div>
        <div class="mb-3 fw-bold">
            <label class="form-label"> Postcode</label>
            <input type="text" name="postalCode" class="form-control" required>
        </div>
        <div class="mb-3 fw-bold">
            <label class="form-label"> Territory</label>
            <input type="text" name="territory" class="form-control" required>
        </div>
        <!-- Add other fields as needed -->
        <input type="hidden" name="action" value="insert">
        <input type="submit" value="Insert" class="btn btn-success form-control mt-4 fw-bold">
    </form>
</section>

<!-- Delete Form -->
<br id="delete">
<section>
    <h3 class="mb-5 mt-5 text-center text-uppercase fw-bold">Delete Office</h3>
    <form action="ListOfficesServlet" method="post" class="border border-1 rounded p-5 m-5">
        <div class="mb-3 fw-bold">
            <label class="form-label"> Office Code</label>
            <input type="text" name="deleteOfficeCode" class="form-control" required>
        </div>
        <br>
        <input type="hidden" name="action" value="delete">
        <input type="submit" class="btn btn-danger form-control mt-4 fw-bold" value="Delete">
    </form>
</section>

<!-- Update Form -->
<br id="update">
<section>
    <h3 class="mb-5 mt-5 text-center text-uppercase fw-bold">Update Office</h3>
    <form action="ListOfficesServlet" method="post" class="border border-1 rounded p-5 m-5">
        <div class="mb-3 fw-bold">
            <label class="form-label"> Office Code </label>
            <input type="text" name="updateOfficeCode" class="form-control" required>
        </div>
        <div class="mb-3 fw-bold">
            <label class="form-label">New City </label>
            <input type="text" name="newCity" class="form-control">
        </div>
        <div class="mb-3 fw-bold">
            <label class="form-label">New Phone</label>
            <input type="text" name="newPhone" class="form-control">
        </div>
        <div class="mb-3 fw-bold">
            <label class="form-label">New AddressLine 1</label>
            <input type="text" name="newAddressLine1" class="form-control">
        </div>
        <div class="mb-3 fw-bold">
            <label class="form-label">New AddressLine 2</label>
            <input type="text" name="newAddressLine2" class="form-control">
        </div>
        <div class="mb-3 fw-bold">
            <label class="form-label">New State</label>
            <input type="text" name="newState" class="form-control">
        </div>
        <div class="mb-3 fw-bold">
            <label class="form-label">New Country</label>
            <input type="text" name="newCountry" class="form-control">
        </div>
        <div class="mb-3 fw-bold">
            <label class="form-label">New Postcode</label>
            <input type="text" name="newPostcode" class="form-control">
        </div>
        <div class="mb-3 fw-bold">
            <label class="form-label">New Territory</label>
            <input type="text" name="newTerritory" class="form-control">
        </div>


        <!-- Add other fields as needed -->
        <input type="hidden" name="action" value="update">
        <input type="submit" class="btn btn-warning form-control mt-4 fw-bold" value="Update">
    </form>
</section>

<!-- Search Form -->
<br id="search">
<section>
    <h3 class="mb-5 mt-5 text-center text-uppercase fw-bold">Search Offices</h3>
    <form action="ListOfficesServlet" method="post" class="border border-1 rounded p-5 m-5">
        <div class="mb-3 fw-bold">
            <label class="form-label"> City </label>
            <input type="text" name="searchCity" class="form-control" required>
        </div>

        <div class="mb-3 fw-bold">
            <label class="form-label">Country </label>
            <input type="text" name="searchCountry" class="form-control" required>
        </div>

        <input type="hidden" name="action" value="search">
        <input type="submit" value="Search" class="btn btn-primary form-control mt-4 fw-bold">
    </form>
</section>

</body>
</html>
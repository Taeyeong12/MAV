<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <% 
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
            <div class="alert alert-danger" role="alert">
                <h4 class="alert-heading">Error!</h4>
                <p><%= errorMessage %></p>
            </div>
        <%
            }
        %>
    </div>
</body>
</html>

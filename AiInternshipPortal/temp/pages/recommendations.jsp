<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>AI Internship Recommendations</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
    <div class="container">
        <h1>Your Personalized Internship Recommendations</h1>
        <nav>
            <ul>
                <li><a href="../pages/home.jsp">Home</a></li>
                <li><a href="../pages/profile.jsp">My Profile</a></li>
                <li><a href="../logout">Logout</a></li>
            </ul>
        </nav>
        <div class="recommendations">
            <!-- Recommendations will be dynamically populated -->
            <div class="recommendation-item">
                <h3>Loading recommendations...</h3>
            </div>
        </div>
    </div>
    <script>
        // Add your JavaScript code to fetch and display recommendations
    </script>
</body>
</html>
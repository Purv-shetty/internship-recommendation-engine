<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>AI Internship Portal</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f9fc;
            margin: 0;
            padding: 0;
        }

        .container {
            text-align: center;
            margin-top: 150px;
        }

        h1 {
            color: #333;
            font-size: 32px;
        }

        p {
            color: #555;
            font-size: 18px;
        }

        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px 24px;
            margin: 10px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        a {
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to AI Internship Portal</h1>
        <p>Find internships best suited for your profile.</p>

        <!-- ✅ Fixed: no /pages/ prefix -->
        <a href="login.jsp"><button type="button">Login</button></a>
        <a href="register.jsp"><button type="button">Register</button></a>
    </div>
</body>
</html>

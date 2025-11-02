<!DOCTYPE html>
<html>
<head>
    <title>Register - AI Internship Portal</title>
</head>
<body>
    <h2>Register</h2>
    <form action="<%=request.getContextPath()%>/RegisterServlet" method="post">
        Name: <input type="text" name="name"><br><br>
        Email: <input type="text" name="email"><br><br>
        Password: <input type="password" name="password"><br><br>
        <input type="submit" value="Register">
    </form>
</body>
</html>

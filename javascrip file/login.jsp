<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/style1.css">
    <style>
    body{
    	background: linear-gradient(45deg, #8b5aed 0%, #78ebfc 100%);
    }
    </style>
</head>
<body >
    <div class="container">
        <h2>Login</h2>
        <form action="loginAction.jsp" method="post">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
            <button type="submit">Login</button>
        </form>
        <div class="register-link">
            <p>Don't have an account? <a href="register.jsp">Register here</a></p>
            <p>Wanna back home..? <a href="student_dashboard.jsp">Click here</a></p>
        </div>
    </div>
</body>
</html>

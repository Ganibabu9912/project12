<!DOCTYPE html>
<html>
<head>
    <title>CUTMAP Question & Answer Forum</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(45deg, #8b5aed 0%, #78ebfc 100%);
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            min-height: 100vh; /* Ensure full viewport height */
        }

        .container {
            width: 80%;
            height: 70vh;
            max-width: 1200px;
            padding: 20px;
            background: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            border-radius: 10px;
        }

        .header {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 20px;
        }

        .logo {
            width: 100px;
            margin-bottom: 10px;
        }

        .buttons {
            display: flex;
            flex-direction: row;
            justify-content: center;
            width: 100%;
        }

        .btn {
            margin: 10px;
            padding: 10px 20px;
            background: #8b5aed;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
        }

        .btn:hover {
            background: #6a48b1;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <img src="images/CUTM logo-PNG.png" class="logo" alt="CUTMAP Logo">
            <h1>CUTMAP Question & Answer Forum</h1>
        </div>
        <div class="buttons">
            <a href="register.jsp" class="btn">Register</a>
            <a href="login.jsp" class="btn">Login</a>
        </div>
        <div class="register-link">
            <p>Wanna back home..? <a href="student_dashboard.jsp">Click here</a></p>
        </div>
    </div>
</body>
</html>

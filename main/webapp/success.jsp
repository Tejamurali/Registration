<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #ffff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        .container {
            display: flex;
            align-items: center;
            background: white;
            padding: 40px 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            width: 100%;
        }

        .container img {
            width: 300px;
            height: auto;
            border-radius: 10px;
            margin-right: 20px;
        }

        .content {
            text-align: left;
        }

        h1 {
            font-size: 2rem;
            margin-bottom: 20px;
        }

        .btn {
            display: inline-block;
            text-decoration: none;
            background: #f39c12;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: bold;
            transition: background 0.3s ease;
        }

        .btn:hover {
            background: #d35400;
        }

        @media (max-width: 600px) {
            .container {
                flex-direction: column;
                text-align: center;
            }

            .container img {
                margin-right: 0;
                margin-bottom: 20px;
                width: 100%;
                max-width: 300px;
            }

            h1 {
                font-size: 1.5rem;
            }

            .btn {
                font-size: 0.9rem;
                padding: 8px 16px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <img src="https://img.freepik.com/free-vector/privacy-policy-concept-illustration_114360-7853.jpg?semt=ais_hybrid" alt="Success Image">
        <div class="content">
            <h1>Your Response was Recorded</h1>
            <a href="login.html" class="btn">Go to Login</a>
            <a href="FetchAll" class="btn">Go to Employee List</a>
        </div>
    </div>
</body>
</html>

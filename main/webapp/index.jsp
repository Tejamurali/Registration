<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    /* General Reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: Arial, sans-serif;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: linear-gradient(120deg, #84fab0, #8fd3f4);
        position: relative;
    }

    /* Background Animation */
    body::before, body::after {
        content: '';
        position: absolute;
        top: 50%;
        left: 50%;
        width:100%;
        height: 100%;
        background: radial-gradient(#ffffff44, transparent);
        animation: rotate 10s linear infinite;
        z-index: -2;
    }

    body::after {
        animation-direction: reverse;
    }

    @keyframes rotate {
        0% { transform: translate(-50%, -50%) rotate(0deg); }
        100% { transform: translate(-50%, -50%) rotate(360deg); }
    }

    .container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 90%;
        max-width: 1200px;
        background-color: white;
        padding: 30px;
        border: 2px solid #ddd;
        border-radius: 15px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        z-index: 1;
    }

    .left-section {
        width: 50%;
        text-align: center;
    }

    .container h1 {
        font-size: 2.8em;
        margin-bottom: 10px;
        color: #333;
        animation: fadeIn 2s ease-in-out;
    }

    .container p {
        font-size: 1.4em;
        color: #666;
        margin-bottom: 30px;
        animation: fadeIn 2s ease-in-out;
    }

    @keyframes fadeIn {
        0% { opacity: 0; transform: translateY(-20px); }
        100% { opacity: 1; transform: translateY(0); }
    }

    .button-group {
        display: flex;
        flex-direction: column;
        justify-content: center;
        gap: 15px;
        margin-top: 30px;
    }

    .btn {
        text-decoration: none;
        padding: 15px 25px;
        font-size: 1.2em;
        font-weight: bold;
        color: white;
        border-radius: 5px;
        transition: all 0.3s ease;
        position: relative;
    }

    .btn::before {
        content: '';
        position: absolute;
        inset: 0;
        border-radius: 5px;
        background: rgba(255, 255, 255, 0.3);
        opacity: 0;
        transition: opacity 0.3s;
    }

    .btn:hover::before {
        opacity: 1;
    }

    .btn.login {
        background-color: #007bff;
    }

    .btn.login:hover {
        background-color: #0056b3;
        transform: translateY(-3px);
    }

    .btn.register {
        background-color: #28a745;
    }

    .btn.register:hover {
        background-color: #1e7e34;
        transform: translateY(-3px);
    }

    .btn i {
        margin-right: 8px;
    }

    /* Styling for Image */
    .image-section img {
        width: 480px;
        height: auto;
        border-radius: 10px;

        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .image-section img:hover {
        transform: scale(1.0);
        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.4);
    }

    /* Right Section - Buttons */
    .right-section {
        width: 40%;
        text-align: center;
    }
</style>
</head>
<body>
    <div class="container">
        <!-- Left Section with Image -->
        <div class="left-section image-section">
            <img src="https://img.freepik.com/free-vector/mobile-login-concept-illustration_114360-83.jpg?ga=GA1.1.1166030426.1725880789&semt=ais_hybrid" alt="Mobile Login">
        </div>

        <!-- Right Section with Buttons -->
        <div class="right-section">
            <h1>Welcome to Our Amazing Platform</h1>
            <p>Unlock the best experiences with us. Join now or log in to continue.</p>
            <div class="button-group">
                <!-- Login Button with Icon -->
                <a href="login.html" class="btn login">
                    <i class="fas fa-sign-in-alt"></i> Login
                </a>
                <!-- Create Account Button with Icon -->
                <a href="createacc.html" class="btn register">
                    <i class="fas fa-user-plus"></i> Create Account
                </a>
            </div>
        </div>
    </div>
</body>
</html>

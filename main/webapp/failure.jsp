<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Connection Error</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background: linear-gradient(135deg, #f4f4f4, #e0e0e0);
        text-align: center;
        padding: 50px;
        margin: 0;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    h1 {
        color: #d9534f;
        font-size: 2.5em;
        margin-bottom: 20px;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
    }
    a {
        color: #337ab7;
        text-decoration: none;
    }
    a:hover {
        text-decoration: underline;
    }
    .button {
        display: inline-block;
        padding: 12px 24px;
        margin: 10px;
        background: linear-gradient(135deg, #337ab7, #286090);
        color: white;
        border-radius: 25px;
        text-decoration: none;
        font-size: 1em;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
    }
    .button:hover {
        background: linear-gradient(135deg, #286090, #337ab7);
        box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
        transform: translateY(-2px);
    }
    footer {
        margin-top: 30px;
        font-size: 14px;
        color: #666;
    }
    footer a {
        color: #337ab7;
        text-decoration: none;
    }
    footer a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>

<h1>Sorry, we were unable to connect. Please try again later.</h1>
<a href="login.html" class="button">Go Back</a>

<footer>
    <p>If the problem persists, please contact support at <a href="mailto:support@example.com">support@example.com</a>.</p>
</footer>
</body>
</html>
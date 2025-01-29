<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tap.acad.Employee"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Employee</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #007bff, #00c6ff);
            color: #fff;
        }
        .container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            color: #333;
            text-align: center;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #007bff;
        }
        label {
            display: block;
            font-weight: bold;
            margin: 10px 0 5px;
            text-align: left;
        }
        input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        input:read-only {
            background: #f0f0f0;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            font-size: 16px;
            cursor: pointer;
            margin-top: 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #0056b3;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <%
        Employee emp = (Employee) session.getAttribute("emp");
        if (emp == null) {
            response.sendRedirect("error.jsp");
            return;
        }
    %>

    <div class="container">
        <h2>Edit Employee</h2>
        <form action="update" method="POST">
            <!-- Hidden ID Field -->
            <input type="hidden" name="id" value="<%= emp.getId() %>">

            <label for="name">Name:</label> 
            <input type="text" id="name" name="name" value="<%= emp.getName() %>" required> 

            <label for="age">Age:</label> 
            <input type="number" id="age" name="age" value="<%= emp.getAge() %>" required>

            <label for="email">Email:</label> 
            <input type="email" id="email" name="email" value="<%= emp.getEmail() %>" readonly> 

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" value="<%= emp.getPassword() %>" required>

            <label for="mobile">Mobile Number:</label> 
            <input type="tel" id="mobile" name="mobile" value="<%= emp.getNumber() %>" required>

            <label for="address">Address:</label> 
            <input type="text" id="address" name="address" value="<%= emp.getAddress() %>" required>

            <button type="submit">Update Employee</button>
        </form>
        
        <a href="FetchAll" class="back-link">Back to Employee List</a>
    </div>
</body>
</html>

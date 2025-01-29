<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.tap.acad.Employee" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Data</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        background: linear-gradient(135deg, #007bff, #00c6ff);
        color: #fff;
    }
    h1 {
        text-align: center;
        margin: 20px 0;
        font-size: 2.5em;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
    }
    .container {
        width: 90%;
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px 0;
    }
    .add-employee {
        text-align: right;
        margin-bottom: 20px;
    }
    .add-employee button {
        background-color: #28a745;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
        border-radius: 30px;
        transition: background-color 0.3s ease;
    }
    .add-employee button:hover {
        background-color: #218838;
    }
    .employee-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 20px;
    }
    .employee-card {
        background: #fff;
        color: #333;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        padding: 20px;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .employee-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
    }
    .employee-card h2 {
        font-size: 1.5em;
        margin-bottom: 10px;
        color: #007bff;
    }
    .employee-card p {
        margin: 5px 0;
        font-size: 14px;
        line-height: 1.5;
    }
    .employee-card a {
        display: inline-block;
        margin-top: 10px;
        background-color: #007bff;
        color: #fff;
        text-decoration: none;
        padding: 8px 15px;
        font-size: 14px;
        font-weight: bold;
        border-radius: 5px;
        transition: background-color 0.3s ease;
        margin: 10px 50px 0px 50px;
        gap:50px;
    }
    .employee-card a:hover {
        background-color: #0056b3;
    }
    .no-data {
        text-align: center;
        padding: 20px;
        font-size: 1.2em;
    }
</style>
</head>
<body>
    <h1>Employee Details</h1>
    <div class="container">
        <div class="add-employee">
            <a href="addEmployee.jsp">
                <button>Add Employee</button>
            </a>
        </div>
        <div class="employee-grid">
            <% 
                ArrayList<Employee> arl = (ArrayList<Employee>) session.getAttribute("arrayList"); 
                if (arl != null && !arl.isEmpty()) {
                    for (Employee al : arl) {
            %>
            <div class="employee-card">
                <h2><%= al.getName() %></h2>
                <p><strong>ID:</strong> <%= al.getId() %></p>
                <p><strong>Age:</strong> <%= al.getAge() %></p>
                <p><strong>Email:</strong> <%= al.getEmail() %></p>
                <p><strong>Password:</strong> <%= al.getPassword() %></p>
                <p><strong>Mobile Number:</strong> <%= al.getNumber() %></p>
                <p><strong>Address:</strong> <%= al.getAddress() %></p>
                <a href="edit?id=<%= al.getId() %>" >Edit</a>
				<a href="delete?id=<%= al.getId() %>" >Delete</a>

            </div>
            <% 
                    }
                } else {
            %>
            <div class="no-data">No employee data available.</div>
            <% } %>
        </div>
    </div>
</body>
</html>

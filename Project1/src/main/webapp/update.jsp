<!DOCTYPE html>
<html>
<head>
    <title>Update or Delete Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #74ebd5, #acb6e5);
            color: #333;
            padding: 20px;
        }
        .form-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 15px;
            max-width: 600px;
            margin: 50px auto;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }
        .form-container h1 {
            text-align: center;
            color: #333;
        }
        .form-container label {
            display: block;
            margin: 10px 0 5px;
            font-size: 16px;
            color: #555;
        }
        .form-container input {
            width: 97%;
            padding: 10px;
            margin: 5px 0 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        .button-container {
            display: flex;
            justify-content: space-between;
        }
        .button-container button {
            width: 48%;
            padding: 15px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: transform 0.2s, background-color 0.3s;
        }
        .button-container button:hover {
            transform: scale(1.05);
        }
        .update-btn {
            background-color: #4caf50;
            color: white;
        }
        .update-btn:hover {
            background-color: #45a049;
        }
        .delete-btn {
            background-color: #f44336;
            color: white;
        }
        .delete-btn:hover {
            background-color: #e53935;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Update or Delete Details</h1>
        <form action="updt" method="post">
            <input type="hidden" name="email" value="${email}">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="${name}" required>

            <label for="age">Age:</label>
            <input type="number" id="age" name="age" value="${age}" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${email}" disabled>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" value="${password}" required>

            <label for="mobile">Mobile Number:</label>
            <input type="tel" id="mobile" name="mobile" value="${mobile}" required>

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" value="${address}" required>

            <div class="button-container">
                <button type="submit" class="update-btn" name="action" value="update">Update</button>
                <form action="DeleteServlet" method="post">
                    <input type="hidden" name="email" value="${email}">
                    <button type="submit" class="delete-btn">Delete</button>
                </form>
            </div>
        </form>
    </div>
</body>
</html>

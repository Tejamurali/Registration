<!DOCTYPE html>
<html>
<head>
    <title>Manage Your Details</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .container {
            margin: 50px auto;
            max-width: 800px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.3);
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .image-section {
            flex: 1;
            text-align: center;
        }

        .image-section img {
            max-width: 100%;
            border-radius: 10px;
        }

        .form-section {
            flex: 1;
            width: 100%;
            max-width: 380px;
        }

        .form-section h1 {
            text-align: center;
            font-size: 28px;
            margin-bottom: 20px;
            color: #333;
        }

        .form-section form label {
            display: block;
            margin: 10px 0 5px;
            font-size: 14px;
            color: #555;
        }

        .password-container {
            position: relative;
        }

        .form-section form input {
            width: 95%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            outline: none;
        }

        .password-container input {
            padding-right: 40px;
        }

        .password-container .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .button-container button {
            width: 48%;
            padding: 12px;
            font-size: 14px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            color: #fff;
            transition: transform 0.2s, background-color 0.3s;
        }

        .update-btn {
            background-color: #28a745;
        }

        .update-btn:hover {
            background-color: #218838;
        }

        .delete-btn {
            background-color: #dc3545;
        }

        .delete-btn:hover {
            background-color: #c82333;
        }

        .fetchall-container {
            text-align: center;
            margin-top: 20px;
        }

        .fetchall-container a {
            display: inline-block;
            text-decoration: none;
            padding: 12px 20px;
            font-size: 14px;
            border-radius: 8px;
            background-color: #007bff;
            color: #fff;
            transition: transform 0.2s, background-color 0.3s;
        }

        .fetchall-container a:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        footer {
            margin-top: 20px;
            text-align: center;
            font-size: 12px;
            color: rgba(255, 255, 255, 0.7);
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Image Section -->
        <div class="image-section">
            <img src="https://img.freepik.com/free-vector/boy-with-smartphone-social-profile-commnication_24877-53919.jpg?ga=GA1.1.1166030426.1725880789&semt=ais_hybridhttps://img.freepik.com/free-vector/boy-with-smartphone-social-profile-commnication_24877-53919.jpg?ga=GA1.1.1166030426.1725880789&semt=ais_hybrid" alt="User Details">
        </div>

        <!-- Form Section -->
        <div class="form-section">
            <h1>Manage Your Details</h1>
            <form action="updt" method="post">
                <input type="hidden" name="email" value="${email}">

                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="${name}" required>

                <label for="age">Age:</label>
                <input type="number" id="age" name="age" value="${age}" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="${email}" disabled>

                <label for="password">Password:</label>
                <div class="password-container">
                    <input type="password" id="password" name="password" value="${password}" required>
                    <span class="toggle-password" onclick="togglePasswordVisibility()">👁️</span>
                </div>

                <label for="mobile">Mobile Number:</label>
                <input type="tel" id="mobile" name="mobile" value="${mobile}" required>

                <label for="address">Address:</label>
                <input type="text" id="address" name="address" value="${address}" required>

                <div class="button-container">
                    <button type="submit" class="update-btn">Update</button>
                    
                </div>
            </form>

            <!-- Fetch All Anchor -->
            <div class="fetchall-container">
            	<%session.setAttribute("email", request.getParameter("email")); %>
            	<a href="DeleteServlet">Delete</a>
                <a href="FetchAll">Fetch All Details</a>
            </div>
        </div>
    </div>

    <footer>
        &copy; 2024 Your Company. All rights reserved.
    </footer>

    <script>
        function togglePasswordVisibility() {
            const passwordInput = document.getElementById('password');
            const type = passwordInput.type === 'password' ? 'text' : 'password';
            passwordInput.type = type;
        }
    </script>
</body>
</html>

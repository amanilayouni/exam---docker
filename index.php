<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Docker – Amani</title>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
        }

        .container {
            background-color: white;
            padding: 40px;
            width: 100%;
            max-width: 600px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            color: #2c3e50;
            margin-bottom: 10px;
        }

        p {
            color: #555;
            margin-bottom: 25px;
        }

        .links a {
            display: block;
            padding: 14px;
            margin: 12px 0;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .links a:hover {
            background-color: #217dbb;
            transform: scale(1.02);
        }

        .footer {
            margin-top: 25px;
            font-size: 0.9em;
            color: #777;
        }

        .footer span {
            font-weight: bold;
            color: #2c3e50;
        }
    </style>
</head>

<body>
    <div class="container">
        <h1> Serveur Docker – Amani</h1>
        <p>Bienvenue sur votre environnement Docker.  
           Sélectionnez un service ci-dessous :</p>

        <div class="links">
            <a href="/wordpress"> Accéder à WordPress</a>
            <a href="/phpmyadmin"> Accéder à phpMyAdmin</a>
        </div>

        <div class="footer">
            PHP Version : <span><?php echo phpversion(); ?></span>
        </div>
    </div>
</body>
</html>

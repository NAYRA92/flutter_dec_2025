<?php
// Database configuration
$host     = 'localhost'; //vendrick.iad1-mysql-e2-8a.dreamhost.com
$db_name  = 'flutter_class';
$username = 'nayra';
$password = '1234567';
$charset  = 'utf8mb4';

// Data Source Name
$dsn = "mysql:host=$host;dbname=$db_name;charset=$charset";

// Options for PDO
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION, // Removed underscore
    PDO::ATTR_DEFAULT_FETCH_MODE  => PDO::FETCH_ASSOC,       // This one was correct
    PDO::ATTR_EMULATE_PREPARES    => false,                  // This one was correct
];

try {
    // Create the connection
    $pdo = new PDO($dsn, $username, $password, $options);
    
    echo "<h1>Success!</h1>";
    echo "<p>Connected to the <strong>$db_name</strong> database successfully.</p>";

} catch (PDOException $e) {
    // If something goes wrong, catch the error
    echo "<h1>Connection Failed</h1>";
    echo "<p>Error: " . $e->getMessage() . "</p>";
}
?>
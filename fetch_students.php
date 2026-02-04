<?php
$host     = 'localhost';
$db_name  = 'flutter_class';
$username = 'nayra';
$password = '1234567';
$charset  = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db_name;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
    $pdo = new PDO($dsn, $username, $password, $options);

    // 1. The SQL Query
    $sql = "SELECT id, student_name, student_class, student_year FROM students";

    // 2. Execute the query
    $stmt = $pdo->query($sql);

    // 3. Fetch all results
    $students = $stmt->fetchAll();

} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Student List</title>
    <style>
        table { border-collapse: collapse; width: 100%; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #f4f4f4; }
    </style>
</head>
<body>

    <h2>University Student Directory</h2>

    <?php if (empty($students)): ?>
        <p>No students found in the database.</p>
    <?php else: ?>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Enrollment Date</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($students as $student): ?>
                    <tr>
                        <td><?= htmlspecialchars($student['id']) ?></td>
                        <td><?= htmlspecialchars($student['student_name']) ?></td>
                        <td><?= htmlspecialchars($student['student_class']) ?></td>
                        <td><?= htmlspecialchars($student['student_year']) ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    <?php endif; ?>

</body>
</html>
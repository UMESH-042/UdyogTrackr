<?php
// Replace the values in the following line with your MySQL database credentials
$db = new PDO('mysql:host=localhost;dbname=id20582924_users', 'id20582924_umesh', '#Umeshqwert123');

// Get user inputs
$userName =$_POST['id'];
$userPassword = $_POST['name'];
$userPassword = $_POST['salary'];
$userPassword = $_POST['phone'];



// Check if user already exists
$query = "SELECT COUNT(*) as count FROM `employee` WHERE `name` = :name";
$stm = $db->prepare($query);
$stm->bindParam(':name', $name);
$stm->execute();
$row = $stm->fetch(PDO::FETCH_ASSOC);
if ($row['count'] > 0) {
    echo 'User already exists';
    exit();
}

// Insert new user
$query = "INSERT INTO `employee` (`id`, `name`,`salary`,`phone`) VALUES (:id, :name,:salary,:phone)";
$stm = $db->prepare($query);

$stm->bindParam(':id', $id);
$stm->bindParam(':name', $name);
$stm->bindParam(':salary', $salary);
$stm->bindParam(':phone', $phone);


// Execute statement
if ($stm->execute()) {
    echo 'User added successfully';
} else {
    $error = $stm->errorInfo();
    echo 'Error adding user: ' . $error[2];
}
?>

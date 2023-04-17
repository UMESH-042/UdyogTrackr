<?php
// Replace the values in the following line with your MySQL database credentials
$db = new PDO('mysql:host=localhost;dbname=id20582924_users', 'id20582924_umesh', '#Umeshqwert123');

// Get user inputs
$name =$_POST['name'];
$email = $_POST['email'];
$phone = $_POST['phone'];


// Check if user already exists
$query = "SELECT COUNT(*) as count FROM `client` WHERE `name` = :name";
$stm = $db->prepare($query);
$stm->bindParam(':name', $name);
$stm->execute();
$row = $stm->fetch(PDO::FETCH_ASSOC);
if ($row['count'] > 0) {
    echo 'User already exists';
    exit();
}

// Insert new user
$query = "INSERT INTO `client` (`name`, `email`,`phone`) VALUES (:name, :email,:phone)";
$stm = $db->prepare($query);
$stm->bindParam(':name', $name);
$stm->bindParam(':email', $email);
$stm->bindParam(':phone', $phone);


// Execute statement
if ($stm->execute()) {
    echo 'User added successfully';
} else {
    $error = $stm->errorInfo();
    echo 'Error adding user: ' . $error[2];
}
?>

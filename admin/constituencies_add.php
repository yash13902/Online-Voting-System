<?php
include 'includes/session.php';

if (isset($_POST['add'])) {
	$id = $_POST['id'];
	$description = $_POST['description'];
	$max_vote = 1;

	$sql = "SELECT * FROM constituencies ORDER BY priority DESC LIMIT 1";
	$query = $conn->query($sql);
	$row = $query->fetch_assoc();

	$priority = $row['priority'] + 1;

	$sql = "INSERT INTO constituencies (id, description, max_vote, priority) VALUES ('$id', '$description', '$max_vote', '$priority')";
	if ($conn->query($sql)) {
		$_SESSION['success'] = 'Constituency added successfully';
	} else {
		$_SESSION['error'] = $conn->error;
	}
} else {
	$_SESSION['error'] = 'Fill up add form first';
}

header('location: constituencies.php');

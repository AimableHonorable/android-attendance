<?php
$host = "localhost";
$username = "root";
$pwd = "";
$db = "attendance";

$con = mysqli_connect($host, $username, $pwd, $db) or die("Unable to connect!");

if (mysqli_connect_error($con)) {
	echo "Failed to connecct";
}
$query = mysqli_query($con, "SELECT Std_Card, RegistrationNumber FROM students");

if ($query) {
	while ($row = mysqli_fetch_array($query)) {
		$flag[] = $row;
	}
	print(json_encode($flag));
}
mysqli_close($con);
?>
<?php
// Include config file
 require_once(__DIR__ .'/config.php');
 
// Define variables and initialize with empty values
$Lect_ID = $username = $password = "";

$response = array();
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    // Check if username is empty
    if(empty(trim($_POST["username"]))){
        $response["message"] = 'Please enter your username.';
    } else{
        $username = $_POST["username"];
    }
    
    // Check if password is empty
    if(empty($_POST['password'])){
        $response["message"] = 'Please enter your password.';
    } else{
        $password = $_POST['password'];
    }
    
    // Validate credentials
    if(empty($username_err) && empty($password_err)){
        // Prepare a select statement
        $sql = "SELECT * FROM lectures WHERE UserName = :username";
        
        if($stmt = $pdo->prepare($sql)){
            // Bind variables to the prepared statement as parameters
            $stmt->bindParam(':username', $param_username, PDO::PARAM_STR);
            
            // Set parameters
            $param_username = $_POST["username"];
            
            // Attempt to execute the prepared statement
            if($stmt->execute()){
                // Check if username exists, if yes then verify password
                if($stmt->rowCount() == 1){
                    if($row = $stmt->fetch()){
                        $pass = $row['Password'];
                        if($password == $pass){
                             
                            $response["error"] = "false";
                            $response["message"] = 'Welcome!!!';
                           
                        } else{
                          
                            $response["error"] = "true";
                            $response["message"] = 'The password you entered was not valid.';
                        }
                    }
                } else{
                    // Display an error message if username doesn't exist

                            $response["error"] = "true";
                            $response["message"] = 'No account found with that username.';
                   
                }
            } else{
                    $response["error"] = "true";
                    $response["message"] = 'Oops! Something went wrong. Please try again later.';
               
            }
        }
        
        // Close statement
        unset($stmt);
    }
    
    // Close connection
    unset($pdo);

    echo json_encode($response);
}
?>
 

<?php
// Include config file
 require_once(__DIR__ .'/config.php');
 
// Define variables and initialize with empty values
$Lect_ID = $username = $password = "";
$Lect_ID_err = $username_err = $password_err = "";

$response = array();
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    // Check if username is empty
    if(empty(trim($_POST["username"]))){
        $response["message"] = 'Please enter your username.';
    } else{
        $username = trim($_POST["username"]);
    }
    
    // Check if password is empty
    if(empty(trim($_POST['password']))){
        $response["message"] = 'Please enter your password.';
    } else{
        $password = trim($_POST['password']);
    }
    
    // Validate credentials
    if(empty($username_err) && empty($password_err)){
        // Prepare a select statement
        $sql = "SELECT UserName, Password FROM lectures WHERE UserName = :username";
        
        if($stmt = $pdo->prepare($sql)){
            // Bind variables to the prepared statement as parameters
            $stmt->bindParam(':username', $param_username, PDO::PARAM_STR);
            
            // Set parameters
            $param_username = trim($_POST["username"]);
            
            // Attempt to execute the prepared statement
            if($stmt->execute()){
                // Check if username exists, if yes then verify password
                if($stmt->rowCount() == 1){
                    if($row = $stmt->fetch()){
                        $hashed_password = sha1(md5($password));
                        $hashed_password = $row['Password'];
                        if($password == $hashed_password){
                             
                            $response["error"] = "false";
                            $response["message"] = 'Login successfully.';
                           
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
 

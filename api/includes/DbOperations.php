<?php 

	class DbOperations{

		private $con; 

		function __construct(){

			require_once dirname(__FILE__).'/DbConnect.php';

			$db = new DbConnect();

			$this->con = $db->connect();

		}

		/*CRUD -> C -> CREATE */

		/*public function createUser($username, $pass, $email){
			if($this->isUserExist($username,$email)){
				return 0; 
			}else{
				$password = md5($pass);
				$stmt = $this->con->prepare("INSERT INTO `users` (`id`, `username`, `password`, `email`) VALUES (NULL, ?, ?, ?);");
				$stmt->bind_param("sss",$username,$password,$email);

				if($stmt->execute()){
					return 1; 
				}else{
					return 2; 
				}
			}
		}*/

		public function userLogin($UserName, $pass){
			$Password = sha1(md5($pass));
			$stmt = $this->con->prepare("SELECT Lect_ID FROM lectures WHERE UserName = ? AND Password = ?");
			$stmt->bind_param("ss",$UserName,$Password);
			$stmt->execute();
			$stmt->store_result(); 
			return $stmt->num_rows > 0; 
		}

		public function getUserByUsername($UserName){
			$stmt = $this->con->prepare("SELECT * FROM lectures WHERE UserName = ?");
			$stmt->bind_param("s",$UserName);
			$stmt->execute();
			return $stmt->get_result()->fetch_assoc();
		}
		

		/*private function isUserExist($username, $email){
			$stmt = $this->con->prepare("SELECT id FROM users WHERE username = ? OR email = ?");
			$stmt->bind_param("ss", $username, $email);
			$stmt->execute(); 
			$stmt->store_result(); 
			return $stmt->num_rows > 0; 
		}*/

	}
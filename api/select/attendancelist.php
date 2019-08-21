<?php
$conn = mysqli_connect("localhost","root","","Attendance");
if(!$conn){
    die("Connection error: " . mysqli_connect_error()); 
}
$user=3;
$sq="SELECT * FROM `workload` where LectureID=$user";
$current=date('Y-m-d') ."\n";
$query=mysqli_query($conn,$sq);
while ( $row=mysqli_fetch_array($query)) {
        $start=$row['Start'];
        $snd=$row['End'];
        $opt=$row['OptionID'];
        $academic=$row['AcademicYearID'];
        $Workload=$row['Workload_ID'];
        
        }                  

         
       

                    $Student="SELECT students.Std_ID,students.Std_Card,students.Std_Card,students.FirstName,students.LastName,students.RegistrationNumber,students.OptionId,workload.Workload_ID FROM `students`,workload WHERE workload.LectureID=$user AND students.OptionID='".$opt."' ORDER BY Std_ID DESC";
                    $query=mysqli_query($conn,$Student);
                    $res=mysqli_num_rows($query);

                    if ($res>0) {
                        while($row=mysqli_fetch_array($query)){
                           $response[] = $row;

                    }
                    echo json_encode($response);

                }
                    else{
                        echo "there no students available for your class";
                    }
                    
                   
                ?>
                
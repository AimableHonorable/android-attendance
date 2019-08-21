<?php
$conn = mysqli_connect("localhost","root","","Attendance");
if(!$conn){
    die("Connection error: " . mysqli_connect_error()); 
}
$user=3;
$sq="SELECT * FROM `workload` where LectureID=$user";
$current=date('Y-m-d') ."\n";
$query=mysqli_query($conn,$sq);

        $today=date("Y-m-d");
$cq=mysqli_query($conn,"select Workload.Workload_ID, Courses.CourseName,Courses.CourseCode,Optioms.OptionName,Lectures.UserName,AcademicYear.AcademicYearName,Courses.Level,Courses.Semester,Courses.Credits,Workload.Days,Workload.Start,Workload.End from Workload,Courses,Optioms,Lectures,AcademicYear where Workload.CourseId=Courses.Crs_ID and  Workload.AcademicYearID=AcademicYear.Academic_ID and Workload.LectureID=Lectures.Lect_ID and Workload.OptionID=Optioms.Opt_ID AND Workload.LectureID= $user and Start>='".$today."' and End>='".$today."' ORDER BY Workload_ID ASC ");
        
                   $rest=mysqli_num_rows($cq);

                   if ($rest>0) {
                   
                    while($cqrow=mysqli_fetch_array($cq)){
                    
                        $response[] =$cqrow;
                    
                    }
                    
    echo json_encode($response);
                    }
                    else{
                        echo "you don't have lesson now";
                    }
                   
                ?>
                
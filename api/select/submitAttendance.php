<?php
if (isset($_POST['Std_ID'])) {

$conn = mysqli_connect("localhost","root","","Attendance");
if(!$conn){
    die("Connection error: " . mysqli_connect_error()); 
}
$user=4;
$sq="SELECT * FROM `workload` where LectureID=$user";
$nextWeek = time() + (7 * 24 * 60 * 60);
                   // 7 days; 24 hours; 60 mins; 60 secs
$current=date('Y-m-d') ."\n";
$query=mysqli_query($conn,$sq);
while ( $row=mysqli_fetch_array($query)) {
        $start=$row['Start'];
        $snd=$row['End'];
        }

$today=date("Y-m-d");
$cq=mysqli_query($conn,"select Workload.Workload_ID, Courses.CourseName,Courses.CourseCode,Optioms.OptionName,Lectures.UserName,AcademicYear.AcademicYearName,Courses.Level,Courses.Semester,Courses.Credits,Workload.Days,Workload.Start,Workload.End from Workload,Courses,Optioms,Lectures,AcademicYear where Workload.CourseId=Courses.Crs_ID and  Workload.AcademicYearID=AcademicYear.Academic_ID and Workload.LectureID=Lectures.Lect_ID and Workload.OptionID=Optioms.Opt_ID AND Workload.LectureID= $user and Start>='".$today."' and End>='".$today."' ORDER BY Workload_ID ASC ");
        
                   $rest=mysqli_num_rows($cq);

                   if ($rest>0) {
                   
                    while($cqrow=mysqli_fetch_array($cq)){
                     $workloadid=$cqrow['Workload_ID'];
                    }

                    }
                    $workloadid = $_POST['Workload_ID'];
                    $Std_ID=$_POST['Std_ID'];
                    $Status=$_POST['Status'];
                   $query=mysqli_multi_query($conn,"insert into attendancelist (StudentId,WorkloadId,Status) values ($Std_ID,$workloadid,$Status)");
                   
                   if ($query) {
                    $result = "data inserted successfully";
                   }
                   else{
                   	$result = "false";
                   }
                   echo $result;
               }
             
                   
                ?>
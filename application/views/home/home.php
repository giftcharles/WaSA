<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>

<?php 


require(APPPATH . 'views/templates/header.php'); 


if(isset($_SESSION['logged_in'])){


    if($_SESSION['group'] == 'teacher'){
        require('teacher_homepage.php'); 
    }else{
        require('student_homepage.php');
    }


} else {
    require('new_homepage.php');
}



require(APPPATH . 'views/templates/footer.php'); 


?>
            
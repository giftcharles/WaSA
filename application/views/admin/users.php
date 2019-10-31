<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>

<?php require(APPPATH . 'views/templates/header.php'); ?>

<div class="container user-list">
    <div class="table-controller row">
        <div class="col s8">

        </div>

        <div class="col right-align s4 users-pagination">
            <?php require('pagination-users.php'); ?>
        </div>
    </div>

    <table class="centered card highlight striped">
        <thead>
          <tr>
              <th>N0.</th>
              <th>UserID</th>
              <th>Name</th>
              <th>Username</th>
              <th>Class</th>
              <th>Birth Date</th>
              <th>Group</th>
              <th>Answered</th>
              <th>wrongs</th>
              <th>Corrects</th>
              <th>Score</th>
          </tr>
        </thead>

        <tbody>
            <?php 

                $counter = 0;
            
                foreach($users as $user) {
                    
                    $name = $user['firstName'] . ' ' . $user['surname'];
                    $class = $user['class'];

                    if($class == '') {
                        $class = 'NaN';
                    }
                    
                    echo '<tr>';
                    echo '<td>' . ($counter+1) . '</td>';
                    echo '<td>' . $user['sid'] . '</td>';
                    echo '<td>' . $name . '</td>';
                    echo '<td>' . $user['username'] . '</td>';
                    echo '<td>' . $class . '</td>';
                    echo '<td>' . $user['birthdate'] . '</td>';
                    
                    if($user['group'] == 'student') {
                        echo '<td class="user_group"><a class="dropdown-trigger btn-flat btn" href="#" data-target="dropdown'. $counter . '">' . $user['group'] . ' <i id="controller-denoter" class="material-icons tiny right">arrow_drop_down</i></a></td>';
                    }else{
                        echo '<td>' . $user['group'] . '</td>';
                    }

                    echo '<td>' . $user['answered'] . '</td>';
                    echo '<td>' . $user['wrongs'] . '</td>';
                    echo '<td>' . $user['corrects'] . '</td>';
                    echo '<td>' . $user['score'] . '</td>';
                    echo '</tr>';
                
                ?>

                <ul id='dropdown<?php echo $counter; ?>' data-username="<?php echo $user['username']; ?>" data-userid="<?php echo $user['sid']; ?>" class='dropdown-content'>
                    <li><a href="#!">Student</a></li>
                    <li><a href="#!">Teacher</a></li>
                </ul>

                <?php
                
                    $counter++; 
                }  

            ?>
          
        
        </tbody>
      </table>
      <div class="col s8">

        </div>
      <div class="col right-align s4 users-pagination">
            <?php require('pagination-users.php'); ?>
        </div>
</div>

<?php require(APPPATH . 'views/templates/footer.php'); ?>
            
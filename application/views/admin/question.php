<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>

<?php 


require(APPPATH . 'views/templates/header.php'); 



?>


<div id="newQuestion" class="container row">

    <div class="card grey lighten-5 pageTitle">

    <?php 
    if($question == '')
    { 
        echo '<h4 class="card-title formtype">New Question</h4>';
    }else{
        echo '<h4 class="formtype card-title ">Edit Question <a href="/wasa/admin/question" class="btn waves-effect waves-light right" id="formNewQ">New question</a></h4>';
    }
    
    ?>
    


    </div>

    <div class="card questionForm">
        <form action="">
            <div class="card-content row">
                <div class="custom_input col s12">
                    <label for="question">The question (html/text)</label>                    
                    <textarea name="question" id="question_content" ><?php echo $question; ?></textarea>
                </div>

                <div 
                
                <?php if($question == ''){ ?>
                    style="display: none;" 

                <?php } ?>
                
                id="question_preview" class="col s12">
                    <?php echo $question; ?>
                </div>

                <?php 
                
                $x = 0;
                $letters = array('A','B','C','D');


                
                while($x < 4) {

                
                
                ?>

                <div class="custom_input col s6">
                    <label for="option_<?php echo $x+1; ?>">option <?php echo $letters[$x]; ?></label>
                    <input type="text" name="option_<?php echo $x+1; ?>" value="<?php echo $options[$x]; ?>" id="option_<?php echo $x+1; ?>">

                    <label>
                        <input
                        <?php if ($answer == $options[$x]){ echo 'checked="checked"'; }  ?>
                            
                        type="checkbox" class="filled-in ansBull" value="option_<?php echo $x+1; ?>"/>
                        <span>Answer</span>
                    </label>
                </div>
                
                <?php $x++; } ?>
                <div class="input-field col s6">
                    <select id="gradeselect" >
                        <option value="" disabled selected>Choose a grade/class</option>

                        <?php 
                        
                        $classes = array(
                            'one', 'two', 'three', 'four', 'five', 'six', 'seven'
                        ); 
                        
                        foreach ($classes as &$class) {

                        ?>

                        <option value="<?php echo $class; ?>" 
                        
                        <?php if ($grade == $class){ echo 'selected="selected"'; } ?>
                        
                        ><?php echo $class; ?></option>

                        <?php } ?>

                    </select>
                    <label>Grade</label>
                </div>

                <div class="input-field col s6">
                    <input placeholder="Exercise Number eg. 4" id="exercise_number" type="text" class="validate">
                    <label for="first_name">Exercise</label>        
                </div>
                
            </div>

            <input type="hidden" value="<?php echo $qid; ?>" id="qid">
            <input name="answer" type="hidden" value="<?php echo $answer; ?>" id="answer">
            <div class="card-action">
                <button class="btn waves-effect waves-light" id="submitQues" type="submit" name="action">Submit
                    <i class="material-icons right">send</i>
                </button>
            </div>
        </form>
      </div>


</div>


<?php require(APPPATH . 'views/templates/footer.php'); ?>
            
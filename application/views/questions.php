<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>

<?php require(APPPATH . 'views/templates/header.php'); ?>
<div class="container row">
    <div class="questions col s9">
        <?php 

        $counter = 1;
        
        foreach($questions as $question ) {
            
        
        
        ?>

        <div class="question card row lighten-5"
        data-questionType = "<?php 
            if ($question['answer'] == ""){
                echo "fillIn";
            }else{
                echo "multiplechoice";
            }
        ?>"
        data-questionNumber= "<?php echo $counter ?>">

            <div class="col s1 questionNumber">
                <h5 class="grey-text">Qn.<?php 
                
                if($counter < 10){
                    echo '0'; 
                }
                echo $counter; 
                
                ?></h5>

            </div>

            <div class="col s9 question-content">
                <div class="row">
                
                    <div class="col s12 question-title">
                        <h6>
                        <?php 
                            echo $question['question'];
                        ?>
                        </h6>

                    </div>

                    <div class="col s12 row AnswerOptions">
                        <?php 

                            $options = array(
                                $question['option_1'],
                                $question['option_2'],
                                $question['option_3'],
                                $question['option_4']
                            );

                            $letter = array('A', 'B', 'C', 'D');

                            $optionCounter = 0;

                            if($question['answer'] == "" or $question['answer'] == "NaN"){
                                ?>
                                    <div class="col s12 input-field">
                                        <input type="text" name="answer1_input" placeholder="Answer 1" id="answer1_input">
                                        <input type="hidden" name="answer_1_hidden" value="<?php echo $question['option_1']; ?>">
                                        <span class="correctfirstanswer grey-text" style="display:hidden"></span>
                                    </div>

                                    <?php if ($question['option_2'] != ""){?>
                                    <div class="col s12 input-field">
                                        <input type="text" name="answer2_input" placeholder="Answer 2" id="answer2_input">
                                        <input type="hidden" name="answer_2_hidden"  value="<?php echo $question['option_2']; ?>">
                                        <span class="correctsecondanswer grey-text" style="display:hidden"></span>
                                    </div>
                                    <?php } ?>
                                <?php
                            }else{

                            foreach($options as $option) {

                            

                        ?>

                                <div class="col s6 answerOption">
                                    <div class="optionWrap">
                                    <?php echo $letter[$optionCounter]; ?>:
                                    <label for="<?php echo $counter . $optionCounter; ?>">
                                        <input
                                            data-questionNumber= "<?php echo $counter ?>" 
                                            id="<?php echo $counter . $optionCounter; ?>"
                                            <?php 
                                                if($question['answer'] == $option) {
                                                    echo 'data-xsaah="m87"';
                                                } else {

                                                    $strs = array('bootesVoid', 'alphaCentauri', 'sagitariusA');
                                                    $number = mt_rand(0,2);
                                                    echo 'data-xsaah="' . $strs[$number] . '"';
                                                }
                                            ?>
                                        name="AnswerOptions<?php echo $counter; ?>" 
                                        type="radio"
                                        value="<?php echo $option; ?>"
                                        />
                                        <span><?php echo $option; ?></span>
                                    </label>
                                    </div>
                                </div>

                                <?php
                                    if($optionCounter == 1){
                                        echo "<div class='answerOptionSeparator col s12'></div>";
                                    }
                                ?>
                        <?php 
                        
                            $optionCounter++; }

                        }
                        ?>
                    </div>


                </div>
            </div>


            <div class="col s2">
                <div class="question-toolbar mark">
                    <i class="material-icons medium red-text"></i>
                </div>
                <?php 

                    if(isset($_SESSION['group']) && $_SESSION['group'] != 'student'){

                ?>
                    <div class="grey lighten-2 rounded question-toolbar edit">
                        <a 
                        class="white-text "
                        target="_blank"
                        href="<?php echo base_url( 'admin/question/' . $question['qid'] ); ?>">
                            <i class="material-icons medium">edit</i><span>Edit</span>
                        </a>
                    </div>

                <?php 
                        
                    }
                ?>

                <div class="question-toolbar share">

                </div>
            </div>


        </div>


        <?php $counter++; } ?>
    </div>

    <div class="col s3">
        <h5 class="instructionsTitle">The Instructions</h5>

        <div class="instructionsContent">
            <ol>
                <li>Answer all questions if possible, submitting with any unanswered question has no effect, the question will be marked with a <i class="material-icons small orange-text">priority_high</i> sign and the correct answer will be highlighted. otherwise, if you have answered all questions, the webapp will automatically submit your results to the database.</li>

                <li>The mark <i class="material-icons small green-text">check</i> on the top right corner of the question, with a green border on the left of the question means the answer chosen is correct. The mark <i class="material-icons small red-text">clear</i> with a red left border on the question, means that you got the answer wrong and the correct answer will be highlighted.</li>
                
                <li>Every correctly answered question contributes +5 points to your overall score. incorrectly answered questions do nothing.</li>
                
                <li>You can only answer a question once, after that all options will be disabled.</li>
            </ol>
        </div>
    </div>

</div>

<div class="card white z-depth-0 questionsStats" data-controller="open">
        <div class="stats-title">
            <h5 class=""><i class="material-icons">info</i> Stats <i id="controller-denoter" class="material-icons small right">arrow_drop_down</i></h5>
        </div>

        <div class="theStats">
            <div class="row answeredStat">
                <span class="stat-title col s6">Answered</span>
                <span class="col right-align s6">
                    <span class="stat-data">0</span>
                    <span class="totalQuestions">0</span>
                </span>
            </div>

            <div class="row correctStat">
                <span class="stat-title col s6">Correct</span>
                <span class="right-align stat-data col s6">0</span>
            </div>

            <div class="row wrongStat">
                <span class="stat-title col s6">Wrong</span>
                <span class="right-align stat-data col s6">0</span>
            </div>

            <div class="row scoreStat">
                <span class="stat-title col s6">Score</span>
                <span class="right-align stat-data col s6">0</span>
            </div>

            <div class="submit_results right">
                <br>
                <button class="btn waves-effect">
                    Submit<i class="material-icons right">send</i>
                </button>
                <br>
            </div>
        </div>
    </div>


    <input type="hidden" name="userID" id="userID" value="<?php echo $_SESSION['sid']; ?>">
<?php require(APPPATH . 'views/templates/footer.php'); ?>
            
<div class="homepage student-homepage container"> 


    <div class="card row">

        <div class="s12 col">
            <h4><i class="material-icons medium">assessment</i>Pick a grade & Exercise</h4>
        </div>

        <div class="col s6 input-field">
        
            <select id="gradeExerciseChoice" class="browser-default">
                <option value="" disabled selected>Choose a class</option>
                <option value="one">One</option>
                <option value="two">two</option>
                <option value="three">three</option>
                <option value="four">four</option>
                <option value="five">five</option>
                <option value="six">six</option>
                <option value="seven">seven</option>
            </select>

            <label>Choose a class</label>
        </div>
        <!--
            <div class="col s6 input-field">
        
            <select id="MarkOn" class="browser-default">
                <option value="Submision">Submision</option>
                <option value="question_answered">Quesition Answered</option>
            </select>

            <label>Mark question after...</label>
        </div>
        -->

        <div class="col s12 exercises-list flex-container">
            <!--<div class="flex-item exercise">Exercice 01</div>-->
            <div class="empty-exercise" style="flex-grow: 12">Pick a grade first!</div>
        </div>
    </div>

    <div class="row card">

        <div class="page-intro col s12">
            <h4>Hi!
            <span><b><?php echo $_SESSION['username']; ?></b></span>    
            </h4>
        </div>

        <hr class="col s12">


        <div class="col center-align student-info-card s4">
            <span class="info-title">Score</span>
            <h1><?php echo $score; ?></h1>
        </div>

        <div class="col center-align student-info-card s4">
            <span class="info-title">% Score</span>
            <h1><?php echo $percentscore; ?>%</h1>
        </div>

        <div class="col center-align student-info-card s4">
            <span class="info-title">Wrongs</span>
            <h1><?php echo $wrongs; ?></h1>
        </div>

        <div class="col center-align student-info-card s4">
            <span class="info-title">Corrects</span>
            <h1><?php echo $corrects; ?></h1>
        </div>

        <div class="col center-align student-info-card s4">
            <span class="info-title">Answered</span>
            <h1><?php echo $answered; ?></h1>
        </div>
        
        <div class="col center-align student-info-card s4">
            <span class="info-title">Ranking</span>
            <h1>#<?php echo $ranking; ?></h1>
        </div>

        <hr class="col s12">

        <div class="col center-align questions-action s12">
            <span style="display:block; margin-bottom: 12px;">Increase you score and ranking by answering more questions</span>
            <a 
            href="<?php echo base_url('questions'); ?>" class="btn waves-effect">
            Do Questions Randomly
            </a>
        </div>
        
        <hr class="col s12">

        <!--
        <div class="col s12 rank-progress">

            <div class="center-align ranking-title">
                <h6><b>50pts</b> to the next level</h6>
            </div>

            <div class="progress">
                <div class="determinate" style="width: 70%"></div>
            </div>

        </div>

        -->

    </div>
</div>
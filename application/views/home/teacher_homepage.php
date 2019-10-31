<div class="homepage container">
    <div class="row card">

        <div class="page-intro col s12">
            <h4>Hi!
            <span><b><?php echo $_SESSION['username']; ?></b></span>    
            </h4>
        </div>

        <hr class="col s12">


        <div class="col center-align student-info-card s4">
            <span class="info-title">Students</span>
            <h1><?php echo $studentscount; ?></h1>
        </div>

        <div class="col center-align student-info-card s4">
            <span class="info-title">Teachers</span>
            <h1><?php echo $teacherscount; ?></h1>
        </div>
    <!-- 
        <div class="col center-align student-info-card s4">
            <span class="info-title">Questions</span>
            <h1><?php echo $questionscount; ?></h1>
        </div>

    -->

        <hr class="col s12">

        <div class="col center-align questions-action s12">
            <span style="display:block; margin-bottom: 12px;">There can never be too many questions</span>
            <a 
            href="<?php echo base_url('admin/question'); ?>" class="btn waves-effect">
            Add Questions</a>
        </div>
        
        <hr class="col s12">

    </div>
</div>
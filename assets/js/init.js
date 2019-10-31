$(document).ready(function(){
    $('.sidenav').sidenav();

    $('.modal').modal();

    $('select').formSelect();

    $('.datepicker').datepicker({
        format: 'yyyy-mm-dd',
        yearRange: 30,
        maxDate: new Date()
    });

    $('.pushpin').each(function() {
        var $this = $(this);
        var $target = $('.questions');
        $this.pushpin({
        top: $target.offset().top,
        bottom: $target.offset().top + $target.outerHeight() - $this.height()
        });
    });

    $('.dropdown-trigger').dropdown();

    $('.carousel.carousel-slider').carousel({
        fullWidth: true,
        indicators: true
    });

    let totalQuestions = $(".questions .question").length;

    $('.totalQuestions').html("/"+totalQuestions);

    let Questions = {
        answered: 0,
        Correct: 0,
        Score: 0,
        wrong: 0,
        Q_Corrects: [],
        Q_wrongs: []
    }



    // On user register form button

    $('#submitReg').on('click', function(e){
        e.preventDefault();

        let selected_grade = $('#gradeselect').val();
        let firstname = $('#firstName').val();
        let surname = $('#Surname').val();
        let username = $('#Usernamereg').val();
        let password = $('#passwordreg').val();
        let date = $('#datereg').val();

        if(selected_grade === null ) {
            M.toast({html: "<i class=\"material-icons left Large\">block</i> You need to select a Grade" });
            return;
        }else if(firstname.length < 3 || surname.length < 3 || username.length < 3) {
            M.toast({html: "<i class=\"material-icons left Large\">block</i> Names cannot have less than three characters" });
            return;
        }
        else if(date === "") {
            M.toast({html: "<i class=\"material-icons left Large\">block</i> Please pick a birth date" });
            return;
        }
        else if(password.length < 5) {
            M.toast({html: "<i class=\"material-icons left Large\">block</i> Password needs atleast 5 characters" });
            return;
        }

        $.post("/wasa/index.php/auth/register", {
                'grade': selected_grade, 
                'firstName': firstname,
                'surname': surname,
                'username': username,
                'password': password,
                'date': date
            },
            function(data) {
                M.toast({html: data.msg, completeCallback: function() {location.reload();}, displayLength: 1200 });
            }
        );
    });


    // On user Login
    $('#submitLog').on('click', function(e){

        e.preventDefault();

        let username = $('#usernameLog').val();
        let password = $('#passwordlog').val();

        if(password.length < 5) {
            M.toast({html: "<i class=\"material-icons left Large\">block</i> Password needs atleast 5 characters" });
            return;
        }else if (username.length < 3) {
            M.toast({html: "<i class=\"material-icons left Large\">block</i> Names cannot have less than three characters" });
            return;
        }
        console.log(username);

        $.post("/wasa/index.php/auth/login", {
                'username': username,
                'password': password
            },
            function(data) {
                if(data.status === 'success') {


                    let spinner = `
                    <i class=\"material-icons left Large\">check</i> 
                    `;

                    M.toast({html: spinner+data.msg, completeCallback: function() {location.reload();}, displayLength: 1600, classes: 'green white-text rounded' });
                }else if (data.status === 'wp') {
                    M.toast({html: data.msg});
                }else if (data.status === 'unf') {
                    M.toast({html: data.msg});
                }else if (data.status === 'ali') {
                    M.toast({html: data.msg});
                }
            }
        );

        console.log("done sending data");


    });


    // On user Logout
    $('.logout_btn').on('click', function(e){
        e.preventDefault();

        $.post("/wasa/index.php/auth/logout", 
            function(data) {
                location.replace("/wasa/");
            }
        );

    });

    // On newQuestion textarea change
    $('#newQuestion textarea#question_content').on('keyup', function() {

        previewQuestion($(this));
        
    });

    function previewQuestion(questionObject){
        let text = questionObject.val();
        let warning = "<i class=\"material-icons left Large\">block</i><b>The first character cannot be whitespace</b>";

        if (text.length < 1 || text.charAt(0) == " "){
            $('#question_preview').css('display', 'none');
            M.toast({
                html: warning, 
                classes: 'rounded red white-text',
                displayLength: 1200
            });

            return;
        }

        let html = $.parseHTML( text );


        $('#question_preview').css('display', 'inherit').html(html);

        MathJax.Hub.Queue(["Typeset",MathJax.Hub,"question_preview"]);

    }


    // On newQuestion submission
    $('#submitQues').on('click', function(e){

        e.preventDefault();

        let qid = $('#qid').val();
        let selected_grade = $('#gradeselect').val();
        let option_4 = $('#option_4').val();
        let option_3 = $('#option_3').val();
        let option_2 = $('#option_2').val();
        let option_1 = $('#option_1').val();
        let question_content = $('#question_content').val();
        let answer = $('#answer').val();

        if(qid == 'NaN'){

            $.post("/wasa/admin/new_question", {
                'grade': selected_grade, 
                'option_4': option_4,
                'option_3': option_3,
                'option_2': option_2,
                'option_1': option_1,
                'question_content': question_content,
                'answer': answer
                },
                function(data) {
                    M.toast({
                        html: data.msg, 
                        classes: "rounded green white-text",  
                        completeCallback: function() {
                            location.replace('/wasa/admin/question/' + data.questionID);
                        },
                        displayLength: 1200
                     });
                }
            );

            return;
        }


        $.post("/wasa/admin/edit_question", {
            'grade': selected_grade, 
            'option_4': option_4,
            'option_3': option_3,
            'option_2': option_2,
            'option_1': option_1,
            'question_content': question_content,
            'answer': answer,
            'qid': qid 
            },
            function(data) {
                M.toast({
                    html: data.msg, 
                    classes: 'rounded green white-text',
                    displayLength: 1200                
                });
            }
        );



    });



    // On answer selection checkbox : Question form
    $('.ansBull').on('click', function(){
        $('.ansBull').prop('checked', false);
        $(this).prop('checked', true);

        let answerId = $(this).val();

        let answer = $("#" + answerId).val();

        $('#answer').val(answer);
    });


    // On question has been answered: Questions
    /*
    $('.answerOption input[type="radio"]').on('click', function() {

        let questionNumber = $(this).attr('data-questionnumber');

        Questions.answered = Questions.answered + 1;


        let parentAttr = '.questions .question[data-questionnumber="'+ questionNumber +'"]'

        $(parentAttr).toggleClass('answered grey lighten-5 lighten-4');

        let optionsGroup = 'input[name="AnswerOptions' + questionNumber + '"]';

        $(optionsGroup).attr('disabled', true);

        if($(this).attr('data-xsaah') == 'm87') {

            Questions.Correct = Questions.Correct + 1;
            Questions.Score = Questions.Score + 5;

            updateQuestionsStats();

            $(parentAttr).find('.mark i').html('check').toggleClass('green-text red-text');
            $(parentAttr).find('.mark').css('border', '4px solid #4CAF50');
            $(parentAttr).toggleClass('CorrectAnswered');

            M.toast({
                html: "<i class=\"material-icons left Large\">check</i> Nice +5", 
                classes: " rounded green white-text",
                displayLength: 1200
             });

             if(Questions.answered == totalQuestions) {
                 submitQuestionResults();
             }


            return;
        }

        Questions.wrong = Questions.wrong + 1;
        updateQuestionsStats();

        $(optionsGroup + '[data-xsaah="m87"]').parent().parent().toggleClass('correctOption')
        $(parentAttr).find('.mark i').html('clear');
        $(parentAttr).find('.mark').css('border', '4px solid #da0202');
        $(parentAttr).toggleClass('WrongAnswered');

        M.toast({
            html: "<i class=\"material-icons left Large\">clear</i> Wrong", 
            classes: " rounded red white-text",
            displayLength: 1200
        });

        if(Questions.answered == totalQuestions) {
            submitQuestionResults();
        }

    });

    */

   // On question has been answered: Questions
    $('.answerOption input[type="radio"]').on('click', function() {

        let questionNumber = $(this).attr('data-questionnumber');

        Questions.answered = Questions.answered + 1;

        let parentAttr = '.questions .question[data-questionnumber="'+ questionNumber +'"]'

        $(parentAttr).toggleClass('answered grey lighten-5 lighten-4');

        let optionsGroup = 'input[name="AnswerOptions' + questionNumber + '"]';

        $(optionsGroup).attr('disabled', true);

        if($(this).attr('data-xsaah') == 'm87') {

            Questions.Q_Corrects.push(questionNumber);

            Questions.Correct = Questions.Correct + 1;
            Questions.Score = Questions.Score + 5;

            /*
            $(parentAttr).find('.mark i').html('check').toggleClass('green-text red-text');
            $(parentAttr).find('.mark').css('border', '4px solid #4CAF50');
            $(parentAttr).toggleClass('CorrectAnswered');

            M.toast({
                html: "<i class=\"material-icons left Large\">check</i> Nice +5", 
                classes: " rounded green white-text",
                displayLength: 1200
             });
             */

             if(Questions.answered == totalQuestions) {
                 submitQuestionResults();
             }

            return;
        }

        Questions.wrong = Questions.wrong + 1;
        Questions.Q_wrongs.push(questionNumber);

        /*
        $(optionsGroup + '[data-xsaah="m87"]').parent().parent().toggleClass('correctOption')
        $(parentAttr).find('.mark i').html('clear');
        $(parentAttr).find('.mark').css('border', '4px solid #da0202');
        $(parentAttr).toggleClass('WrongAnswered');

        M.toast({
            html: "<i class=\"material-icons left Large\">clear</i> Wrong", 
            classes: " rounded red white-text",
            displayLength: 1200
        });
        */

        if(Questions.answered == totalQuestions) {
            submitQuestionResults();
        }

    });

   
    function updateQuestionsStats() {
        console.log(Questions);
        $('.answeredStat .stat-data ').html(Questions.answered);
        $('.correctStat .stat-data ').html(Questions.Correct);
        $('.wrongStat .stat-data ').html(Questions.wrong);
        $('.scoreStat .stat-data ').html(Questions.Score);
    }

    // On button click to submit results : Questions
    $('.submit_results button').on('click', function(){
        
        submitQuestionResults();
    });


    function submitQuestionResults(){
        $('.question[data-questiontype="multiplechoice"] input[data-xsaah]').attr('disabled', true);
        $('.question.lighten-5[data-questiontype="multiplechoice"] input[data-xsaah="m87"]').parent().parent().toggleClass('correctOption');
        $('.question.lighten-5[data-questiontype="multiplechoice"]').find('.mark i').html('priority_high').toggleClass('orange-text red-text');
        $('.question.lighten-5[data-questiontype="multiplechoice"]').find('.mark').css('border', '4px solid orange');
        $('.question.lighten-5[data-questiontype="multiplechoice"]').toggleClass('unAnswered answered lighten-5 lighten-4');


        $.each(Questions.Q_Corrects, function( index, value ){
            let parentAttr = '.questions .question[data-questionnumber="'+ value +'"]';

            $(parentAttr).find('.mark i').html('check').toggleClass('green-text red-text');
            $(parentAttr).find('.mark').css('border', '4px solid #4CAF50');
            $(parentAttr).toggleClass('CorrectAnswered');
        });

        $.each(Questions.Q_wrongs, function( index, value ){
            let parentAttr = '.questions .question[data-questionnumber="'+ value +'"]';
            let optionsGroup = 'input[name="AnswerOptions' + value + '"]';


            $(optionsGroup + '[data-xsaah="m87"]').parent().parent().toggleClass('correctOption')
            $(parentAttr).find('.mark i').html('clear');
            $(parentAttr).find('.mark').css('border', '4px solid #da0202');
            $(parentAttr).toggleClass('WrongAnswered');
        });

        $('.question[data-questiontype="fillIn"]').each(function(){
            let answer01 = $(this).find("input[name='answer_1_hidden']").val();
            let gienAnswer01 = $(this).find("input#answer1_input").val();

            if (gienAnswer01 == "") {
                $(this).find("input#answer1_input").css("color", "orange").val(answer01).attr('disabled', true);
                $(this).find('.mark i').html('priority_high').toggleClass('orange-text red-text');
                $(this).find('.mark').css('border', '4px solid orange');
                $(this).toggleClass('unAnswered answered lighten-5 lighten-4');
            }
            else if (gienAnswer01 == answer01) {
                $(this).find("input#answer1_input").focus().css("color", "green").attr('disabled', true);
                $(this).find('.mark i').html('check').toggleClass('green-text red-text');
                $(this).find('.mark').css('border', '4px solid #4CAF50');
                $(this).toggleClass('answered lighten-5 lighten-4 grey CorrectAnswered');
            }else {
                $(this).find("input#answer1_input").css("color", "red").attr('disabled', true);
                $(this).find("correctfirstanswer").css("display", "inherit").html(answer01)
                $(this).find('.mark i').html('clear');
                $(this).find('.mark').css('border', '4px solid #da0202');
                $(this).toggleClass('WrongAnswered');
            }  
            
        });
        
        updateQuestionsStats();
        $('.submit_results button').attr('disabled', true);

        let sid = $('input#userID').val();

        $.post("/wasa/questions/submit_results", 
            {
                'sid': sid,
                'wrongs': Questions.wrong,
                'corrects': Questions.Correct,
                'answered': Questions.answered,
                'score': Questions.Score
            },
            function(data) {
                M.toast({
                    html: data.msg, 
                    classes: " rounded orange white-text",
                    displayLength: 4000                
                });
            }
        );

    }


    $('.stats-title h5').on('click', function(){
        let controllerHeight = $('.questionsStats').height();
        let titlebarHeight = $(this).height();
        let dataController = $('.questionsStats').attr('data-controller');

        $(this).toggleClass('green white-text pulse');
        
        if(dataController == 'open'){
            let bottomPxCss = controllerHeight - titlebarHeight - 10;
            $('.questionsStats').css('bottom', -bottomPxCss);
            $('#controller-denoter').html('arrow_drop_up');
            $('.questionsStats').attr('data-controller', 'closed');
            return;
        }

        $('.questionsStats').css('bottom', '0px');
        $('#controller-denoter').html('arrow_drop_down');
        $('.questionsStats').attr('data-controller', 'open');

    });


    $('.dropdown-content a').on('click', function(){
        let groupName = $(this).html().toLowerCase();
        let parent = $(this).parent().parent();
        let parentID = parent.attr('id');
        let userID = parent.attr('data-userid');
        let username = parent.attr('data-username');

        $.post("/wasa/admin/edit_user_group", 
            {
                'sid': userID,
                'group': groupName
            },
            function(data) {

                $('a[data-target="' + parentID + '"]').parent().html(groupName).toggleClass('user_group');

                M.toast({
                    html: 'The user ' + username + ' is now a teacher.', 
                    classes: "rounded green white-text",
                    displayLength: 1200                
                });
            }
        );
        
    });

    $('.pagination-nav-link a').on('click', function(e){
        e.preventDefault();
    });

    $("#gradeExerciseChoice").on("change", function(){
        let selected_class = $("#gradeExerciseChoice option:selected").val();
        switch(selected_class){
            case "one":
                renderExerciseBoxes(3, selected_class);
                break;
            case "two":
                renderExerciseBoxes(4, selected_class);
                break;
            case "three":
                renderExerciseBoxes(4, selected_class);
                break;
            case "four":
                renderExerciseBoxes(3, selected_class);
                break;
            case "five":
                renderExerciseBoxes(3, selected_class);
                break;
            case "six":
                renderExerciseBoxes(4, selected_class);
                break;
            case "seven":
                renderExerciseBoxes(3, selected_class);
                break;
        }
    });

    function renderExerciseBoxes(anumber, exclass) {

        let exercise = ``;
        for (i = 0; i < anumber; i++) { 
            exercise = exercise + `<div data-class="${anumber}" data-classint="${i+1}"  data-classname="${exclass}" class="flex-item exercise">Exercice 0${i+1}<span class="exClass">class ${exclass}</span></div>`;
        }
        let html = $.parseHTML( exercise );
        $(".exercises-list").empty();
        $(".exercises-list").append(html);
        $(".exercises-list").css("display", "flex");
    }

    $(".exercises-list").on("click", ".exercise", function(){
        window.location.replace("http://localhost/wasa/questions/"+ ($(this).attr("data-class")+$(this).attr("data-classint")) + "/" + $(this).attr("data-classname") + "/25");
    });


  });
        
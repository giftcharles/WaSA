<!DOCTYPE html>

<html>

    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/materialize.min.css">
        <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/style.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title></title>
    </head>

    <body class="grey lighten-5">
    
        <div class="wrap">

            <div class="header">

                <nav class="white z-depth-0 grey lighten-4"> 
                    <div class="nav-wrapper container">
                        <a href="#" data-target="slide-out" class="black-text sidenav-trigger"><i class="material-icons">menu</i></a>
                        <a href="<?php echo base_url(); ?>" class="brand-logo black-text">WaSA</a>

                        <!--
                        <ul id="nav-mobile" class="right black-text hide-on-med-and-down">
                            <li><a href="sass.html" class="black-text">Sass</a></li>
                        </ul>
                        -->
                    </div> 
                </nav>

                <ul id="slide-out" class="sidenav sidenav-fixed">
                <li>
                <?php if(isset($_SESSION['logged_in'])) { ?>
                    <div class="user-view">
                        <div class="background">
                            <img src="<?php echo base_url(); ?>/assets/img/green10.jpg">
                        
                        </div>
                    <a href="#user"><img class="circle" src="<?php echo base_url(); ?>/assets/img/pp.jpg"></a>
                    <?php if($_SESSION['group'] === "teacher") { ?>
                        <span class="new badge" data-badge-caption="teacher"></span>
                    <?php } ?>
                    <a href="#name"><span class="white-text name"><?php echo $_SESSION['username']; ?></span></a>
                    <a href="#name"><span class="white-text email"><?php echo $_SESSION['firstname'] . " " . $_SESSION['surname'];  ?></span></a>
                    </div>
                <?php } ?>

                </li>




                <?php if(isset($_SESSION['logged_in'])) { ?>

                    <li><a href="<?php echo base_url(); ?>"><i class="material-icons">home</i>Home</a></li>

                    <?php if($_SESSION['group'] == 'teacher') { ?>
                        <li><a href="<?php echo base_url('questions'); ?>"><i class="material-icons">assignment</i>Questions</a></li>
                        <li><a href="<?php echo base_url('admin/question'); ?>"><i class="material-icons">add</i>New Question</a></li>
                        <li><a href="<?php echo base_url('admin/users'); ?>"><i class="material-icons">supervisor_account</i>Users</a></li>
                    <?php } ?>
                    <li><div class="divider"></div></li>
                    <li><a class="subheader">info</a></li>
                        <!-- 
                    <li><a href="#!"><i class="material-icons">account_circle</i>Profile</a></li>
                    <li><a href="#!"><i class="material-icons">settings</i>Settings</a></li>
                    -->
                <?php }else{ ?>
                    
                    
                    <li><a href="<?php echo site_url(); ?>"><i class="material-icons">home</i>Home</a></li>
            
                
                <?php } ?>

                <li><a href="<?php echo base_url('pages/about'); ?>"><i class="material-icons">info</i>About</a></li>

                
                <?php if(!isset($_SESSION['logged_in'])) { ?>

                <li><a href="#reglogin" class="waves-effect waves-light btn modal-trigger">Login</a></li>

                <?php }else{ ?>

                <li><a href="#" class="logout_btn"><i class="material-icons">exit_to_app</i>Logout</a></li>
                
                <?php } ?>

                </ul>

            </div>
            <main class="content">

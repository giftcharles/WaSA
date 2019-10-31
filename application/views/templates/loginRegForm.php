<div id="reglogin" class="modal">
            <div class="modal-content">
                <div class="container row">
                    <div class="col s6 register-col">
                        <form action="">
                            <h3>Register</h3>

                            <div class="input-field">
                                <select id="gradeselect">
                                    <option value="" disabled selected>Choose your grade/class</option>
                                    <?php 
                        
                                        $classes = array(
                                            'one', 'two', 'three', 'four', 'five', 'six', 'seven'
                                        ); 
                                        
                                        foreach ($classes as &$class) {

                                        ?>

                                        <option value="<?php echo $class; ?>"><?php echo $class; ?></option>

                                    <?php } ?>
                                </select>
                                <label>Grade</label>
                            </div>


                            <div class="input-field">
                                <input id="firstName" type="text" class="validate">
                                <label for="firstName">First Name</label>
                            </div>

                            <div class="input-field">
                                <input id="Surname" type="text" class="validate">
                                <label for="Surname">Surname</label>
                            </div>

                            <div class="input-field">
                                <i class="material-icons prefix">account_circle</i>
                                <input id="Usernamereg" type="text" class="validate">
                                <label for="Usernamereg">Username</label>
                            </div>

                            <div class="input-field">
                                <i class="material-icons prefix">lock_outline</i>
                                <input id="passwordreg" type="password" class="validate">
                                <label for="passwordreg">password</label>
                            </div>

                            <div class="input-field">
                                <i class="material-icons prefix">perm_contact_calendar</i>

                                <input id="datereg" type="text" class="datepicker">
                                <label for="datereg">Birth date</label>
                            </div>

                            <button class="btn waves-effect waves-light" id="submitReg" type="submit" name="action">Register
                                <i class="material-icons right">send</i>
                            </button>

                           

                        </form>
                    </div>

                    <div class="col s6 login-col">
                        <form action="">
                            <h3>Login</h3>
                            <div class="input-field">
                                <i class="material-icons prefix">account_circle</i>
                                
                                <input id="usernameLog" type="text" class="validate">
                                <label for="usernameLog">Username</label>
                            </div>

                            <div class="input-field">
                                <i class="material-icons prefix">lock_outline</i>

                                <input id="passwordlog" type="password" class="validate">
                                <label for="passwordlog">password</label>
                            </div>
                            <button class="btn waves-effect waves-light right" id="submitLog" type="submit" name="action">Login
                                <i class="material-icons right">send</i>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
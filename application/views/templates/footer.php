            </main>


            <footer>

            </footer>

        </div>

        <?php if(!isset($_SESSION['logged_in'])) { ?>

            <?php require(APPPATH . 'views/templates/loginRegForm.php'); ?>
            

        <?php } ?>


        <script src="<?php echo base_url(); ?>assets/js/jQuery.js"></script>
        <script src="<?php echo base_url(); ?>assets/js/materialize.min.js"></script>
        <script src="<?php echo base_url(); ?>assets/js/init.js"></script>
        <script type="text/javascript" async
  src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-MML-AM_CHTML">
</script>


    </body>



</html>
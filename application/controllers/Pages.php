<?php
defined('BASEPATH') OR exit('No direct script access allowed');



class Pages extends CI_Controller {

    public function index($page)
    {

        if($page == 'about') {
            $this->load->view('pages/about');
        }

    }

}
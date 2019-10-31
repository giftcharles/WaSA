<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {

    public function login() 
    {

        if(isset($_SESSION['logged_in'])) {
            return false;
        }

        $data['password'] =  $this->input->post('password');
        $data['username'] =  $this->input->post('username');

        $response = $this->confirmUserLoginDetailsinDB($data);

        $this->output
            ->set_status_header(200)
            ->set_content_type('application/json', 'utf-8')
            ->set_output(json_encode($response));

    }

    public function register() 
    {
        $data['firstname'] =  $this->input->post('firstName');
        $data['surname'] =  $this->input->post('surname');
        $data['birthdate'] =  $this->input->post('date');
        $data['password'] =  $this->input->post('password');
        $data['class'] =  $this->input->post('grade');
        $data['username'] =  $this->input->post('username');


        $query = $this->db->insert('users', $data);

        if($query){

            $this->confirmUserLoginDetailsinDB($data);

            $response = array("msg" => "You were registered into the database<br>logging you in & Reloading page...");
        } else {
            $response = array("msg" => "Failed to register you");
        }


        $this->output
            ->set_status_header(200)
            ->set_content_type('application/json', 'utf-8')
            ->set_output(json_encode($response));

    }

    public function logout() 
    {
        $array_items = array('username', 'firstname', 'surname', 'birthdate', 'grade', 'group', 'logged_in');

        $this->session->unset_userdata($array_items);
    }

    private function setUserLoginSession($user) 
    {   

        $newdata = array(
            'username'  => $user->username,
            'sid'  => $user->sid,
            'firstname'     => $user->firstName,
            'surname' => $user->surname,
            'birthdate' => $user->birthdate,
            'grade' => $user->class,
            'group' => $user->group,
            'logged_in' => TRUE
        );
        
        $this->session->set_userdata($newdata);

    }


    private function confirmUserLoginDetailsinDB($data) 
    {

        $query = $this->db->get_where('users', array('username' => $data['username']));

        if ($query->num_rows() > 0)
        {
            $row = $query->row(); 
            $password = $row->password;

            if ($password === $data['password']){

                $this->setUserLoginSession($row);

                $response = array(
                    "msg" => "You were logged into the website <br>Reloading page...",
                    "status" => 'success'
                );
            }else {
                $response = array(
                    "msg" => "Wrong password",
                    "status" => 'wp'
                );
            }
        }else {
            $response = array(
                "msg" => "No such user in the database",
                "status" => 'unf'
            );
        }

        return $response;

    }

}
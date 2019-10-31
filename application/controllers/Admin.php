<?php
defined('BASEPATH') OR exit('No direct script access allowed');



class Admin extends CI_Controller {

    public function question($id=NULL){
        
        if (! isset($_SESSION['group']) ||  $_SESSION['group'] != 'teacher' ) {
            show_404();
        }

        if($id == NULL){
            $data = array(
            'question' => '',
            'grade' => '',
            'answer' => 'NaN',
            'options' => array(
                '',
                '', 
                '',
                ''
            ),
            'qid' => 'NaN',);

            $this->load->view('admin/question', $data);
        }else{

            $query = $this->db->get_where('questions', array('qid' => $id));

            if ($query->num_rows() > 0){

                $row = $query->row();
                $data['question'] = $row->question;
                $data['option_1'] = $row->option_1;
                $data['option_2'] = $row->option_2;
                $data['option_3'] = $row->option_3;
                $data['option_4'] = $row->option_4;
                $data['grade'] = $row->grade;
                $data['qid'] = $row->qid;
                $data['answer'] = $row->answer;
                $data['options'] = array(
                    $row->option_1,
                    $row->option_2, 
                    $row->option_3,
                    $row->option_4
                );
                $this->load->view('admin/question', $data);
            }else{
                show_404();
            }
        }


    }

    public function questions() 
    {
        
    }

    public function users($offset=1, $orderby='sid', $cres='asc')
    {

        $limit = 25;

        $offset = ($offset-1)*$limit;

        $data['numusers'] = $this->db->get('users')->num_rows();
        $data['limit'] = $limit;
        
        $this->db->order_by($orderby, $cres);

        $data['users'] = $this->db->get('users', $limit, $offset)->result_array();

        $this->load->view('admin/users', $data);
    }

    public function new_question() 
    {
        $data['grade'] =  $this->input->post('grade');
        $data['option_4'] =  $this->input->post('option_4');
        $data['option_3'] =  $this->input->post('option_3');
        $data['option_2'] =  $this->input->post('option_2');
        $data['option_1'] =  $this->input->post('option_1');
        $data['question'] =  $this->input->post('question_content');
        $data['answer'] =  $this->input->post('answer');

        $query = $this->db->insert('questions', $data);

        if($query){
            $query2 = $this->db->get_where('questions', $data);
            $row = $query2->row();

            $response = array("msg" => "The question was added to the database", 'questionID' => $row->qid);
        } else {
            $response = array("msg" => "Failed to add the question");
        }


        $this->output
            ->set_status_header(200)
            ->set_content_type('application/json', 'utf-8')
            ->set_output(json_encode($response));
    }


    public function edit_question() 
    {
        $data['qid'] =  $this->input->post('qid');
        $data['grade'] =  $this->input->post('grade');
        $data['option_4'] =  $this->input->post('option_4');
        $data['option_3'] =  $this->input->post('option_3');
        $data['option_2'] =  $this->input->post('option_2');
        $data['option_1'] =  $this->input->post('option_1');
        $data['question'] =  $this->input->post('question_content');
        $data['answer'] =  $this->input->post('answer');

        $query = $this->db->replace('questions', $data);

        if($query){
            $response = array("msg" => "The question was updated successfully");
        } else {
            $response = array("msg" => "Failed to update the question");
        }


        $this->output
            ->set_status_header(200)
            ->set_content_type('application/json', 'utf-8')
            ->set_output(json_encode($response));

    }


    public function edit_user_group() 
    {
        $data['group'] = $this->input->post('group');
        $data['sid'] = $this->input->post('sid');

        if ($data['group'] == 'teacher'){

            $data['class'] = '';
            $data['answered'] = 0;
            $data['wrongs'] = 0;
            $data['corrects'] = 0;
            $data['score'] = 0;
    
            $this->db->where('sid', $data['sid']);
            $this->db->update('users', $data);

            $response = array("msg" => "The user is now a teacher");

        }

        $this->output
            ->set_status_header(200)
            ->set_content_type('application/json', 'utf-8')
            ->set_output(json_encode($response));
    }


}

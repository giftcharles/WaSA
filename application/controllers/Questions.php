<?php
defined('BASEPATH') OR exit('No direct script access allowed');



class Questions extends CI_Controller {

    public function index($seed=4,$level="seven",$limit=100)
    {
        $classes_array = array("one", "two", "three", "four", "five", "six", "seven");

        // The seed is the exercise number
        $this->db->order_by('question');

        switch($level){
            case "six":
                $this->db->where_not_in("grade", array_slice($classes_array, 6,6));
                break;
            case "five":
                $this->db->where_not_in("grade", array_slice($classes_array, 5,6));
                break;
            case "four":
                $this->db->where_not_in("grade", array_slice($classes_array, 4,6));
                break;
            case "three":
                $this->db->where_not_in("grade", array_slice($classes_array, 3,6));
                break;
            case "two":
                $this->db->where_not_in("grade", array_slice($classes_array, 3,6));
                break;
            case "one":
                $this->db->where_not_in("grade", array_slice($classes_array, 3,6));
                break;
        }

        $query = $this->db->get('questions', $limit);

        $questions = $query->result_array();

        @mt_srand($seed);
        for ($i = count($questions) - 1; $i > 0; $i--)
        {
            $j = @mt_rand(0, $i);
            $tmp = $questions[$i];
            $questions[$i] = $questions[$j];
            $questions[$j] = $tmp;
        }

        $data['questions'] = $questions;

        $this->load->view('questions', $data);

    }


    public function results() 
    {

        $id = $this->input->post('sid');

        $query = $this->db->get_where('users', array('sid'=> $id));
       
        if ($query->num_rows() > 0) {
            $row = $query->row();

            $wrongs = $row->wrongs + $this->input->post('wrongs');
            $corrects = $row->corrects + $this->input->post('corrects');
            $answered = $row->answered + $this->input->post('answered');
            $score = $row->score + $this->input->post('score');

        }
       
        $data = array(
            'wrongs' => $wrongs,
            'corrects' => $corrects,
            'answered' => $answered,
            'score' => $score
        );

        $this->db->where('sid', $id);
        $query = $this->db->update('users', $data);

        if($query){
            $response = array("msg" => "<i class=\"material-icons left Large\">check</i> results sent");
        } else {
            $response = array("msg" => "Failed to update the question");
        }


        $this->output
            ->set_status_header(200)
            ->set_content_type('application/json', 'utf-8')
            ->set_output(json_encode($response));

    }




}
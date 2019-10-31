<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

	public function index()
	{
		$id = '';
		$data = array();

		if (isset($_SESSION['logged_in'])) {

			if($_SESSION['group'] == 'student'){

			
				$id = $_SESSION['sid'];
				$user = $this->db->get_where('users', array('sid' => $id))->row();

				$score = $user->score;
				$answered = $user->answered;
				$percentageScore = round(($score / ($answered*5)) * 100); 

				$rank = 0;
				$this->db->order_by('score', 'desc');
				$query = $this->db->get('users');

				foreach($query->result() as $row)
				{
					$rank++;
					if( $row->sid == $id )
					{
						$ranking = $rank+1;
						break; // No more iterating
					} 
				}

				$data = array(
					'username'  => $user->username,
					'sid'  => $user->sid,
					'firstname'     => $user->firstName,
					'surname' => $user->surname,
					'birthdate' => $user->birthdate,
					'grade' => $user->class,
					'group' => $user->group,
					'answered' => $answered,
					'wrongs' => $user->wrongs,
					'corrects' => $user->corrects,
					'score' => $score,
					'percentscore' => $percentageScore,
					'ranking' => $ranking
				);

			}else {

				$data['studentscount'] = $this->db->get_where('users', array('group'=>'student'))->num_rows();
				$data['teacherscount'] = $this->db->get_where('users', array('group'=>'teacher'))->num_rows();
				$data['questionscount'] = $this->db->get('questions')->num_rows();

			}

		}
		

		$this->load->view('home/home', $data);
	}
}

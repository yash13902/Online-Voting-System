<?php
	include 'includes/session.php';
	include 'includes/slugify.php';

	if(isset($_POST['vote'])){
		if(count($_POST) == 1){
			$_SESSION['error'][] = 'Please vote atleast one candidate';
		}
		else{
			$_SESSION['post'] = $_POST;
			$sql = "SELECT * FROM constituencies";
			$query = $conn->query($sql);
			$error = false;
			$sql_array = array();
			while($row = $query->fetch_assoc()){
				$constituency = slugify($row['description']);
				$pos_id = $row['id'];
				if(isset($_POST[$constituency])){
					if($row['max_vote'] > 1){
						if(count($_POST[$constituency]) > $row['max_vote']){
							$error = true;
							$_SESSION['error'][] = 'You can only choose '.$row['max_vote'].' candidates for '.$row['description'];
						}
						else{
							foreach($_POST[$constituency] as $key => $values){
								$sql_array[] = "INSERT INTO votes (voters_id, candidate_id, constituency_id) VALUES ('".$voter['id']."', '$values', '$pos_id')";
							}

						}
						
					}
					else{
						$candidate = $_POST[$constituency];
						$sql_array[] = "INSERT INTO votes (voters_id, candidate_id, constituency_id) VALUES ('".$voter['id']."', '$candidate', '$pos_id')";
					}

				}
				
			}

			if(!$error){
				foreach($sql_array as $sql_row){
					$conn->query($sql_row);
				}

				unset($_SESSION['post']);
				$_SESSION['success'] = 'Ballot Submitted';

			}

		}

	}
	else{
		$_SESSION['error'][] = 'Select candidates to vote first';
	}

	header('location: home.php');

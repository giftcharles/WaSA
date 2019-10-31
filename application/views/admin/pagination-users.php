<ul class="pagination">
                

                <?php
                
                    $segmentNumber = $this->uri->segment(3);
                    $currentPage = 1;
                    $numberOfpages = round($numusers / $limit);

                    echo '<li class="pagination-nav-link '; 
                    if($segmentNumber == 1){
                        echo 'disabled';
                    }

                    echo '"><a href="';
                    echo base_url(array('admin','users', $segmentNumber-1, $this->uri->segment(4), $this->uri->segment(5)));
                    echo '"><i class="material-icons">chevron_left</i></a></li>';

                    while($currentPage <= ($numberOfpages+1)){


                        $segments = array('admin','users', $currentPage, $this->uri->segment(4), $this->uri->segment(5));

                        $pageLink = base_url($segments);

                        echo '<li class="waves-effect';

                        if($segmentNumber == $currentPage){
                            echo ' active';
                        }
                        echo '"><a href="' . $pageLink  . '">'. $currentPage .'</a></li>'; 


                        $currentPage++;
                    }


                    echo '<li class="pagination-nav-link '; 
                    if($segmentNumber == $currentPage-1){
                        echo 'disabled';
                    }

                    echo '"><a href="';
                    echo base_url(array('admin','users', $segmentNumber+1, $this->uri->segment(4), $this->uri->segment(5)));
                    echo '"><i class="material-icons">chevron_right</i></a></li>';
                
                ?>
            </ul>
<?php
$stdin = fopen('php://stdin', 'r');
$json = '';
while (FALSE !== ($line = fgets(STDIN))) {
   $json .= $line;
}


$repos = json_decode($json, true);



foreach($repos as $repo) {
  echo $repo['ssh_url'] . "\n";
}

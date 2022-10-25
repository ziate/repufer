<?php


$path = $_GET['path'];
if(!rmdir($path)) {
  echo ("Could not remove $path");
}else{
    echo ("DON remove $path");
}



?>
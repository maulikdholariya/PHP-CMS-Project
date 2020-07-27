<?php 

$query= "UPDATE posts SET";
$query .="post_title = '{$post_title}', ";
$query .="post_category_id = '{$post_category_id}', ";
$query .="post_date = now(), ";
$query .="post_author = '{$post_author}', ";
$query .="post_status = '{$post_status}', ";
$query .="post_tags = '{$post_tags}', ";
$query .="post_content = '{$post_content}', ";
$query .="post_image = '{$post_image}' ";
$query .="WHERE post_id = '{$the_post_id}' ";
to this:

$query = "UPDATE posts SET ";  // Added a whitespace
$query .="post_title = '{$post_title}', ";
$query .="post_category_id = '{$post_category_id}', ";
$query .="post_date = now(), ";
$query .="post_author = '{$post_author}', ";
$query .="post_status = '{$post_status}', ";
$query .="post_tags = '{$post_tags}', ";
$query .="post_content = '{$post_content}', ";
$query .="post_image = '{$post_image}' ";
$query .="WHERE post_id = {$the_post_id}"; // Removed quotes around th


?>
<?php 

if(isset($_POST['create_post'])){

         
          $post_title = $_POST['post_title']; 
          $post_author = $_POST['post_author']; 
          $post_category_id= $_POST['post_category']; 
          $post_status = $_POST['post_status'];
      
           
          $post_image = $_FILES['post_image']['name']; 
          $post_image_temp= $_FILES['post_image']['tmp_name']; 


          $post_tags = $_POST['post_tags']; 
          $post_content = $_POST['post_content']; 
          $post_date = date('d-m-y'); 
      
                    

            move_uploaded_file($post_image_temp, "../images/$post_image" );

$query="INSERT INTO posts(post_title,post_author,post_category_id,post_status,post_image,post_tags,post_content,post_date) "; 
$query .= "VALUES('{$post_title}','{$post_author}','{$post_category_id}','{$post_status}','{$post_image}','{$post_tags}','{$post_content}',now() ) ";

$create_post_query=mysqli_query($connection,$query);

confirmQuery($create_post_query);   





}






?>

<form action="" method="post" enctype="multipart/form-data">

    <div class="form-group">
        <label for="post_title">Post Title</label>
        <input type="text" class="form-control" name="post_title">
    </div>

    <div class="form-group">

        <select name="post_category" id="">

            <?php 

$query="SELECT * FROM categories";

    $select_categories=mysqli_query($connection,$query);

    confirmQuery($select_categories);

    while($row = mysqli_fetch_assoc($select_categories)){
    $cat_id =$row['cat_id'];
    $cat_title =$row['cat_title'];

echo "<option value='$cat_id'>{$cat_title}</option>"; 


    }

?>


        </select>
    </div>


    <div class="form-group">
        <label for="post_author">Post Author</label>
        <input type="text" class="form-control" name="post_author">
    </div>

    <label for="post_status">Post Status</label>
    <div class="form-group">
        
        <select name="post_status" id="" >
         <option value='draft'>Draft</option>
         <option value='published'>Published</option> 
       
        </select>
    </div>

    <div class="form-group">
        <label for="post_image">Post Image</label>
        <input type="file" name="post_image">
    </div>

    <div class="form-group">
        <label for="post_tags">Post Tags</label>
        <input type="text" class="form-control" name="post_tags">
    </div>


    <div class="form-group">
        <label for="post_content">Post content</label>
        <textarea class="form-control" name="post_content" id="" cols="30" rows="10"></textarea>
    </div>

    <div class="form-group">
        <input type="submit" class="btn btn-primary" name="create_post" value="Publish">
    </div>

</form>
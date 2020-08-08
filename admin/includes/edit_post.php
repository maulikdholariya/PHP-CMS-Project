<?php

if (isset($_GET['p_id'])) {

    $the_post_id = escape($_GET['p_id']);

}

$query = "SELECT * FROM posts WHERE post_id = $the_post_id";
$select_posts_by_id = mysqli_query($connection, $query);
while ($row = mysqli_fetch_assoc($select_posts_by_id)) {
    $post_id = escape($row['post_id']);
    $post_user = escape($row['post_user']);
    $post_title = escape($row['post_title']);
    $post_category_id = escape($row['post_category_id']);
    $post_status = escape($row['post_status']);
    $post_image = escape($row['post_image']);
    $post_content = escape($row['post_content']);
    $post_tags = escape($row['post_tags']);
    $post_comment_count = escape($row['post_comment_count']);
    $post_date = escape($row['post_date']);

}

if (isset($_POST['update_post'])) {

    $post_title = escape($_POST['post_title']);
    $post_user = escape($_POST['post_user']);
    $post_category_id = escape($_POST['post_category']);
    $post_status = escape($_POST['post_status']);

    $post_image = escape($_FILES['post_image']['name']);
    $post_image_temp = escape($_FILES['post_image']['tmp_name']);

    $post_date = escape(date('d-m-y'));
    $post_tags = escape($_POST['post_tags']);
    $post_content = escape($_POST['post_content']);

    move_uploaded_file($post_image_temp, "../images/$post_image");

    $query = "UPDATE posts SET ";
    $query .= "post_title = '{$post_title}', ";
    $query .= "post_category_id = '{$post_category_id}', ";
    $query .= "post_date = now(), ";
    $query .= "post_user = '{$post_user}', ";
    $query .= "post_status = '{$post_status}', ";
    $query .= "post_tags = '{$post_tags}', ";
    $query .= "post_content = '{$post_content}', ";
    $query .= "post_image = '{$post_image}' ";
    $query .= "WHERE post_id = {$the_post_id} ";

    $update_post = mysqli_query($connection, $query);

    confirmQuery($update_post);

    echo "<p class='bg-success'> Post Updated. <a href='../post.php?p_id={$the_post_id}'> View Post </a> or <a href='posts.php'>Edit More Posts</a> </p>";

}

?>
<form action="" method="post" enctype="multipart/form-data">

    <div class="form-group">
        <label for="post_title">Post Title</label>
        <input value="<?php echo $post_title ?>" type="text" class="form-control" name="post_title">
    </div>

    <div class="form-group">
    <label for="post_category">Category</label>
        <select name="post_category" id="">

            <?php

$query = "SELECT * FROM categories";

$select_categories = mysqli_query($connection, $query);

confirmQuery($select_categories);

while ($row = mysqli_fetch_assoc($select_categories)) {
    $cat_id = escape($row['cat_id']);
    $cat_title = escape($row['cat_title']);

    echo "<option value='$cat_id'>{$cat_title}</option>";

}

?>


        </select>
    </div>

    <div class="form-group">
        <label for="users">Users</label>
        <select name="post_user" id="">
<?php echo "<option value='{$post_user}'>{$post_user}</option>"; ?>
            <?php

$query = "SELECT * FROM users";

$select_users = mysqli_query($connection, $query);

confirmQuery($select_users);

while ($row = mysqli_fetch_assoc($select_users)) {
    $user_id = escape($row['user_id']);
    $username = escape($row['username']);

    echo "<option value='$username'>{$username}</option>";

}

?>


        </select>
    </div>


    <!-- <div class="form-group">
        <label for="post_user">Post Author</label>
        <input value="<?php// echo $post_user; ?>" type="text" class="form-control" name="post_user">
    </div> -->


    <label for="post_status">Post Status</label>
    <div class="form-group">

        <select name="post_status" id="">
            <option value='<?php echo $post_status; ?>'><?php echo $post_status; ?></option>
            <?php
if ($post_status == 'published') {

    echo " <option value='draft'>Draft</option>";
} else {

    echo " <option value='published'>Published</option>";
}
?>

        </select>
    </div>

    <div class="form-group">
        <label for="post_image">Post Image</label>
        <img width="100" src="../images/<?php echo $post_image; ?>" alt="">
        <input type="file" name="post_image">
    </div>

    <div class="form-group">
        <label for="post_tags">Post Tags</label>
        <input value="<?php echo $post_tags; ?>" type="text" class="form-control" name="post_tags">
    </div>


    <div class="form-group">
        <label for="post_content">Post content</label>
        <textarea class="form-control" name="post_content" id="body" cols="30" rows="10">
<?php echo $post_content; ?>
</textarea>
    </div>

    <div class="form-group">
        <input type="submit" class="btn btn-primary" name="update_post" value="Update post">
    </div>

</form>
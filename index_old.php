<?php include "includes/db.php";?>
<?php include "includes/header.php";?>
<?php include "includes/navigation.php";?>



<?php



echo loggedInUserId();


if(userLikedThisPost(41)){

echo "user liked";

}else{

    echo "not liked";
}

?>




 <?php include "includes/sidebar.php";?>

  

    <?php include "includes/footer.php";?>
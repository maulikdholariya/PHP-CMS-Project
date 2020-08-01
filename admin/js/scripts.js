$(document).ready(function () {

    ///Editro CKEDITOR
    ClassicEditor
        .create(document.getElementById('body'))
        .catch(error => {
            console.error(error);
        });
    ///Rest of the code

    // posts check box Enable
    $('#selectAllboxes').click(function (event) {

        if (this.checked) {
            // console.log("value",event);
            $('.checkBoxes').each(function () {

                this.checked = true;

            });

        } else {

            $('.checkBoxes').each(function () {

                this.checked = false;
            });

        }


    });



});




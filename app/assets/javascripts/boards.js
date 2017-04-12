/**
 * Created by Takechi on 2017/04/11.
 */

$(function(){
    var row_id;
    var comment_id;
    $(document).on('click','.btn', function(){
        row_id = $(this).parent("p").parent("div").attr("id");
        comment_id = $("#"+row_id).attr("data");
        $.ajax({
            type: 'get',
            url: '/comments/' + comment_id + '/edit_button/',
            dataType: "html",
            success: function(data){
                $("#"+row_id).html(data);
            }
        });
    });
});






// $(document).ready(function() {
//     $('#comment_form').submit(function(){
//         $.ajax({
//             type: 'post',
//             url: '/comments',
//             data: {
//                 'pd': 'こんにちは'
//             },
//             success: function(data){
//                 alert(data);
//             }
//         });
//         return false;
//     });
// });

// $(function(){
//
// });
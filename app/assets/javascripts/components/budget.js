$(document).ready(function() {

  $('.review-btn').click(function() {
    var currentUser = $('#current-user-name').text()
    var id = $(this).data('id');
    var content = $("#review-text" + id).val();
    var id = $(this).data('id');
    console.log(content);
    // Send AJAX to perform like action
    $.ajax({
      type: "POST",
      url: "/makes/" + id + "/reviews",
      data: {review: {content: content, make: { make_id: id}}},
      success: function (value) {
        console.log(value);
        $("#show-review" + id).prepend("<li class='review-list'><h5>" + currentUser + "</h5><p>" + content + "</p></li>");
      }
    });


  });
});

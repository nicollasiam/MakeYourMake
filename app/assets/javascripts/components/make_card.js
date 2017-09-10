$(document).ready(function() {
  // Like action
  $('.like_button').on('click', function() {
    var element = $(this);
    var make_id = element.data('id');

    // Send AJAX to perform like action
    $.ajax({
      type: 'POST',
      url: '/profile/liked_makes',
      data: { 'make_id': make_id },
      success: function() {
        // Remove like_button class and add unlike_button class
        element.children('i').removeClass('fa-heart-o').addClass('fa-heart');
        element.removeClass('like_button');
        element.addClass('unlike_button');
      }
    });
  });

  // Unlike action
  $('.unlike_button').on('click', function() {
    // Remove unlike_button class and add like_button class
    $(this).removeClass('unlike_button');
    $(this).addClass('like_button');
  });
})

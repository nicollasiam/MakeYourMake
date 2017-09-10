$(document).ready(function() {
  // Like action
  $('.like_button').on('click', likeMake);

  // Unlike action
  $('.unlike_button').on('click', unlikeMake);


  function likeMake() {
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
        element.removeClass('like_button').addClass('unlike_button');

        // Remove previous callbacks for 'click', then add the right one
        element.unbind('click');
        element.on('click', unlikeMake);
      }
    });
  };


  function unlikeMake() {
    var element = $(this);
    var make_id = element.data('id');

    // Send AJAX to perform like action
    $.ajax({
      type: 'DELETE',
      url: '/profile/liked_makes/' + make_id,
      // data: { 'make_id': make_id },
      success: function() {
        // Remove like_button class and add unlike_button class
        element.children('i').removeClass('fa-heart').addClass('fa-heart-o');
        element.removeClass('unlike_button').addClass('like_button');

        // Remove previous callbacks for 'click', then add the right one
        element.unbind('click');
        element.on('click', likeMake);
      }
    });
  };

})

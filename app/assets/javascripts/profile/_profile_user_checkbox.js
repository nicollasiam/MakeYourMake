$(document).ready(function() {
  $('.checkbox').on('change', function() {
    var non_public = $('#non_public')[0].checked;
    var no_photos = $('#no_photos')[0].checked;
    var user_id = $('#input-filters').data('id');
    // console.log('non_public', non_public);
    // console.log('no_photos', no_photos);

    $.ajax({
      url: '/profile/users/' + user_id /*+ '?nao_publico=' + non_public + '&sem_foto=' + no_photos*/,
      type: 'GET',
      data: { 'nao_publico': non_public,
              'sem_foto': no_photos },
      success: function(data) {
        console.log('Success', data);
      },
      error: function(data) {
        console.log('Error', data);
      }
    });
  });
})

$(document).ready(function() {
  $('#user_address_attributes_zip_code').on('blur', function() {
    var cep = $('#user_address_attributes_zip_code').val();

    $.ajax({
      url: 'https://viacep.com.br/ws/' + cep + '/json/',
      type: 'GET',
      contentType: "application/json",
      success: function(response) {
        // Update fields in form
        // Street
        $('#user_address_attributes_street').val(response.logradouro);
        // District
        $('#user_address_attributes_district').val(response.bairro);
        // City
        $('#user_address_attributes_city').val(response.localidade);
        // State
        $('#user_address_attributes_state').val(response.uf);

        // Focus number
        $('#user_address_attributes_number').focus();
      },
      error: function() {
        alert('CEP inválido.');
      }
    });
  });
})

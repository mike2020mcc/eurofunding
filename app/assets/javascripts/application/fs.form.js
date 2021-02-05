(function() {

  'use strict';

  function clearForm(form) {
    var elements = form.querySelectorAll('.is-invalid');
    elements.forEach((element) => {
      element.classList.remove('is-invalid');
    });
  }

  function handleError(event, form) {
    var detail = event.detail;
    var data = detail[0], status = detail[1], xhr = detail[2];
    var errors = data.errors;
    for (var key in errors) {
      var element = form.querySelector("[name='form[" + key + "]']");
      if (element) {
        element.classList.add('is-invalid');
      }
    }
  }

  document.addEventListener('turbolinks:load', function(event) {
    const form = document.getElementById('new_form');
    if (!form) return;
    var button = document.getElementById('submit');
    button.addEventListener('click', function(event) {
      button.disabled = true;
      event.preventDefault();
      window.executeRecaptchaForContactAsync()
        .then(function(response) {
          const hiddenInput = document.getElementById('g-recaptcha-response-contact');
          hiddenInput.value = response;
          Rails.fire(form, 'submit');
          //form.submit();
        });
    });
    
    form.addEventListener('ajax:beforeSend', function() {
      clearForm(form);
    });

    form.addEventListener('ajax:error', function(event) {
      handleError(event, form);
    });

  });

})();
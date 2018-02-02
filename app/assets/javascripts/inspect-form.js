class InspectForm {
  constructor(form) {
    this.$form = $(form);
    this.$approveBtn = $(form).find('.js-approve-btn');
    this.$rejectBtn = $(form).find('.js-reject-btn');
    this.$rejectedField = $(form).find('[name*="\[rejected\]"]');
    this.bindEvents();
  }

  bindEvents() {
    this.$form.on('click', '.js-approve-btn', (event) => {
      event.stopPropagation();
      this.processApprove();
    });

    this.$form.on('click', '.js-reject-btn', (event) => {
      event.stopPropagation();
      this.processReject();
    });

    $(document).keypress((event) => {
      if (event.which >= 48 && event.which <= 57) {
        this.processDigit(event.which - 48);
      } else if (event.which == '97') {
        this.processApprove();
      } else if (event.which == '114') {
        this.processReject();
      }
    });
  }

  processApprove() {
    this.setRejected(false);
    this.submit();
  }

  processReject() {
    this.setRejected(true);
    this.submit();
  }

  processDigit(digit) {
    let $input = $(this.$form.find('.js-picture-class-select input')[digit]);
    $input.prop('checked', !$input.prop('checked'));
  }

  setRejected(value) {
    this.$rejectedField.val(value ? 'true' : 'false');
  }

  submit() {
    this.$form.submit();
  }
}

document.addEventListener('turbolinks:load', function() {
  $('.js-picture-inspect-form').each(function(_, $form) {
    new InspectForm($form);
  });
});

jQuery(function () {

  if ($('.short-answer-template').length > 1) {
    console.log('more than one');
    $('.short-answer-template:last').addClass('template');
  } else {
    console.log('only one question');
  }

  $('.add-btn').click(function() {
    console.log('clicked');
    $('.short-answer-template:last').clone().insertBefore('.actions');
    $('.short-answer-template:last').removeClass('template');
  });

  // $('.edit_survey').submit(function(e) {
  //   e.preventDefault;
  //
  //   return false;
  // });


});

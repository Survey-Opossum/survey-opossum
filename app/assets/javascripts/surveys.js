$(function () {

  if ($('.short-answer-template').length > 1) {
    console.log('more than one');
    $('.short-answer-template:last').addClass('template');
  } else {
    console.log('only one question');
  }

  $('.add-btn').click(function(e) {

    $('.short-answer-template:last').removeClass('template');

    var clone = $('.short-answer-template:last').clone();

    clone.addClass('template');

    clone.insertBefore('.actions');

    var questionFieldInputs = $(".short-answer-template:last > .question_fields");
    var inputArr = $('input', questionFieldInputs);
    var selectArr = $('select', questionFieldInputs);
    var fieldsArr = $('.field', questionFieldInputs);
    var labelArr = $('label', questionFieldInputs);
    var textareaArr = $('textarea', questionFieldInputs);
    var fieldInputArr = $('input', fieldsArr[2]);

    // console the
    console.log(fieldInputArr[0].value);

    // fieldInputArr[0].value = Number(fieldInputArr[0].value) + 1;

    for (i = 0; i < textareaArr.length; i++) {
      if (textareaArr[i].id) {
        var str = textareaArr[i].id;
        var patt1 = /\d+/g;
        var result = str.match(patt1);

        result = Number(result) + 1;
        textareaArr[i].id = str.replace(str.match(patt1), result);
        textareaArr[i].value = '';
      }

      if (textareaArr[i].name) {
        var str = textareaArr[i].name;
        var patt1 = /\d+/g;
        var result = str.match(patt1);

        result = Number(result) + 1;
        textareaArr[i].name = str.replace(str.match(patt1), result);
      }
    }

    for (i = 0; i < labelArr.length; i++) {
      if (labelArr[i].htmlFor) {
        var str = labelArr[i].htmlFor;
        var patt1 = /\d+/g;
        var result = str.match(patt1);

        result = Number(result) + 1;
        labelArr[i].htmlFor = str.replace(str.match(patt1), result);
      }
    }

    for (i = 0; i < inputArr.length; i++) {
      if (inputArr[i].id) {
        var str = inputArr[i].id;
        var patt1 = /\d+/g;
        var result = str.match(patt1);

        result = Number(result) + 1;
        inputArr[i].id = str.replace(str.match(patt1), result);
        inputArr[i].value = '';
      }
      if (inputArr[i].name) {
        var str = inputArr[i].name;
        var patt1 = /\d+/g;
        var result = str.match(patt1);

        result = Number(result) + 1;
        inputArr[i].name = str.replace(str.match(patt1), result);
      }
    }

    for (i = 0; i < selectArr.length; i++) {
      if (selectArr[i].id) {
        var str = selectArr[i].id;
        var patt1 = /\d+/g;
        var result = str.match(patt1);

        result = Number(result) + 1;
        selectArr[i].id = str.replace(str.match(patt1), result);
        selectArr[i].value = '';
      }
      if (selectArr[i].name) {
        var str = selectArr[i].name;
        var patt1 = /\d+/g;
        var result = str.match(patt1);

        result = Number(result) + 1;
        selectArr[i].name = str.replace(str.match(patt1), result);
      }
    }

    e.preventDefault();

    return false;
  });

  $('.arrow-up').click(function(e) {
    var arrowUp = $(this);
    var questionDiv = arrowUp.parent()[0];

    var index = $('.short-answer-template').index(questionDiv);
    //
    console.log(index);

    var parent = $('.short-answer-template')[Number(index)];
    //
    var prev = $('.short-answer-template')[Number(index) - 1];

    console.log(prev);

    var next = $('.short-answer-template')[Number(index) + 1];

    console.log(next);

    $(parent).insertBefore($(prev));

    //------------------------------

    // var questionFieldInputs = $(".short-answer-template:last > .question_fields");
    //
    // var inputArr = $('input', questionFieldInputs);
    //
    // console.log(inputArr[1]);
    // console.log(inputArr[1].value);

    //
    // if (parentPrev.className === 'short-answer-template') {
    //   console.log('can move up');
    // }

    // parent.insertBefore()
  });

});

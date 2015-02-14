jQuery(function () {

  if ($('.short-answer-template').length > 1) {
    console.log('more than one');
    $('.short-answer-template:last').addClass('template');
  } else {
    console.log('only one question');
  }

  $('.add-btn').click(function(e) {

    var clone = $('.short-answer-template:last').clone();
    // console.log(inputArr);
    clone.insertBefore('.actions');

    var questionFieldInputs = $(".short-answer-template:last > .question_fields");
    var inputArr = $('input', questionFieldInputs);
    var fieldsArr = $('.field', questionFieldInputs);
    var labelArr = $('label', questionFieldInputs);
    var textareaArr = $('textarea', questionFieldInputs);
    console.log(textareaArr);

    for (i = 0; i < textareaArr.length; i++) {
      if (textareaArr[i].id) {
        var str = textareaArr[i].id;
        var patt1 = /\d+/g;
        var result = str.match(patt1);
        result = Number(result) + 1;
        textareaArr[i].id = str.replace(str.match(patt1), result);
        console.log(textareaArr[i].id);

        textareaArr[i].value = '';
      }

      if (textareaArr[i].name) {
        var str = textareaArr[i].name;
        var patt1 = /\d+/g;
        var result = str.match(patt1);
        result = Number(result) + 1;
        textareaArr[i].name = str.replace(str.match(patt1), result);
        console.log(textareaArr[i].name);
      }
    }

    console.log(labelArr);

    for (i = 0; i < labelArr.length; i++) {
      if (labelArr[i].htmlFor) {
        var str = labelArr[i].htmlFor;
        var patt1 = /\d+/g;
        var result = str.match(patt1);
        result = Number(result) + 1;
        labelArr[i].htmlFor = str.replace(str.match(patt1), result);
        console.log(labelArr[i].htmlFor);
      }
    }

    console.log(inputArr);
    for (i = 0; i < inputArr.length; i++) {
      if (inputArr[i].id) {
        var str = inputArr[i].id;
        var patt1 = /\d+/g;
        var result = str.match(patt1);
        result = Number(result) + 1;
        inputArr[i].id = str.replace(str.match(patt1), result);
        console.log(inputArr[i].id);

        inputArr[i].value = '';
      }
      if (inputArr[i].name) {
        var str = inputArr[i].name;
        var patt1 = /\d+/g;
        var result = str.match(patt1);
        result = Number(result) + 1;
        inputArr[i].name = str.replace(str.match(patt1), result);
        console.log(inputArr[i].name);
      }
    }

    $('.short-answer-template:last').removeClass('template');

    e.preventDefault();

    return false;
  });

  // $('.edit_survey').submit(function(e) {
  //   e.preventDefault;
  //
  //   return false;
  // });


});

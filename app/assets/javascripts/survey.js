$(document).ready(function(){
  $("#add-question").on('click', function(event){
    event.preventDefault()
     $data = $(event.target).attr('survey_id')
    $.ajax({
      url: "/questions/form",
      method: "POST",
      data: {data: parseInt($data)}
      })
    .done(function(questionForm){
      $("body").prepend(questionForm);
    })
    .fail(function(){
      console.log("raise some fucking hell");
    });
  });
});

$(document).ready(function() {
  $(".new_survey").on("submit", function(event) {
    event.preventDefault();
    var $title = $("#survey_title").val();
    $.ajax({
      url: "/surveys",
      method: "POST",
      data: {title: $title}
    })
    .done(function(newQuestionForm){
      $("#new_survey").hide();
      $(".questions").prepend(newQuestionForm);
      // $(document).ready(function() {
        $("#new_question").on("submit", function(event) {
          event.preventDefault();
          var $question = $("#question_text").val();
          $.ajax({
            url: $("#new_question").attr("action"),
            method: "POST",
            data: {text: $question}
          })
          .done(function (newChoiceForm){
            $("#question_text").val("");
            $(".questions").append(newChoiceForm);
            // $(document).ready(function () {
              $("#new_choice").on("submit", function(event) {
                event.preventDefault();
                var $choice_path = $("#new_choice").attr("action");
                var $choice = $("#choice_text").val();
                var $question_id = parseInt($("#choice_question_id").attr("value"))
                $.ajax({
                  url: $choice_path,
                  method: "POST",
                  data: {text: $choice,question_id: $question_id}
                })
                .done(function (choiceText) {
                  var $list = $("#new_choice").parent()
                  $list.prepend(choiceText);
                  $("#choice_text").val("");
                })
                .fail(function () {
                  console.log("sad little baby");
                })
              });
            // });
          })
          .fail(function () {
            console.log("sad tiger");
          })
        });
      // });
    })
    .fail(function() {
      console.log("sad panda");
    });
  });
});





$(document).ready(ready);
$(document).on("page:load", ready);

function ready() {
  $("#lecture_date_picker").datepicker();

  $("#lecture_time_picker").timepicker();

  if ($('#lecture_description')[0]) {
    $('#lecture_description').on('paste input', function () {
      resizeHeight(this);
    });
    resizeHeight($('#lecture_description')[0]);
  };
}

$(document).off("click", ".event-date-icon").on("click", ".event-date-icon", function(e) {
  $("#lecture_date_picker").focus();
})

$(document).off("click", ".event-time-icon").on("click", ".event-time-icon", function(e) {
  $("#lecture_time_picker").focus();
})


function resizeHeight(e) {
  if ($(e).outerHeight() > e.scrollHeight){
    $(e).height(1)
  }
  while ($(e).outerHeight() < e.scrollHeight + parseFloat($(e).css("borderTopWidth")) + parseFloat($(e).css("borderBottomWidth"))){
    $(e).height($(e).height() + 1)
  }
}
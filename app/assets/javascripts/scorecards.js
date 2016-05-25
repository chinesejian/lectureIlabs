$(document).ready(ready);
$(document).on("page:load", ready);

function ready() {
  $(".rating-slider").trigger("slide");
  $(".rating-slider").slider({
    tooltip: "show",
    formatter: function(value) {
      return value;
    }
  });
}

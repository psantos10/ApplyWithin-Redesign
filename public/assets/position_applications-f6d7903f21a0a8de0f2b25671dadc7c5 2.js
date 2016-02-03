(function() {
  $(document).ready(function() {
    return $(".two_row_expander").on("click", function() {
      var row;
      row = $(this).data("target");
      return $("#" + row).toggleClass("hidden");
    });
  });

}).call(this);

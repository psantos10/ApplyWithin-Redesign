(function() {
  $(document).ready(function() {
    return $(".record_impression").each(function() {
      return $.post("/impressions.json", {
        impression: {
          trackable_id: $(this).data("trackable-id"),
          trackable_type: $(this).data("trackable-type")
        }
      });
    });
  });

}).call(this);

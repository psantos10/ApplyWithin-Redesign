$(document).ready ->
  $(".record_impression").each ->
    $.post "/impressions.json",
      impression:
        trackable_id: $(this).data("trackable-id"),
        trackable_type: $(this).data("trackable-type")

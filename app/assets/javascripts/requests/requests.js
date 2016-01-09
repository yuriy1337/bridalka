$(function() {
  $('#wedding_date_picker').datepicker({
    dateFormat: 'mm/dd/yy',
    changeMonth: true,
    changeYear: true,
    altField: "#request_wedding_date",
    altFormat: "yy/mm/dd"
  });
});

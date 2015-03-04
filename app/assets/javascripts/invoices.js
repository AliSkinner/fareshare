 function createInvoice() {
  $name = $('.invoice-name').val()
  $description = $('.invoice-description').val()
  $group = $('.invoice-group').val()
  $amount = $('.invoice-amount').val()
  $due_date_day = $('#invoice_due_date_3i').val()
  $due_date_month = $('#invoice_due_date_2i').val()
  $due_date_year = $('#invoice_due_date_1i').val()
  $date = new Date($due_date_year, ($due_date_month - 1), ($due_date_day))
    $.ajax({
      url: "/invoices",
      method: "POST",
      datatype: 'json',
      data: {invoice:{name:$name, description:$description, group_id:$group, amount:$amount,due_date:$date, paid:false}}
    }).done(function(){
      window.location = window.location.origin + "/allocations/new"
    })
}
$(function() {
  $('#invoice-master').on('click', function() {
    createInvoice();
  })
})
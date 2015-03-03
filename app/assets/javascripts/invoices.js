function createInvoice() {
  console.log('hello')
  $name = $('.invoice-name').val()
  $description = $('.invoice-description').val()
  $group = $('.invoice-group').val()
  $amount = $('.invoice-amount').val()
  $due_date_day = $('#invoice_due_date_3i').val()
  $due_date_month = $('#invoice_due_date_2i').val()
  $due_date_year = $('#invoice_due_date_1i').val()
  $date = new Date($due_date_year, ($due_date_month + 1), $due_date_day)
  console.log('vaz')
    $.ajax({
      url: "/invoices",
      method: "POST",
      datatype: 'json',
      data: {invoice:{name:$name, description:$description, group_id:$group, amount:$amount,due_date:$date}}
    }).done(function(data){
      console.log('hello')
    })
}

$(function() {
  $('#invoice-master').on('click', function() {
    createInvoice();
  })
})
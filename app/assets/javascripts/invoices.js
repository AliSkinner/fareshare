function createinvoice() {
  $name = $('.invoice-name').val()
  $description = $('.invoice-description').val()
  $group = $('.invoice-group').val()
  $amount = $('.invoice-amount').val()
  $due_date_day = $('#invoice_due_date_3i').val()
  $due_date_month = $('#invoice_due_date_2i').val()
  $due_date_year = $('#invoice_due_date_1i').val()
    $ajax({
      url: "/invoices",
      method: "POST",
      datatype: 'json',
      data: {invoice:{name:$name, description:$description, group_id:$group, amount:$amount,due_date: $due_date_day + '/' + $due_date_month + '/' + due_date_year}}
    }).done(function(data){
      console.log('hello')
    })
}
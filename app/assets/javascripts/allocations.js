function createAllocation(form){
  console.log("in the create allocation");
  $share = form.find('input[type="text"]').val()
  $user = form.find('input[class="user-name"]').val()
  $invoice = $('.invoice-name').val()
  console.log($share);
  console.log($user);
  console.log($invoice);
    $.ajax({
      url: "/allocations",
      method: 'POST',
      dataType: 'json',
      data: {allocation:{user_id:$user, invoice_id:$invoice, share:$share}}
    }).done(function(data){
      // console.log(data)    
    })
}
$(function (){
  $('#allocation-master').on('click', function(){
    $('form').each(function() {
      $form = $(this)
        createAllocation($form); 
    })
  })
})

function validateTotals() {
  var sum = 0;
  var total = 0;
  var invoiceAmount = $('.invoice-amount').text();
  var $submitButton = $('#allocation-master');

  $('.allocation-share').each(function(number){
    total = sum += parseFloat($(this).val())
  })
  if (total === parseInt(invoiceAmount)) {
    $submitButton.removeClass('hidden');
  } else {
    $submitButton.addClass('hidden');
  }
}

$(function(){
  $('.allocation-share').on('keyup', function(){
    validateTotals();
  })
})

// function userPayInvoiceShare(id, paid) {
//   console.log(id);
//   $.ajax({
//     url: "/invoices/" + id,
//     method: 'PUT',
//     dataType: 'json',
//     data: { 
//       invoice: {
//         paid: paid
//       }
//     }
//   })
//   .done(function(response) {
//     console.log(response);
//   });
// }

// $('.pay-invoice').on('click', function(e){
//     e.preventDefault();
//     var id = $(this).data("id");
//     var paid = true; 
//     $(this).replaceWith("<td>Paid</td>")
//     payInvoice(id, paid);
//   })

$(function(){
  $('.pay-user-invoice').on('click', function(e){
    var id_row = $(this).parent().parent().children()[1]
    var id = $(id_row).text()
    console.log(id)
  })
})



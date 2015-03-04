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

function userPayInvoice(id, paid, share) {
  $.ajax({
    url: "/allocations/" + id,
    method: 'PUT',
    dataType: 'json',
    data: {allocation:{paid: paid, share: share }}
  }).done(function(response) {
    console.log(response);
  })
}

// function userPayInvoice(id, amount) {
//   $.ajax({
//     url: "/groups/" + id,
//     method: 'PUT',
//     dataType: 'json',
//     data: {group:{amount: paid}}
//   }).done(function(response) {
//     console.log(response);
//   })
// }



$(function(){
  $('.pay-user-invoice').on('click', function(e){
    var allocation_id_row = $(this).parent().parent().children()[1]
    var allocation_id = $(allocation_id_row).text()
    var amount_owed_row = $(this).parent().parent().children()[5]
    var amount_owed = parseInt($(amount_owed_row).text())
    // var group_id_row = $(this).parent().parent().children()[3]
    // var group_id = parseInt($(group_id_row).text())
    var paid = true;
    $(this).replaceWith("<td>Paid</td>")
    userPayInvoice(allocation_id, paid, amount_owed);
  })
})



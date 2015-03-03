function createAllocation(form){

  $percentage = form.find('input[type="text"]').val()
  $user = form.find('input[class="user-name"]').val()
  $invoice = $('.invoice-name').val()
    $.ajax({
      url: "/allocations",
      method: 'POST',
      dataType: 'json',
      data: {allocation:{user_id:$user, invoice_id:$invoice, percentage:$percentage}}
    }).done(function(data){
      console.log(data)    
    })
}
$(function (){
  $('#master').on('click', function(){
    $('form').each(function() {
      $form = $(this)
        createAllocation($form); 
    })
  })
})
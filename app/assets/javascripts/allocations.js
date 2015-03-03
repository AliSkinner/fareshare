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

$(function(){
  $('input[type="text"]').on('change', function(){
    console.log($(this).val())
    });
});
  

  // $('.price').blur(function () {
  //     var sum = 0;
  //     $('.price').each(function() {
  //         sum += Number($(this).val());
  //     });

  //     // here, you have your sum
  // });​​​​​​​​​

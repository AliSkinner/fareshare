
function createGroup(){
  var $name = $('#group_name').val();
  var $description = $('#group_description').val();
  var $members = $(":checked");
  var user_ids = [];
  var $created_by = $('#group_created_by').val()
  $.each($members, function(index,checkbox) {
    user_ids.push(checkbox.value);
  });
  $.ajax({
    url: "/groups",
    method: 'POST',
    dataType: 'json',
    data: { 
      group: {
        name: $name,
        description: $description,
        created_by: parseInt($created_by)
      },
      user:{
        user_ids: user_ids
      }
    }
  }).done(function(response){
    $('<h2> Your group ' + response.name + ' is created. <button class="delete" data-id='+ response.id +'>Delete</button></h2>').appendTo('h2.new-group')
    $('<p>' + response.description + '</p>' ).appendTo('h2.new-group')
    $('<a href="/groups/'  + response.id + '">check out the group</a>').appendTo('h2.new-group')
  
    $.each(response.users, function(index, user){
 
    $('<p>' + user.name + '</p>').appendTo('h2.new-group')
   });
  })
}

function payInvoice(id, paid, amount) {
  $.ajax({
    url: "/invoices/" + id,
    method: 'PUT',
    dataType: 'json',
    data: { 
      invoice: {
        paid: paid
      }
    }
  })
  .done(function(response) {
    console.log(response)
    // $('#total-invoices-amount').html(response)
    $('#updated-bank-balance').html(response)
  // response.appendTo('#updated-bank-balance')
  }) 
}

$(document).ready(function(){
  // console.log("hello")
  $('#new_group').on('submit', function(e){
    e.preventDefault();
    createGroup();
  })
  $('.pay-invoice').on('click', function(e){
    e.preventDefault();
    
    // $balance = parseInt($('.group_balance').text())
    // $owed = parseInt($('.total-invoices-amount').text()) 
    // $owed = parseInt($('.total_invoices_amount').text())
    // if($balance >= $owed) {
    var id = $(this).data("id");
    var paid = true; 
    var amount = $(this).data("amount");
    $(this).replaceWith("<td>Paid</td>")
    payInvoice(id, paid, amount);
    // }
    // else {
    // alert('Your Group does not have enough funds to pay. Please contact your group members to pay their bills')
    // }
  })
})



// create a function that creates a gruop
// get the value of the text box -- group name
// make an ajax request to url /groups POST 
// .done append somethign to say a group is created

// could have a link to all the users that adds them to the group
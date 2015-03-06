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
    
    $('<h2> Your group ' + response.name + ' is created. <button class="delete" data-id='+ response.id +'>Delete</button></h2>').appendTo('.created-group ')
    $('<p>' + response.description + '</p>' ).appendTo('.created-group ')
    $('<a href="/groups/'  + response.id + '">check out the group</a>').appendTo('.created-group ')
  
    $.each(response.users, function(index, user){
 
    $('<p>' + user.name + '</p>').appendTo('.created-group ')
   });
  })
}

function payInvoice(id, paid, amount) {
  // console.log(id);
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
    $('#updated-bank-balance').html(response)
 
  // response.appendTo('#updated-bank-balance')
  })
}

$(function(){
  // console.log("hello")
  $('#new_group').on('submit', function(){
    event.preventDefault();
    createGroup();
  });

  $('.pay-invoice').on('click', function(e){
    e.preventDefault();
    var id = $(this).data("id");
    var paid = true; 
    var amount = $(this).data("amount");
    $(this).replaceWith("<td>Paid</td>")
    payInvoice(id, paid, amount);
  })
})



// create a function that creates a gruop
// get the value of the text box -- group name
// make an ajax request to url /groups POST 
// .done append somethign to say a group is created

// could have a link to all the users that adds them to the group
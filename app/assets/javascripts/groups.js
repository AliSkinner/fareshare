function createGroup(){
 
  var $name = $('#group_name').val();
  var $description = $('#group_description').val();
  var $members = $(":checked");


  var user_ids = [];

  $.each($members, function(index,checkbox) {
    user_ids.push(checkbox.value);
  });

  console.log(user_ids);

  $.ajax({
    url: "/groups",
    method: 'POST',
    dataType: 'json',
    data: { 
      group: {
        name: $name,
        description: $description,
       
      },
      user:{
        user_ids: user_ids
      }
    }
  }).done(function(response){
    // $('#results')('');
    $('<h2> Your group ' + response.name + ' is created. <button class="delete" data-id='+ response.id +'>Delete</button></h2>').appendTo('h2.new-group')
    $('<p>' + response.description + '</p>' ).appendTo('h2.new-group')
    $('<a href="/groups/'  + response.id + '">check out the group</a>').appendTo('h2.new-group')
  console.log(response)
    $.each(response.users, function(index, user){
  console.log(user)
    $('<p>' + user.name + '</p>').appendTo('h2.new-group')
   });
  })
}


$(function(){
  console.log("hello")
  $('#new_group.new_group').on('submit', function(){
    event.preventDefault();
    createGroup();
  })
})

// create a function that creates a gruop
// get the value of the text box -- group name
// make an ajax request to url /groups POST 
// .done append somethign to say a group is created

// could have a link to all the users that adds them to the group
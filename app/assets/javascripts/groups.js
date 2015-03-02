function createGroup(){
  $name = $('#group_name').val()
  $description = $('#group_description').val()
  $members = $(":checked");
 
  var member_ids = $.each($members, function(index,value){
    $members[index].value})
  var group = {
    name: $name,
    description: $description,
    members: $members
  }; 
  // console.log($group)
  $.ajax({
    url: "/groups",
    method: 'POST',
    dataType: 'json',
    data: {group: group}
  }).done(function(response){
     $('<p>' + response.name + '<button class="delete" data-id='+ response.id +'>Delete</button></p>').prependTo('p.group-list')
  })

  // $.ajax({
  //   url: "/tweets",
  //   method: 'POST',
  //   dataType: 'json',
  //   data: {tweet:{message:$message}}
  // }).done(function(data){
  //   $('<li>' + data.message + '<button class="delete" data-id='+ data.id +'>Delete</button></li>').prependTo('ul.tweets')
  // })
}

$(function(){
  console.log('yo');

  $('#new_group.new_group').on('submit', function(){
    event.preventDefault()
    createGroup()
  })
})
// create a function that creates a gruop
// get the value of the text box -- group name
// make an ajax request to url /groups POST 
// .done append somethign to say a group is created

// could have a link to all the users that adds them to the group
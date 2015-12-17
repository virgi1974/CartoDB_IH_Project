$(document).on('ready',function(){

  var mapId = parseInt(document.getElementsByTagName('p')[0].id);

  (function loadSelectedMap(){

      var request = $.get('/maps/' + mapId);

      request.fail(function () {
        alert('Couldn’t get you maps from the DB');
      });

      request.done(function (response) {
        selectedMap(response);
      })

      function selectedMap(map){

          var my_stored_map = new Map();

          setDataFromDb(map,my_stored_map);

          my_stored_map.getCartodb('shared-map');

      };//selectedMap
  })(); 
//--------------------------------- user-info --------------------------------------------

  (function loadSelectedMapInfo(){

      var request = $.get('/maps/' + mapId + '/info');

      request.fail(function () {
        alert('Couldn’t get you maps from the DB');
      });

      request.done(function (info_user) {
        addUserInfo(info_user);
      })

      function addUserInfo(user){

          var htmlParts = [
            '<section class="col-md-12 map-info">',
              '<div>',
                '<h3 class="description-header"><strong>' + user.description + '</strong></h3>',
                '<span class="info"><strong>username</strong>&nbsp;&nbsp;&nbsp;' + user.name + '</span>&nbsp;&nbsp;&nbsp;',
                '&nbsp;&nbsp;&nbsp;<span><strong>email</strong>&nbsp;&nbsp;&nbsp;&nbsp;' + user.email + '</span>',
            '</section>'   
        ];
        $('#user-info').append(htmlParts.join('\n'));

      };//addUserInfo
  })(); 

//--------------------------------- show comments --------------------------------------------

  (function loadComments(){

     var request = $.get('/maps/' + mapId +'/comments/');

      request.fail(function () {
        alert('Couldn’t get you comments from the DB');
      });

      request.done(function (comments) {
        mapComments(comments);
      }); 

      function mapComments(comments){
        for (var i = 0; i < comments.length; i++) {
          var htmlParts= [
              '<p class="deepshadow pull-left">'+ comments[i].content + '</p>',
              '<p class="deepshadow pull rigth">'+ comments[i].name + '</p>'
          ];

          $('#comments-gallery').append(htmlParts.join('\n'));   
        }
      };//mapComments
  })(); 

//------------------------------- new comment for the map --------------------

  $(document).on('click','#form-comment',function(event){

        event.preventDefault();
        var comment = $('#map_comment').val();

        var $button = $(event.currentTarget);
        var user_id = $button.attr('data-user');

      // console.log(comment);
      // console.log(user_id);
      // console.log(mapId);

        var data = {
          comment : comment,
          user_id : user_id,
          map_id : mapId
        }

        var request = $.post('/users/' + user_id + '/maps/' + mapId + '/comments',data);

        request.fail(function () {
          alert('Couldn’t add your comment to the DB');
        });

        request.success(function (response) {
          console.log(response);
          newComment(response);
        }); 

    function newComment(comment){

       var htmlParts= [
              '<p class="deepshadow pull-left">'+ comment.content + '</p>',
              '<p class="deepshadow pull rigth">'+ comment.name + '</p>'
          ];

          $('#comments-gallery').append(htmlParts.join('\n')); 
  
    };//newComment
        
  }); // form-comment click

});//document-ready




 






$(document).ready(function() {

  //---------------------- show the comments -----------------

    var request = $.get('/comments/');

    request.fail(function () {
      alert('Couldn’t get you maps from the DB')
    });

    request.done(function (response) {
      mapCollection(response);
    });

    function mapCollection(maps){

        for (var i = 0; i < maps.length; i++) {
         
          var htmlParts = [
            '<article class="col-md-2 each-map">',
              '<div id="container-thumbnails_' + i + '"' + 'class="small-maps"></div>',
              '<div>',
                '<h3>description</h3>',
                '<p>' + maps[i].description + '</p>',
                '<h3>comments</h3>',
                '<p>' + maps[i].content + '</p>',
                '<a id ="' + maps[i].id + '" href="#" class="btn btn-success btn-block map-detail">select</a>',
              '</div>',
            '</article>'   
          ];
          $('.maps-collection').append(htmlParts.join('\n'));

          var my_stored_map = new Map();
          my_stored_map.table_name = maps[i].table;
          my_stored_map.city = maps[i].city;
          my_stored_map.state = maps[i].state;
          my_stored_map.date1 = maps[i].date1;
          my_stored_map.date2 = maps[i].date2;

          my_stored_map.getCartoDbUser();
          my_stored_map.getCity();
          my_stored_map.getState(); 
          my_stored_map.getDatesFromDb(); 
            
          my_stored_map.getCartodb('container-thumbnails_' + i);
        }

        var my_stored_map = new Map();
        //*********************

    };//mapCollection


});
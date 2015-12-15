window.onload = function() {

  //---------------------- show the shared maps -----------------

  (function showSharedMaps(){
    var request = $.get('/shared/info');

    request.fail(function () {
      // alert('inside fail-comments.js');
      alert('Couldn’t get you maps from the DB')
    });

    request.done(function (response) {
      // alert('inside done-comments.js');
      mapCollection(response);
    });

    function mapCollection(maps){

        for (var i = 0; i < maps.length; i++) {
         
          var htmlParts = [
            '<article class="col-md-12 each-map">',
              '<div id="container-thumbnails_' + i + '"' + 'class="small-maps"></div>',
                '<p class="description">' + maps[i].description + '</p>',
                '<a href="shared/' + maps[i].id + '/comments" class="btn btn-success btn-block btn-block preview">VIEW</a>',
            '</article>'   
          ];
          $('.maps-collection').append(htmlParts.join('\n'));

          var my_stored_map = new Map();

          setDataFromDb(maps[i],my_stored_map);

          my_stored_map.getCartodb('container-thumbnails_' + i);
        }

    };//mapCollection

  })();

};//window-omload

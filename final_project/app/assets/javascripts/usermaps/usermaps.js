window.onload = function() {

  //------------------ preview before creating new map -------------
  $(document).on('click','#show-map',function(event){
    $('.map-container').empty();
    $('.map-container').append('<div style="width:100%;height:500px;border:solid;" id="map-prueba"></div>');
    
    var my_new_map = new Map();
    my_new_map.getValues();
    my_new_map.getCity();
    my_new_map.getState(); 
    my_new_map.getDates(); 
    my_new_map.getCartoDbUser(); 
    my_new_map.getCartodb('map-prueba');
  });

//---------------------- show the selected map below -----------------

// $(document).on('click','.map-detail',function(event){

//     $('#selected-map').empty();

//     var currentDOMElement = $(event.currentTarget);
//     var mapId = $(event.currentTarget).attr("id");
//     // var id = $(event.currentTarget).attr("id")

//     var request = $.get('/maps/' + mapId);

//     request.fail(function () {
//       alert('Couldn’t get you maps from the DB');
//     });

//     request.done(function (response) {
//       selectedMap(response);
//     })

//     function selectedMap(map){

//         var my_stored_map = new Map();

//         setDataFromDb(map,my_stored_map);

//         my_stored_map.getCartodb('selected-map');

//     };//selectedMap

// });

}; // doc-ready
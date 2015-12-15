$(document).on('ready',function(){
  main('map',$("#cartocss").html());
  main('map2',$("#cartocss2").html());
  main('map3',$("#cartocss3").html());

  function main(map_id,cartocss_id) {

    // Instantiate new map object, place it in 'map' element
    var map = new L.Map(map_id, {
      center: [39,-98], 
      zoom: 4,
      scrollWheelZoom: false
    });

    // setup layer
    var layerSource = {
      type: 'torque',
      options: {
        user_name: 'vitrgilio1974', // replace with your user name
        table_name: 'ufo',
        cartocss: cartocss_id
      }
    }

    var layer = L.tileLayer('https://cartocdn_{s}.global.ssl.fastly.net/base-flatblue/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, &copy; <a href="http://cartodb.com/attributions">CartoDB</a>'
    });

    map.addLayer(layer);

    // put torque layer on top of basemap
    cartodb.createLayer(map, layerSource)
      .addTo(map)
      .done(function(layer) {
        // do stuff
      })
      .error(function(err) {
        console.log("Error: " + err);
      });
  }


});





//-----------------------------------------------

$(document).ready(function() {

 $(document).on('click','#show-map',function(event){
  $('.map-container').empty();
  $('.map-container').append('<div style="width:500px;height:500px;border:solid;" id="map-prueba"></div>');
  
    var table_name = $('#map_table').val();
    var city = $('#map_city').val().trim();
    var state = $('#map_state').val().trim();
    var date1 = $('#map_date1').val();
    var date2 = $('#map_date2').val();

    // var id = $(event.currentTarget.children).attr("id");
    prepareQuery(table_name,city,state,date1,date2);
  });

 function prepareQuery(table_name,city,state,date1,date2){
    var query = " WHERE"
    var adding;
    
  // if (city) {
  //   query+= ' city = ' + "'"+ city +"'"; 
  // };

  // if (state && city) {
  //   query+= ' state = ' + "'" + state +"'"; 
  // }else if(state){
  //   query+= ' and state = ' + "'" + state +"'"; 
  // };


  if (date1 && date2) {
    query+= ' date between ' +"'"+ date1 +"'"+ " and " +"'"+ date2+"'";
  }else if (date1) {
    query+= ' date = ' +"'"+ date1 +"'"; 
  }else if (date2) {
    query+= ' date = ' +"'"+ date2 +"'";  
  };
    

  
  get_cartodb(table_name,query)
  }

  function get_cartodb(table_name,query){

    // "pruebaufo"
    var cartodb_user = "vitrgilio1974";
      // Put layer data into a JS object
      var layerSource = {
        user_name: cartodb_user, // "vitrgilio1974"
        type: 'cartodb',
        sublayers: [{ 
          sql: "SELECT * FROM " + table_name + query + "", // All recorded earthquakes past 30 days
          cartocss: $("#simple").text() // Simple visualization
        }]
      }

      // For storing the sublayer
      var sublayer;

      // Instantiate new map object, place it in 'map' element
      var map_object = new L.Map('map-prueba', {
        center: [37.7741154,-122.4437914], // San Francisco
        zoom: 4
      });

      L.tileLayer('http://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
      }).addTo(map_object);

      // Add data layer to your map
      cartodb.createLayer(map_object,layerSource)
        .addTo(map_object)
        .done(function(layer) {
          sublayer = layer.getSubLayer(0);
        })
        .error(function(err) {
          console.log("error: " + err);
        });
  };

  
  // evento carga preview de datos
  // $(document).on('click','#show-map',function(event){
    // alert("yeahhh");
    // event.preventDefault();
    // var currentDOMElement = $(event.currentTarget);
    // var id = $(event.currentTarget.children).attr("id");
    // prueba_cartodb();
  // });


  //VIZZJSON
    var vizjson = 'https://vitrgilio1974.cartodb.com/api/v2/viz/1924302c-9b66-11e5-9fd1-0ecd1babdde5/viz.json';
    var options = {
      center: [40.4000, -3.6833], // Madrid
      zoom: 2,
      scrollwheel: true
    };
    cartodb.createVis('map', vizjson, options)
      .done(function(vis, layers) { // layers is an array of layers
        // do stuff
        // alert("Layers has " + layers.length + " layers.");
      })
      .error(function(err) {
        // report error
        console.log("An error occurred: " + err);
      });

//CREATELAYER - PASSING A VIZJSON

  var options2 = {
    center: [41.8369, -87.6847], // Chicago
    zoom: 7
  }

  // Instantiate map on specified DOM element
  var map_object = new L.Map('map2', options2);

  // Add a basemap to the map object just created
  L.tileLayer('http://tile.stamen.com/toner/{z}/{x}/{y}.png', {
    attribution: 'Stamen'
  }).addTo(map_object);

  var vizjson2 = 'https://vitrgilio1974.cartodb.com/api/v2/viz/1924302c-9b66-11e5-9fd1-0ecd1babdde5/viz.json';
  
  cartodb.createLayer(map_object, vizjson2).addTo(map_object)


//CREATELAYER - PASSING THE LAYERS( SQL + CSS)


  var options3 = {
    center: [41.8369, -87.6847], // Chicago
    zoom: 3
  }

  //now we pass the layers to our map-object through a SQL query which brings us back
  // the datasets-layers we need
  //we use the name of the "DATA-SETS"
  var layerSource = {
    user_name: 'vitrgilio1974',
    type: 'cartodb',
    sublayers: [{
      sql: "SELECT * FROM ufo_2 WHERE city = 'Boise'",
      cartocss: '#ufo_2 {marker-fill: #A53ED5;marker-type: ellipse;}'
    }, 
    {
      sql: "SELECT * FROM pruebaufo",
      cartocss: '#pruebaufo {marker-fill: #F84F40;marker-type: ellipse;}'
    }]
  };

   // Instantiate map on specified DOM element
  var map_object3 = new L.Map('map3', options3);

  // Add a basemap to the map object just created
  L.tileLayer('http://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png',{
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, &copy; <a href="http://cartodb.com/attributions">CartoDB</a>'
  }).addTo(map_object3);


  var sublayers = [];

  cartodb.createLayer(map_object3, layerSource)
    .addTo(map_object3)
    .done(function(layer) {
      for (var i = 0; i < layer.getSubLayerCount(); i++) {
        sublayers[i] = layer.getSubLayer(i);
        // alert("Congrats, you added sublayer #" + i + "!");
      } 
    })
    .error(function(err) {
      // report error
      console.log("An error occurred: " + err);
    });

// ------------------  2 buttons controlling the show-hide effect of layers
$(".sublayer").on('click', show_hide_layers);

  function show_hide_layers(event){
    var currentDOMElement = $(event.currentTarget);
    
    var $target_layer = currentDOMElement.data('layer');

    if (currentDOMElement.hasClass('active')) {
      currentDOMElement.removeClass('active');
      console.log('hiding sublayer ' + $target_layer);
      sublayers[$target_layer].hide();
    } else {
      currentDOMElement.addClass('active');
      console.log('showing sublayer ' + $target_layer);
      sublayers[$target_layer].show();
    }
  }
 
  // ------------------  changing CSS for an existing layer
  $("#change-css").on('click', new_css);    
  function new_css(){
    alert('inside');
    var simpleStyle1 = $("#simple").text();
    var simpleStyle2 = $("#simple2").text();
    sublayers[1].setCartoCSS(simpleStyle1); 
    sublayers[0].setCartoCSS(simpleStyle2); 
  }

// CREATELAYER - PASSING THE LAYERS( SQL + CSS) CUSTOMIZED
(function createMap(){

  var tableName = "pruebaufo";

    // Put layer data into a JS object
    var layerSource = {
      user_name: 'vitrgilio1974', 
      type: 'cartodb',
      sublayers: [{ 
        sql: "SELECT * FROM " + tableName, // All recorded earthquakes past 30 days
        cartocss: $("#simple").text() // Simple visualization
      }]
    }

    // For storing the sublayer
    var sublayer;

    // Instantiate new map object, place it in 'map' element
    var map_object = new L.Map('map4', {
      center: [37.7741154,-122.4437914], // San Francisco
      zoom: 4
    });

    L.tileLayer('http://{s}.basemaps.cartocdn.com/light_nolabels/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map_object);

    // Add data layer to your map
    cartodb.createLayer(map_object,layerSource)
      .addTo(map_object)
      .done(function(layer) {
        sublayer = layer.getSubLayer(0);
      })
      .error(function(err) {
        console.log("error: " + err);
      });
})();

// ---------------------    CHOOSING SQL TROUGH CLICKS

(function createMap_sql(){

  var tableName = "pruebaufo";

    // Put layer data into a JS object
    var layerSource = {
      user_name: 'vitrgilio1974', 
      type: 'cartodb',
      sublayers: [{ 
        sql: "SELECT * FROM " + tableName, // All recorded earthquakes past 30 days
        cartocss: $("#simple").text() // Simple visualization
      }]
    }

    // For storing the sublayer
    var sublayer;

    // Instantiate new map object, place it in 'map' element
    var map_object = new L.Map('map5', {
      center: [37.7741154,-122.4437914], // San Francisco
      zoom: 4
    });

    L.tileLayer('http://{s}.basemaps.cartocdn.com/light_nolabels/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map_object);

    function createSelector(layer) {
      var condition = ""; // SQL or CartoCSS string
      var $options = $(".layer_selector").find("li");
      $options.click(function(e) {
        var $li = $(e.target);
        var selected = $li.attr('data');
        var type = $li.data('type'); // 'sql' or 'cartocss'

        if (type === "cartocss") { // if a CartoCSS selector is chosen, set the style
          $options.removeClass('cartocss_selected');
          if (selected !== "simple") {
            $li.addClass('cartocss_selected');
          }

          condition = $('#'+selected).text();
          layer.setCartoCSS(condition);
        } else { // if a SQL selector is chosen, re-query the data
          $options.removeClass('sql_selected');
          if (selected !== "") {
            $li.addClass('sql_selected');
          }
          var a = "SELECT * FROM " + tableName + selected;
          layer.setSQL("SELECT * FROM " + tableName + selected);
        }
      });
    }

    // Add data layer to your map
    cartodb.createLayer(map_object,layerSource)
      .addTo(map_object)
      .done(function(layer) {
        sublayer = layer.getSubLayer(0);
        createSelector(sublayer);
      })
      .error(function(err) {
        console.log("error: " + err);
      });



})();


}); //end of window-load




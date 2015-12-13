var Map = function(){
  this.cartodb_user = "";
  this.table_name = "";
  this.city = "";
  this.state = "";
  this.state = "";
  this.date1 = "";
  this.date2 = "";
  this.query = " WHERE";
}

Map.prototype.getCartoDbUser = function(){
  var user = $('#map_cartodb_user').val();
  if (user !== undefined) {
    this.cartodb_user = $('#map_cartodb_user').val().trim();
  };
}
Map.prototype.getValues = function(){
  this.table_name = $('#map_table').val();
  this.city = $('#map_city').val().trim();
  this.state = $('#map_state').val().trim();
  this.date1 = $('#map_date1').val();
  this.date2 = $('#map_date2').val();
}
Map.prototype.getCity = function(){
  if (this.city.length !== 0) {
    this.query+= ' city = ' + "'"+ this.city +"'"; 
  };
}

Map.prototype.getState = function(){
  if (this.city.length !== 0 && this.state.length !== 0) {
    this.query+= ' and state = ' + "'" + this.state +"'"; 
  }else if(this.city.length === 0 && this.state.length !== 0){
    this.query+= ' state = ' + "'" + this.state +"'"; 
  }else{
    this.query+= "";
  };
}

Map.prototype.getDates = function(){

  if (this.date1.length !== 0 && this.date2.length !== 0) {
    this.betweenDates();
  }else if (this.date1.length !== 0 && this.date2.length === 0) {
    this.onlyDate1();
  }else if (this.date2.length !== 0  && this.date1.length === 0)  {
    this.onlyDate2();
  }else{
    this.query+= "";
  };
}

Map.prototype.getDatesFromDb = function(){

  if (this.date1 !== null && this.date2 !== null) {
    this.betweenDates();
  }else if (this.date1 !== null && this.date2 === null) {
    this.onlyDate1();
  }else if (this.date2 !== null && this.date1 === null )  {
    this.onlyDate2();
  }else{
    this.query+= "";
  };
}

Map.prototype.onlyDate1 = function(){
  if (this.city.length === 0 || this.sate.length === 0) {
    this.query+= ' date = ' +"'"+ this.date1 +"'"; 
  }else if (this.city.length !== 0 || this.sate.length !== 0) {
    this.query+= ' and date = ' +"'"+ this.date1 +"'"; 
  }else{
    this.query+= "";
  };
}

Map.prototype.onlyDate2 = function(){
  if (this.city.length === 0 || this.sate.length === 0) {
    this.query+= ' date = ' +"'"+ this.date2 +"'"; 
  }else if (this.city.length !== 0 || this.sate.length !== 0) {
    this.query+= ' and date = ' +"'"+ this.date2 +"'"; 
  }else{
    this.query+= "";
  };
}

Map.prototype.betweenDates = function(){
  if (this.city.length > 0 || this.state.length > 0){
    this.query+= ' and date between ' +"'"+ this.date1 +"'"+ " and " +"'"+ this.date2+"'";
  }else{
    this.query+= ' date between ' +"'"+ this.date1 +"'"+ " and " +"'"+ this.date2+"'";
  }
}

Map.prototype.getCartodb = function(id_container){
  if (this.query === " WHERE"){
    this.query = "";
  };

    // Put layer data into a JS object
  var layerSource = {
    user_name: this.cartodb_user || "vitrgilio1974", // 
    type: 'cartodb',
    sublayers: [{ 
      sql: "SELECT * FROM " + this.table_name + this.query + "", // All recorded earthquakes past 30 days
      cartocss: $("#style_1").text() // Simple visualization
    }]
  }
  console.log('---------   ' + layerSource.sublayers[0].sql);
  // console.log('---------   ' + layerSource.sublayers[0].cartocss);
  // For storing the sublayer
  var sublayer;

  // Instantiate new map object, place it in 'map' element
  var map_object = new L.Map(id_container, {
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
        // console.log(layer);
        sublayer = layer.getSubLayer(0);
      })
      .error(function(err) {
        console.log("error: " + err);
      });
};

function setDataFromDb(map,my_stored_map){
  my_stored_map.table_name = map.table;
  my_stored_map.city = map.city;
  my_stored_map.state = map.state;
  my_stored_map.date1 = map.date1;
  my_stored_map.date2 = map.date2;
  my_stored_map.getCartoDbUser();
  my_stored_map.getCity();
  my_stored_map.getState(); 
  my_stored_map.getDatesFromDb(); 
  }

  









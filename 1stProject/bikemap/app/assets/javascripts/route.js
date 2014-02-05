

/*An example of using the MQA.EventUtil to hook into the window load event and execute defined function
passed in as the last parameter. You could alternatively create a plain function here and have it
executed whenever you like (e.g. <body onload="yourfunction">).*/


MQA.EventUtil.observe(window, 'load', function() {
  /*Create an object for options*/
          /*Create an object for options*/
  var options={
    elt:document.getElementById('map'),        /*ID of element on the page where you want the map added*/
    zoom:10,                                   /*initial zoom level of map*/
    latLng:{lat:37.7833, lng:-122.4167},   /*center of map in latitude/longitude*/
    mtype:'map',                               /*map type (map)*/
    bestFitMargin:0,                           /*margin offset from the map viewport when applying a bestfit on shapes*/
    zoomOnDoubleClick:true                     /*zoom in when double-clicking on map*/
  };
  window.map = new MQA.TileMap(options);

  /*Construct an instance of MQA.TileMap with the options object*/
  
  
  MQA.withModule('directions', function() {
      var selectedVal = "";
      var selected = $("input[type='radio'][name='roadGradeStrategy']:checked");
      if (selected.length > 0) {
        selectedVal = selected.val();
      } else {
          selectedVal = 'DEFAULT_STRATEGY'
      };
      /*Add options.*/
    map.addRoute([
      {street: document.getElementById('startLocation').value},
      {street: document.getElementById('endLocation').value}],
      {routeOptions: { ambiguities:'ignore', 
      					routeType:'bicycle', 
      					manMaps:'false', 
      					roadGradeStrategy: selectedVal
      	}, 
        ribbonOptions: {draggable:true}
      },
      /*Add the callback function to the route call.*/
      displayNarrative
    );
  });
});


  // Construct an instance of MQA.TileMap with the options object
  // window.map = new MQA.TileMap(options);

  
var sessionID = ""
/*Example function inspecting the route data and generating a narrative for display.*/
function displayNarrative(data){
var thissessionID = data.route.sessionId
sessionID = thissessionID
  if(data.route){
    var legs = data.route.legs, html = '', i = 0, j = 0, trek, maneuver;
    html += '<table><tbody>';

    for (; i < legs.length; i++) {
      for (j = 0; j < legs[i].maneuvers.length; j++) {
        maneuver = legs[i].maneuvers[j];
        html += '<tr>';
        html += '<td>';

        if (maneuver.iconUrl) {
          html += '<img src="' + maneuver.iconUrl + '">  ';
        }

        for (k = 0; k < maneuver.signs.length; k++) {
          var sign = maneuver.signs[k];
          if (sign && sign.url) {
            html += '<img src="' + sign.url + '">  ';
          }
        }
        html += '</td><td>' + maneuver.narrative + '</td>';
        html += '</tr>';
      }
    }
    html += '</tbody></table>';
    document.getElementById('narrative').innerHTML = html;
  }
}


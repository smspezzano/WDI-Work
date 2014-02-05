



var CHART = 'http://open.mapquestapi.com/elevation/v1/chart?key=Fmjtd%7Cluur2162nq%2C8l%3Do5-90z05a&inFormat=kvp&shapeFormat=raw&width=425&height=350&sessionID=sessionID';
var PROFILE = 'http://open.mapquestapi.com/elevation/v1/profile?key=Fmjtd%7Cluur2162nq%2C8l%3Do5-90z05a&callback=handleHelloWorldResponse&shapeFormat=raw&sessionID=sessionID';





function handleChart(response) {
  var helloWorldArray = response.elevationProfile;
    var html = '';    
    var i = 0;
    html += '<table>';
    html += '<tr><th>Elevation</th><th>Distance</th></tr>';
    html += '<tbody>';  
    for(; i < helloWorldArray.length; i++) {
      html += '<tr><td>';
      html += helloWorldArray[i].height;
      html += '</td>'
      html += '<td>';
      html += helloWorldArray[i].distance;
      html += '</td></tr>';
    }
    html += '</tbody></table>';
  document.getElementById('showHelloWorldChart').style.display = 'none';
    document.getElementById('sampleHelloWorldResponse').innerHTML = html;
    document.getElementById('sampleHelloWorldResponse').style.display = 'block'; 

}



function doProfile() {
  var script = document.createElement('script');
    script.type = 'text/javascript';

  var newChartURL = HOST_URL + HELLO_WORLD_CHART;
  var latitude1 = document.getElementById("latitude1").value;
  var longitude1 = document.getElementById("longitude1").value;
  var latitude2 = document.getElementById("latitude2").value;
  var longitude2 = document.getElementById("longitude2").value;
  var latitude3 = document.getElementById("latitude3").value;
  var longitude3 = document.getElementById("longitude3").value;
  
  newChartURL += '&inFormat=kvp&shapeFormat=raw&width=425&height=350&latLngCollection=' + latitude1 + ',' + longitude1 + ',' + latitude2 + ',' + longitude2 + ',' + latitude3 + ',' + longitude3;

    var newURL = newChartURL.replace('YOUR_KEY_HERE', APP_KEY);
    script.src = newURL;

  document.getElementById('sampleHelloWorldResponse').style.display = 'none'; 
  document.getElementById('showHelloWorldChart').innerHTML = '<IMG SRC ="' + script.src + '">';    
  document.getElementById('showHelloWorldChart').style.display = 'block';
}




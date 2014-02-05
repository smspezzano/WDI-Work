

var CHART = 'http://open.mapquestapi.com/elevation/v1/chart?key=Fmjtd%7Cluur2162nq%2C8l%3Do5-90z05a&inFormat=kvp&shapeFormat=raw&width=425&height=350&callback=handleChartResponse&shapeFormat=raw';
var PROFILE = 'http://open.mapquestapi.com/elevation/v1/profile?key=Fmjtd%7Cluur2162nq%2C8l%3Do5-90z05a&callback=handleProfileResponse&shapeFormat=raw';



// function showHelloWorldURL() {
// 	var newURL = SAMPLE_HELLO_WORLD_POST;
		
// 	newURL += '&sessionID=' + sessionID;	
//     var safe = newURL;
// };


function getProfile() {
    var script = document.createElement('script');
    script.type = 'text/javascript';

	var basicURL = PROFILE;
	//add sessionID that holds the lat long to the url
	basicURL += '&sessionID=' + sessionID;	

    var newURL = basicURL;
    script.src = newURL;
    document.body.appendChild(script);
}


function handleProfileResponse(response) {
	var chartArray = response.elevationProfile;
    var html = '';    
    var i = 0;
    html += '<table>';
    html += '<tr><th>Elevation</th><th>Distance</th></tr>';
    html += '<tbody>';	
    for(; i < chartArray.length; i++) {
    	html += '<tr><td>';
    	html += chartArray[i].height;
    	html += '</td>'
    	html += '<td>';
    	html += chartArray[i].distance;
    	html += '</td></tr>';
    }
    html += '</tbody></table>';
	document.getElementById('routeProfile').style.display = 'none';
    document.getElementById('profileResponse').innerHTML = html;
    document.getElementById('profileResponse').style.display = 'block'; 

}


// function showHelloWorldChartURL() {	
// 	var newChartURL = HOST_URL + HELLO_WORLD_CHART;
	
// 	newChartURL += '&inFormat=kvp&shapeFormat=raw&width=425&height=350&sessionID=' + sessionID;
// 	var safeChart = newChartURL;
// 	document.getElementById('divHelloWorldChartUrl').innerHTML = safeChart.replace(/</g, '&lt;').replace(/>/g, '&gt;');	
// };


function doChart() {
	var script = document.createElement('script');
    script.type = 'text/javascript';

	var newChartURL = CHART;

	newChartURL += '&inFormat=kvp&shapeFormat=raw&width=425&height=350&sessionID=' + sessionID;

    var newURL = newChartURL;
    script.src = newURL;

	// document.getElementById('routeResponse').style.display = 'none'; 
	document.getElementById('routeChart').innerHTML = '<IMG SRC ="' + script.src + '">';    
	document.getElementById('routeChart').style.display = 'block';
}
var points = {'pts' : [ {'x': 15 , 'y': 15},
               {'x': 195 , 'y': 15},
               {'x': 195 , 'y': 195},
               {'x': 15, 'y': 195} ] };
               
var pointstring = "{'points' :[ {'id': 15 , 'time': 15, 'people':4, 'lat':40.399760 , 'long': -73.551706 }] }";
               
var mapInstance;

//function getProcessingSketchId () { return 'communicationtest'; }

$(document).ready(function() {

	$("#visualize").click(function() {
		// do ajax request to get JSON
		
		// get processing instance
		if (!mapInstance) {
   	    	mapInstance = Processing.getInstanceById('map');
   		}
   		
   		// process json points
   		// and send them to our custom processing class
   		var data = eval("("+pointstring+")");
    	if(data) {
    		var numPeople = 0;
    		
    		mapInstance.clearNodes();
       		for(p=0, end=data.points.length; p<end; p++) {
            	var point = data.points[p];
            	mapInstance.addNode(point.id, point.time, point.people, point.lat, point.long );
            	numPeople += point.people;
    	   }
    	   var agg = "<p>Aggregate data for the period <i>insert period</i></p>";
    	   agg += "<ul><li>Number of nodes: " + data.points.length + "</li>";
    	   agg += "<li>Total people connected: " + numPeople + "</li>";
     	   agg += "<li>Total bandwidth consumed: " + numPeople + "</li>";
    	   agg += "<li>Average people connected: " + 1982379 + "per day </li>";
    	   agg += "<li>Average people connected: " + 1928379 + "per day </li></ul>";

    	   $("#aggregatedata").html(agg);
	    }
	
		// make the processing sketch draw points
		mapInstance.draw(); 	
   	});
 });
class nodeInfo {

  String nodeNumber;
   float  latitude;
  float  longitude;
 
  String  time;
  float  people;
  float device;
  PVector position;

  nodeInfo (String _nodeNumber, float _latitude, float _longitude, String _time, float _people, float _device) {

    nodeNumber= _nodeNumber;
    latitude = _latitude;
    longitude  = _longitude;

    time = _time;
    people =  _people;
    device = _device;
    position = new PVector(random(width), random(height));
  }

  void plotNodes() {
    //stroke(0);
    if (device == 1){
    stroke(20, 250, 251);
    }else    {
    stroke(240, 20, 251);
    }
    fill(240, 20, 251);
 
 PVector p = geoToPixel(new PVector(longitude,latitude));  
 ellipse(p.x,p.y,(10),(10));


  }
   
}




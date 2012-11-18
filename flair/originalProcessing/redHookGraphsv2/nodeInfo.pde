int columnWidth = 0;
float rowHeightPeople = 0;
float rowHeightBandwidth = 0;

class nodeInfo {

  String nodeID;
   float  latitude;
  float  longitude;
  String eqMonth;
  float eqDay;
  float  time;
  float  people;
  String  device;
  float bandwidth;
  PVector position;

  nodeInfo (String _nodeID, float _latitude, float _longitude, float _time, float _people, String  _device, float _bandwidth) {

    nodeID= _nodeID;
    latitude = _latitude;
    longitude  = _longitude;
    time = _time;
    people =  _people;
    device = _device;
    bandwidth = _bandwidth;

    position = new PVector(random(width), random(height));
  }

  void plotTimeIntervals() {
    stroke(0);
    for (int j = 50; j < width; j+=columnWidth) {
      line(j, height-50, j, height-40);
    }
  }
  
  
    void plotConnDevicesCount() {
    columnWidth = (width-50)/timeInterval;
    rowHeightPeople = (height-50)/people;
  rowHeightBandwidth = (height-50)/bandwidth;

    stroke(0);
    for (int j = 50; j < width; j+=columnWidth) {
      line(j, height-50, j, height-40);
    }
    noStroke();
    fill(20, 250, 251);
    ellipse(50+(columnWidth*time), height - 50-(rowHeightPeople), 10, 10);
  

  }
  
  
    void plotBandwidth() {
    columnWidth = (width-50)/24;
    //rowHeight = 

    noStroke();
    fill(240, 230, 130);
    ellipse(50+(columnWidth*time), height-50-(rowHeightBandwidth), 10, 10);
    
  
  }

  }
  






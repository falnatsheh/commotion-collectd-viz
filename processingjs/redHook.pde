ArrayList allNodes;
PImage backgroundMap;

float mapGeoLeft   = -74.151706 ;          // Longitude 125 degrees west
float mapGeoRight  =  -73.432457;          // Longitude 153 degrees east
float mapGeoTop    =   40.410686;          // Latitude 72 degrees north.
float mapGeoBottom =  40.395760;          // Latitude 56 degrees south.

float mapScreenWidth, mapScreenHeight;  // Dimension of map in pixels.
boolean bPoints = false;
/* @pjs preload="rhMap1.png"; */

void setup() {
  size(755, 616);
  background(255);

  smooth();
  backgroundMap   = loadImage("rhMap1.png");
  mapScreenWidth  = width;
  mapScreenHeight = height;
  /*  allNodes = new Array();
   allNodes[0] =  new nodeInfo(40.6783333, -74.0180556, 11, 03, 14:30, 30, "iPhone");
   allNodes[1] =  new nodeInfo(40.6783333, -74.0180556, 11, 03, 14:30, 30, "iPhone");
   */
  //  nodeInfo (String _nodeNumber, float _latitude, float _longitude, String _eqMonth, String _eqDay, String _time, float _people, String _device) {
  allNodes = new ArrayList();
  /*String dataCSV [] = loadStrings ("data.csv");
  
  for (int i=0; i < dataCSV.length; i++) {
    println(i + "=" + dataCSV[i]);

    String [] oneNodeData = split(dataCSV[i], ",");
    allNodes.add( new nodeInfo (1, 81828, 3020, float (oneNodeData[0]), float(oneNodeData[1])));
    println("adding Node");
    // allNodes.add( new nodeInfo(nodeNumber, time, people, latitude, longitude));
  }
  */
}

void draw() {
  image(backgroundMap, 0, 0, mapScreenWidth, mapScreenHeight);
  for (int i= 0; i < allNodes.size(); i++) {
    allNodes.get(i).plotNode();
    println("drawing node");
  }
}

void clearNodes() {
  allNodes.clear();
}
void addNode(int nodeNumber, int time, int people, float latitude, float longitude) {
  println("adding node: " + nodeNumber + "lat: " + latitude + "long: " + longitude);
  allNodes.add( new nodeInfo(nodeNumber, time, people, latitude, longitude));
  println(allNodes.size());
}

public PVector pixelToGeo(PVector screenLocation)
{
  return new PVector(mapGeoLeft + (mapGeoRight-mapGeoLeft)*(screenLocation.x)/mapScreenWidth, mapGeoTop - (mapGeoTop-mapGeoBottom)*(screenLocation.y)/mapScreenHeight);
}

public PVector geoToPixel(PVector geoLocation)
{
  return new PVector(mapScreenWidth*(geoLocation.x-mapGeoLeft)/(mapGeoRight-mapGeoLeft), mapScreenHeight - mapScreenHeight*(geoLocation.y-mapGeoBottom)/(mapGeoTop-mapGeoBottom));
}

class nodeInfo {

  int nodeNumber;
  int  time;
int  people;
  float  latitude;
  float  longitude;
  
  nodeInfo (int _nodeNumber, int _time, int _people, float _latitude, float _longitude) {
    nodeNumber= _nodeNumber;
    latitude = _latitude;
    longitude  = _longitude;

    time = _time;
    people =  _people;
  }

  void plotNode() {
    stroke(240, 20, 251);
    fill(240, 20, 251);

    PVector p = geoToPixel(new PVector(longitude, latitude));  
    ellipse(p.x, p.y, (10), (10));
    println("drawing node at lat: " + latitude + " long: " + longitude + " x: " + p.x + " y: " + p.y);

  }
}




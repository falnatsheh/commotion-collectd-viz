nodeInfo [] allNodes;
PImage backgroundMap;

   
   float mapGeoLeft   = -74.951706 ;          
float mapGeoRight  =  -72.932457;          
float mapGeoTop    =   40.410686;          
float mapGeoBottom =  40.395760;          
                         
float mapScreenWidth,mapScreenHeight;  // map size in pixels



void setup() {
 size(755, 616);
 background(255);

smooth();
  noLoop();
  backgroundMap   = loadImage("rhMap1.png");
  mapScreenWidth  = width;
  mapScreenHeight = height;
 /*  allNodes = new Array();
   allNodes[0] =  new nodeInfo(40.6783333, -74.0180556, 11, 03, 14:30, 30, "iPhone");
   allNodes[1] =  new nodeInfo(40.6783333, -74.0180556, 11, 03, 14:30, 30, "iPhone");
*/
   //  nodeInfo (String _nodeNumber, float _latitude, float _longitude, String _eqMonth, String _eqDay, String _time, float _people, String _device) {

  String dataCSV [] = loadStrings ("data.csv");
 allNodes = new nodeInfo [dataCSV.length];

  for(int i=0; i < dataCSV.length; i++) {
    println(i + "=" + dataCSV[i]);
    
   String [] oneNodeData = split(dataCSV[i], ",");
  allNodes [i] = new nodeInfo ((oneNodeData[0]), float(oneNodeData[1]), float(oneNodeData[2]), (oneNodeData[3]), float (oneNodeData[4]), float(oneNodeData[5]));
 
  } 
}

void draw() {
  //background(255);
image(backgroundMap,0,0,mapScreenWidth,mapScreenHeight);

  for(int i= 0; i < allNodes.length; i++) {
     allNodes[i].plotNodes();
/*    if (allNodes[i].people >= 6) {
  allNodes[i].plotNodes();
  //allNodws[i].plotID();
    }*/
  
  }
 //   saveFrame();
}

public PVector pixelToGeo(PVector screenLocation)
{
    return new PVector(mapGeoLeft + (mapGeoRight-mapGeoLeft)*(screenLocation.x)/mapScreenWidth,
                       mapGeoTop - (mapGeoTop-mapGeoBottom)*(screenLocation.y)/mapScreenHeight);
}

public PVector geoToPixel(PVector geoLocation)
{
    return new PVector(mapScreenWidth*(geoLocation.x-mapGeoLeft)/(mapGeoRight-mapGeoLeft),
                       mapScreenHeight - mapScreenHeight*(geoLocation.y-mapGeoBottom)/(mapGeoTop-mapGeoBottom));
}


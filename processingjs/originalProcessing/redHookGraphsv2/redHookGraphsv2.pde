import toxi.geom.*;
nodeInfo [] allNodes;

int colsWidth = 0;
int timeInterval = 0;

void setup() {
  size(1000, 500, P3D);
  background(255);
  smooth();

//Calculate size of columns and rows
  timeInterval = 24;
  colsWidth = width/timeInterval;

//Import Data
  String dataCSV [] = loadStrings ("data.csv");
  allNodes = new nodeInfo [dataCSV.length];

  for (int i=0; i < dataCSV.length; i++) {
    println(i + "=" + dataCSV[i]);

    String [] oneNodeData = split(dataCSV[i], ",");
    allNodes [i] = new nodeInfo ((oneNodeData[0]), float(oneNodeData[1]), float(oneNodeData[2]), float(oneNodeData[3]), float(oneNodeData[4]), (oneNodeData[5]), float(oneNodeData[6]));
  }
}

void draw() {
  //background(255);
  stroke(0);
  //Draw Graph Frame
  line(50, 0, 50, height-50);
  line(50, height-50, width, height-50);

//Draw nodes to screen with whatever data you want to show
  for (int i= 0; i < allNodes.length; i++) {
   allNodes[i].plotConnDevicesCount();
   allNodes[i].plotBandwidth();
  }
  //   saveFrame();
}



/*
//Interactive
void keyPressed(){
 if(key =='q'){
   for (int i= 0; i < allNodes.length; i++) {
  allNodes[i].plotConnDevicesCount();
   }
 } 
 
 if(key =='a'){
   for (int i= 0; i < allNodes.length; i++) {
   allNodes[i].plotBandwidth();
   }
 }
} 
 
 */



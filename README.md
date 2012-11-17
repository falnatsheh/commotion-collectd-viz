commotion-collectd-viz
##Commotion Network collectd Data Visualizer 
###Started at HurricaneHackers Hackathon @ITP

The goal of this project is to connect Commotion Mesh Network nodes with a central server to allow the persons running the RedHook Mesh Network to monitor the usage of their network.  We are using the collectd client built into the openWRT platform to push realtime log data to a central server on the mesh network.  Please read the readme.md in each of the sub directories for how to setup each of the pieces of this project. 

###Collectd Client Config
This directory contains the Mesh Node Collectd configuration file and all external packages

###Collectd Server Config
This directory contains the Collectd Server configuration file and scripts to parse the .rrd files to .xml

###mongoDB Files 
This directory contains the mongoDB Files

###Flair
This directory contains the Graphical User Interface for Visualizing the data from the mongoDB

  

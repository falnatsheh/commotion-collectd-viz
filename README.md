##collectd Data-Server and Visualizer
###Started at HurricaneHackers Hackathon @ITP

Currently some parts of Red Hook Brooklyn are still without power, heat, and internet access.  To help in the recovery a [Wireless Mesh Network](http://techpresident.com/news/23127/red-hook-mesh-network-connects-sandy-survivors-still-without-power) has been created to provide internet access to those still in the affected areas.  However the system does not allow the system administrators to fully monitor the health and usage of the network.  

The current hardware system was replicated at [ITP](http://itp.nyu.edu/itp/) to serve as a test network.  Each node is a [Ubiquiti Networks - NSM5 - NanoStation](http://bit.ly/SD56vS) running [commotion-openwrt](https://github.com/opentechinstitute/commotion-openwrt).

The goal of this project is to connect each node of a [Commotion Mesh Network](https://github.com/opentechinstitute/commotion-openwrt) with a central server so we can better monitor the system's usage. This will allow the persons running the Red Hook Mesh Network the ability to monitor the usage and health of the network. We are using the collectd client packaged with openWRT platform to send logs to a central collectd server connected to a single point the mesh network.  

Please read the readme.md in each of the sub directories for how to setup each of the pieces of this project. 

###collectd Client Config
This directory contains the Mesh Node Collectd configuration file and all external packages.  
You will configure each node of your [commotion-openwrt](https://github.com/opentechinstitute/commotion-openwrt) network with this collectd and plugin configuration.

###collectd Server Config
This directory contains the Collectd Server configuration file and scripts to parse the .rrd files to .xml

###Data-Server 
This directory contains the Data-Server with APIs for Visualization and Monitoring of the system 

###ProcessingJS Data Visualizer 
This directory contains the ProcessingJS and Processing Sketch for Visualizing the data from the Data-Server


  

#Data Server
The data server reponsible for receving data from the collectd server and save it in a mongodb, and make it ready for clients to query data using APIs. 

The server uses play framwork and mongodb. 

Setup: 
1. You need to run mongodb.2. 2.  
2. From the project folder run *play new*

### [server-url]/nodedata/add

Content-Type is application/json.

Post Data example:

{
"nodeId" : 2,
"devicesCount" : 2,
"lat":2.0,
"lng":23.0,
"time":232423423 
}


### [server-url]/nodedata/get/[from-date]/[to-date]

##### Results:

{"NodeData":[{"devicesCount":2,"time":232423423,"nodeId":2,"lng":23,"lat":2},{"devicesCount":2,"time":232423423,"nodeId":2,"lng":23,"lat":2},{"devicesCount":2,"time":232423423,"nodeId":2,"lng":23,"lat":2},{"devicesCount":2,"time":232423423,"nodeId":2,"lng":23,"lat":2}]}

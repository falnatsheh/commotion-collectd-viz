package commotion.collectdviz;

import java.net.UnknownHostException;
import java.util.Date;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.MongoException;
import com.mongodb.WriteResult;

public class MongoHelper {
	/*
	 * The MongoHelper class connects to the local mongodb service and provide
	 * helper methods to add and get data from the database.
	 */
	private static Mongo instance;
	private static final String DATA_BASE_NAME = "meshDB";
	private static final String COLLECTION_NAME = "NodeData";

	public static synchronized Mongo getInstance() throws UnknownHostException,
			MongoException {
		if (instance == null) {
			instance = new Mongo();
		}
		return instance;
	}

	public static WriteResult insertNodeData(NodeData nodeData)
			throws UnknownHostException, MongoException {
		DB db = getInstance().getDB(DATA_BASE_NAME);
		DBCollection coll = db.getCollection(COLLECTION_NAME);
		BasicDBObject doc = new BasicDBObject();
		doc.put(NodeData.NODE_ID, nodeData.getNodeId());
		doc.put(NodeData.LAT, nodeData.getLat());
		doc.put(NodeData.LNG, nodeData.getLng());
		doc.put(NodeData.TIME, nodeData.getTime());
		doc.put(NodeData.DEVICES_COUNT, nodeData.getDevicesCount());
		return coll.insert(doc);
	}

	public static NodeData[] getNodeData(Date from, Date to)
			throws UnknownHostException, MongoException {
		DB db = getInstance().getDB(DATA_BASE_NAME);
		DBCollection coll = db.getCollection(COLLECTION_NAME);
		BasicDBObject query = new BasicDBObject();
		query.put(NodeData.TIME, new BasicDBObject("$gte", from));
		query.put(NodeData.TIME, new BasicDBObject("$lt", to));
		DBCursor cursor = coll.find(query);
		NodeData[] nodeDataArray = new NodeData[cursor.count()];
		int i = 0;
		while (cursor.hasNext()) {
			nodeDataArray[i] = getNodeDataFromDBObject(cursor.next());
			i++;
		}
		return nodeDataArray;
	}

	public static NodeData getNodeDataFromDBObject(DBObject nodeDataObj)
			throws UnknownHostException, MongoException {
		NodeData nodeData = new NodeData();
		nodeData.setNodeId((Integer) nodeDataObj.get(NodeData.NODE_ID));
		nodeData.setDevicesCount((Integer) nodeDataObj
				.get(NodeData.DEVICES_COUNT));
		nodeData.setLat((Double) nodeDataObj.get(NodeData.LAT));
		nodeData.setLng((Double) nodeDataObj.get(NodeData.LNG));
		nodeData.setTime((Date) nodeDataObj.get(NodeData.TIME));
		return nodeData;
	}

}

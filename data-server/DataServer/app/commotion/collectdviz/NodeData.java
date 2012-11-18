package commotion.collectdviz;

import java.util.Date;

import org.json.JSONException;
import org.json.JSONObject;

public class NodeData {
	
	public static final String NODE_ID = "nodeId";
	public static final String LNG = "lng";
	public static final String LAT = "lat";
	public static final String TIME = "time";
	public static final String DEVICES_COUNT = "devicesCount";
	
	private int nodeId;
	private double lng;
	private double lat;
	private Date time;
	private int devicesCount;

	public int getNodeId() {
		return nodeId;
	}

	public void setNodeId(int nodeId) {
		this.nodeId = nodeId;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public int getDevicesCount() {
		return devicesCount;
	}

	public void setDevicesCount(int devicesCount) {
		this.devicesCount = devicesCount;
	}
	
	public JSONObject toJson() throws JSONException{
		JSONObject jo = new JSONObject();
		jo.put(NODE_ID, getNodeId());
		jo.put(LAT, getLat());
		jo.put(LNG, getLng());
		jo.put(TIME, getTime().getTime());
		jo.put(NODE_ID, getNodeId());
		jo.put(DEVICES_COUNT, getDevicesCount());
		return jo;
	}

}

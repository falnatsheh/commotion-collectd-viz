package controllers;

import java.util.Date;

import org.codehaus.jackson.JsonNode;
import org.json.JSONArray;
import org.json.JSONObject;

import commotion.collectdviz.MongoHelper;
import commotion.collectdviz.NodeData;

import play.mvc.BodyParser;
import play.mvc.Controller;
import play.mvc.Http.RequestBody;
import play.mvc.Result;

public class Application extends Controller {
	/*
	 * The Application class responsible for receiving and returning results to
	 * the clients.
	 * 
	 * Note: The methods are mapped to urls using the route file (ake a look a
	 * /conf/route)
	 */
	public static Result index() {
		return ok();
	}

	public static Result getData(Long from, Long to) {
		try {
			NodeData[] nodeDataArray = MongoHelper.getNodeData(new Date(from),
					new Date(to));
			JSONObject res = new JSONObject();
			JSONArray jsonArr = new JSONArray();
			for (NodeData nodeData : nodeDataArray) {
				jsonArr.put(nodeData.toJson());
			}
			return ok(res.put("NodeData", jsonArr).toString());
		} catch (Exception e) {
			return badRequest("Error msg: " + e.getMessage());
		}
	}

	@BodyParser.Of(BodyParser.Json.class)
	public static Result addData() {
		RequestBody body = request().body();
		JsonNode json = body.asJson();
		NodeData nodeData = new NodeData();
		nodeData.setNodeId(json.get(NodeData.NODE_ID).asInt());
		nodeData.setDevicesCount(json.get(NodeData.DEVICES_COUNT).asInt());
		nodeData.setLat(json.get(NodeData.LAT).asDouble());
		nodeData.setLng(json.get(NodeData.LNG).asDouble());
		nodeData.setTime(new Date(json.get(NodeData.TIME).asLong()));
		try {
			MongoHelper.insertNodeData(nodeData);
		} catch (Exception e) {
			e.printStackTrace();
			return badRequest("Error msg: " + e.getMessage());
		}
		return ok();
	}

}
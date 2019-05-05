package com.master.project.task.controller;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.ws.rs.GET;
import javax.ws.rs.OPTIONS;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.json.JSONArray;
import org.json.JSONObject;

import com.master.project.task.util.DBConnection;

@Path("/getData")
public class GetData {

	@GET
	@Path("/socialData")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getSocialGraphData() {
		String output = "";

		JSONArray nodes = new JSONArray();
		JSONArray edges = new JSONArray();
		ResultSet rs = null;
		Statement st = null;
		Connection conn = null;
		JSONObject object = new JSONObject();
		try {
			conn = DBConnection.createConnection();
			st = conn.createStatement();
			rs = st.executeQuery("select i.IncidentId,i.From,i.To from incidentexchange as i");
			boolean flag = true;
			while (rs.next()) {
				flag = true;
				for (int i = 0; i < nodes.length(); i++) {
					int temp = nodes.getJSONObject(i).getInt("id");
					if (temp == rs.getInt(2)) {
						flag = false;
						break;
					}
				}
				if (flag)
					nodes.put(new JSONObject().put("id", rs.getInt(2)).put("label", getUserName(conn, rs.getInt(2))));

				edges.put(new JSONObject().put("from", rs.getInt(2)).put("to", rs.getInt(3)).put("title",
						getIncidentName(conn, rs.getInt(1))));

			}

			// System.out.println(nodes.toString());
			// System.out.println(edges.toString());
			object.put("nodes", nodes);
			object.put("edges", edges);

			output = object.toString();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					/* ignored */}
			}
			if (st != null) {
				try {
					st.close();
				} catch (SQLException e) {
					/* ignored */}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					/* ignored */}
			}
		}
		return Response.status(200).header("Access-Control-Allow-Origin", "*")
				.header("Access-Control-Allow-Methods", "*")
				.header("Access-Control-Allow-Headers",
						"Access-Control-Allow-Origin, Origin, Accept, X-Requested-With, Content-Type, Access-Control-Allow-Methods, Access-Control-Request-Method, Access-Control-Request-Headers")
				.header("Access-Control-Request-Headers",
						"Access-Control-Allow-Origin, Origin, Accept, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers")
				.entity(output).build();

	}

	@OPTIONS
	@Path("/socialData")
	public Response optionsSocialData() {
		return Response.ok("ALRIGHT!!!").header("Access-Control-Allow-Origin", "*")
				.header("Access-Control-Allow-Methods", "PUT,POST").header("cache-control", "public")
				.header("Access-Control-Allow-Headers",
						"Access-Control-Allow-Origin, Origin, Accept, X-Requested-With, Content-Type, Access-Control-Allow-Methods, Access-Control-Request-Method, Access-Control-Request-Headers, cache-control")
				.header("Access-Control-Request-Headers",
						"Access-Control-Allow-Origin, Origin, Accept, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers")
				.build();
	}

	public String getUserName(Connection conn, int userId) {
		try {
			ResultSet rs = conn.createStatement().executeQuery("select UserName from user where UserId = " + userId);
			rs.next();
			return rs.getString(1);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "";
	}

	public String getIncidentName(Connection conn, int incidentId) {
		try {
			ResultSet rs = conn.createStatement()
					.executeQuery("select IncidentType from incident where IncidentId = " + incidentId);
			rs.next();
			return rs.getString(1);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "";
	}

}

package com.master.project.task.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.json.JSONArray;
import org.json.JSONObject;

public class TestFunc {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		JSONArray nodes = new JSONArray();
		JSONArray edges = new JSONArray();
		ResultSet rs = null;
		Statement st = null;
		Connection conn = null;
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

			System.out.println(nodes.toString());
			System.out.println(edges.toString());

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

	}

	public static String getUserName(Connection conn, int userId) {
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

	public static String getIncidentName(Connection conn, int incidentId) {
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

package com.master.project.task.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.master.project.task.beans.Bluetooth;
import com.master.project.task.beans.Incidents;
import com.master.project.task.beans.WiFi;
import com.master.project.task.util.DBConnection;

/**
 * Servlet implementation class UserDetails
 */
@WebServlet("/UserDetails")
public class UserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection = null;
	private ResultSet rSet = null;
	private Statement statement = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			connection = DBConnection.createConnection();
			statement = connection.createStatement();
			int userId = Integer.parseInt(request.getParameter("userId"));
			String userName = request.getParameter("uName");

			String sql = "select * from incident where IncidentId in(select inc.IncidentId from incidentexchange as inc where inc.to = "
					+ userId + ")";
			List<Incidents> incidentsRecieved = ListAllIncident.listAllIncidents(sql);

			// Total Number of Incidents
			rSet = statement.executeQuery("select count(incident.IncidentId) as totalcount from incident");
			rSet.next();
			int totalIncidents = rSet.getInt(1);

			// Total number of Incidents Recieved
			rSet = statement.executeQuery(
					"select count(incidentexchange.ID) as incidentRecieved from incidentexchange where incidentexchange.To = "
							+ userId);
			rSet.next();
			int incidentsRecievedCount = rSet.getInt(1);

			// Total amount of data uploaded
			rSet = statement.executeQuery(
					"select sum(i.IncidentSize) as uploaded from incident as i inner join incidentexchange as ie on ie.IncidentId = i.IncidentId where ie.From != ie.To and ie.From ="
							+ userId);
			int dataUploaded = 0;
			if (rSet.next())
				dataUploaded = rSet.getInt(1);

			// Total amount of data download
			rSet = statement.executeQuery(
					"select sum(IncidentSize) as downloaded from incident where IncidentId in (select IncidentId from incidentexchange as ie where ie.To = "
							+ userId + ")");
			int dataDownloaded = 0;
			if (rSet.next())
				dataDownloaded = rSet.getInt(1);

			// Setting the required attributes on session
			request.getSession().setAttribute("incidentsRecCount", incidentsRecievedCount + "");
			request.getSession().setAttribute("tottalIncidents", totalIncidents + "");
			request.getSession().setAttribute("incidentsRecieved", incidentsRecieved);
			request.getSession().setAttribute("dataDown", dataDownloaded);
			request.getSession().setAttribute("dataUpl", dataUploaded);

			// Set User Name
			request.getSession().setAttribute("uName", userName);

			// List Blue tooth
			request.getSession().setAttribute("bluetooths",
					listBluetooth("select * from bluetooth where UserId = " + userId));

			// List WiFi
			request.getSession().setAttribute("wifis",
					listWifiConnections("select * from wifi where UserId = " + userId));

			// Location history
			JSONArray locations = getLocationHistory("select * from location where UserId = " + userId);
			request.getSession().setAttribute("uLat", (Double) locations.getJSONObject(0).get("lat"));
			request.getSession().setAttribute("uLng", (Double) locations.getJSONObject(0).get("lng"));
			request.getSession().setAttribute("locations", locations);

			// Forwarding to user details page
			request.getRequestDispatcher("/userDetails.jsp").forward(request, response);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (rSet != null) {
				try {
					rSet.close();
				} catch (SQLException e) {
					/* ignored */}
			}
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException e) {
					/* ignored */}
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					/* ignored */}
			}
		}
	}

	public List<Bluetooth> listBluetooth(String sql) {
		List<Bluetooth> bluetooths = null;
		try {
			// checking of connection availble
			ResultSet rS = connection.createStatement().executeQuery(sql);
			if (rS.next()) {
				bluetooths = new ArrayList<Bluetooth>();
				do {

					Bluetooth bluetooth = new Bluetooth();
					bluetooth.setBlutoothId(rS.getInt(1));
					bluetooth.setUserId(rS.getInt(2));
					bluetooth.setName(rS.getString(3));
					bluetooth.setAddress(rS.getString(5));
					bluetooth.setType(rS.getInt(4));

					bluetooths.add(bluetooth);
				} while (rS.next());
			}

			rS.close();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		return bluetooths;
	}

	public List<WiFi> listWifiConnections(String sql) {
		List<WiFi> wiFis = new ArrayList<WiFi>();
		try {
			ResultSet rS = connection.createStatement().executeQuery(sql);
			if (rS.next()) {
				do {

					WiFi wifi = new WiFi();
					wifi.setId(rS.getInt(1));
					wifi.setUserId(rS.getInt(2));
					wifi.setChannelWidth(rS.getInt(3));
					wifi.setSsid(rS.getString(4));
					wifi.setBssid(rS.getString(5));
					wifi.setLevel(rS.getInt(6));
					wifi.setFrequency(rS.getInt(7));
					wifi.setCenterFreq0(rS.getInt(8));
					wifi.setCenterFreq1(rS.getInt(9));
					wifi.setCapabilities(rS.getString(10));
					wifi.setChannelWidth20(rS.getInt(11));
					wifi.setChannelWidth40(rS.getInt(12));
					wifi.setChannelWidth80(rS.getInt(13));
					wifi.setChannelWidth160(rS.getInt(14));
					wifi.setChannelWidth80Plus(rS.getInt(15));

					wiFis.add(wifi);
				} while (rS.next());

			}
			rS.close();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		return wiFis;
	}

	public JSONArray getLocationHistory(String sql) {
		JSONArray locations = new JSONArray();
		ResultSet rS = null;
		try {
			rS = connection.createStatement().executeQuery(sql);
			if (rS.next()) {
				do {
					locations.put(new JSONObject().put("lat", rS.getDouble(5)).put("lng", rS.getDouble(3)));
				} while (rS.next());

			} else {
				locations.put(new JSONObject().put("lat", 39.984702).put("lng", 116.318417));
			}

			rS.close();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			locations.put(new JSONObject().put("lat", 39.984702).put("lng", 116.318417));
		}

		return locations;
	}

}

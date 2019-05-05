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

import com.master.project.task.beans.Bluetooth;
import com.master.project.task.beans.Incidents;
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

			rSet = statement.executeQuery("select count(incident.IncidentId) as totalcount from incident");
			rSet.next();
			int totalIncidents = rSet.getInt(1);

			rSet = statement.executeQuery(
					"select count(incidentexchange.ID) as incidentRecieved from incidentexchange where incidentexchange.To = "
							+ userId);
			rSet.next();
			int incidentsRecievedCount = rSet.getInt(1);

			request.getSession().setAttribute("incidentsRecCount", incidentsRecievedCount + "");
			request.getSession().setAttribute("tottalIncidents", totalIncidents + "");
			request.getSession().setAttribute("incidentsRecieved", incidentsRecieved);
			request.getSession().setAttribute("uName", userName);
			request.getSession().setAttribute("bluetooths",
					listBluetooth("select * from bluetooth where UserId = " + userId));

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
		List<Bluetooth> bluetooths = new ArrayList<Bluetooth>();
		try {
			// checking of connection availble 
			ResultSet rS = connection.createStatement().executeQuery(sql);
			while (rS.next()) {
				Bluetooth bluetooth = new Bluetooth();
				bluetooth.setBlutoothId(rS.getInt(1));
				bluetooth.setUserId(rS.getInt(2));
				bluetooth.setName(rS.getString(3));
				bluetooth.setAddress(rS.getString(5));
				bluetooth.setType(rS.getInt(4));

				bluetooths.add(bluetooth);
			}

			rS.close();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return bluetooths;
	}

}
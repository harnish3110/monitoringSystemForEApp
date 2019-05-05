package com.master.project.task.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.master.project.task.beans.Incidents;
import com.master.project.task.util.DBConnection;

/**
 * Servlet implementation class ListAllIncident
 */
@WebServlet("/ListAllIncident")
public class ListAllIncident extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection = null;
	private Statement statement = null;
	private ResultSet rSet = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListAllIncident() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = null;
		String output = "";
		try {
			out = response.getWriter();
			connection = DBConnection.createConnection();
			statement = connection.createStatement();
			String sql = "select * from incident";
			rSet = statement.executeQuery(sql);
			List<Incidents> incidents = new ArrayList<Incidents>();
			while (rSet.next()) {
				Incidents incident = new Incidents();

				incident.setDescription(rSet.getString("Description"));
				incident.setIncidentId(rSet.getInt("IncidentId"));
				incident.setIncidentSize(rSet.getDouble("IncidentSize"));
				incident.setIncidentType(rSet.getString("IncidentType"));
				incident.setSource(rSet.getString("Source"));
				incident.setSourceId(rSet.getString("SourceId"));
				incident.setTimeOfEvent(rSet.getString("TimeOfEvent"));
				incident.setUrl(rSet.getString("Url"));
				incident.setUser(rSet.getString("User"));

				incidents.add(incident);

			}

			statement.close();
			rSet.close();
			request.setAttribute("Incidents", incidents);
			return;

			/*
			 * output =
			 * "<table id='listAllIncident' class=\"display table table-striped table-bordered\" cellspacing=\"0\" width=\"100%\"> "
			 * ; output += " <thead>" + "<tr>" + "<th>ID</th>" + "<th>Description</th>" +
			 * "<th>Time</th>" + "<th>Incident Type</th>" + "<th>Source</th>" +
			 * "<th>Source ID</th>" + "<th>URL</th>" + "</tr></thead><tbody>";
			 * 
			 * while (rSet.next()) { output += "<tr><td>" + rSet.getInt("IncidentId") +
			 * "</td><td>" + rSet.getString("Description") + "</td><td>" +
			 * rSet.getString("TimeOfEvent") + "</td><td>" + rSet.getString("IncidentType")
			 * + "</td><td>" + rSet.getString("Source") + "</td><td>" +
			 * rSet.getString("SourceId") + "</td><td>" + rSet.getString("Url") +
			 * "</td></tr>"; } output += "</tbody></table>";
			 * 
			 * out.println(output);
			 */
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	public static List<Incidents> listAllIncidents(String sql) {
		List<Incidents> incidents = new ArrayList<Incidents>();
		try {
			Connection connection = DBConnection.createConnection();
			Statement statement = connection.createStatement();
			ResultSet rSet = statement.executeQuery(sql);
			while (rSet.next()) {
				Incidents incident = new Incidents();

				incident.setDescription(rSet.getString("Description"));
				incident.setIncidentId(rSet.getInt("IncidentId"));
				incident.setIncidentSize(rSet.getDouble("IncidentSize"));
				incident.setIncidentType(rSet.getString("IncidentType"));
				incident.setSource(rSet.getString("Source"));
				incident.setSourceId(rSet.getString("SourceId"));
				incident.setTimeOfEvent(rSet.getString("TimeOfEvent"));
				incident.setUrl(rSet.getString("Url"));
				incident.setUser(rSet.getString("User"));

				incidents.add(incident);

			}

			statement.close();
			rSet.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return incidents;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

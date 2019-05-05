package com.master.project.task.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.master.project.task.beans.Users;
import com.master.project.task.util.DBConnection;

/**
 * Servlet implementation class IncidentDetails
 */
@WebServlet("/IncidentDetails")
public class IncidentDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection = null;
	private ResultSet rSet = null;
	private Statement statement = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IncidentDetails() {
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
		try {
			System.out.println(request.getParameter("incidentId"));
			int incidentId = Integer.parseInt(request.getParameter("incidentId"));
			String description = request.getParameter("desc");
			connection = DBConnection.createConnection();
			statement = connection.createStatement();
			String sql = "select count(inc.To) as countinc from incidentexchange as inc where IncidentId ="
					+ incidentId;
			rSet = statement.executeQuery(sql);
			rSet.next();
			int incidentReadBy = rSet.getInt("countinc");
			rSet = statement.executeQuery("select count(user.UserName) as users from user");
			rSet.next();
			int usersCount = rSet.getInt("users");
			List<Users> users = RetrieveData.listAllUsers(
					"select * from user where UserId in(select inc.To from incidentexchange as inc where inc.IncidentId="
							+ incidentId + ")");

			request.getSession().setAttribute("readByCount", incidentReadBy + "");
			request.getSession().setAttribute("totalUsers", usersCount + "");
			request.getSession().setAttribute("selectUsers", users);
			request.getSession().setAttribute("description", description);

			request.getRequestDispatcher("/incidentDetails.jsp").forward(request, response);

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

}

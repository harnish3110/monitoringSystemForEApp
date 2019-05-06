package com.master.project.task.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.master.project.task.util.DBConnection;
import com.master.project.task.util.EncryptPassword;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String email, password;
	private Connection connection = null;
	private ResultSet rSet = null;
	private Statement statement = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			email = request.getParameter("email");
			// System.out.println(email);
			password = EncryptPassword.encryption(request.getParameter("password"));
			// System.out.println("password" + password);
			connection = DBConnection.createConnection();
			statement = connection.createStatement();
			String sql = "select * from login where(email='" + email + "' AND password ='" + password + "')";
			rSet = statement.executeQuery(sql);
			if (rSet.next()) {
				System.out.println("Login Successful");
				request.getSession().setAttribute("firstName", rSet.getString("first_name"));

				request.getSession().setAttribute("allUsers",
						RetrieveData.listAllUsers("select * from user order by LastUpdated DESC"));

				request.getSession().setAttribute("Incidents",
						ListAllIncident.listAllIncidents("select * from incident"));

				request.getRequestDispatcher("/home.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "Invalid Credentials");
				System.out.println("invalid");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		finally {
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

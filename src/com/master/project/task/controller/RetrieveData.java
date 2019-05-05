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

import com.master.project.task.beans.Users;
import com.master.project.task.util.DBConnection;

/**
 * Servlet implementation class RetrieveData
 */
@WebServlet("/RetrieveData")
public class RetrieveData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	private Connection connection = null;
	private Statement statement = null;
	private ResultSet rSet = null;

	public RetrieveData() {
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
			String sql = "select * from user";
			rSet = statement.executeQuery(sql);

			output = "<table id='listAllUser' class='display table table-striped table-bordered' cellspacing='0' width='100%' >";
			output += " <thead>" + "<tr>" + "<th>ID</th>" + "<th>Name</th>" + "<th>Email</th>" + "<th>Type</th>"
					+ "</tr></thead><tbody>";

			while (rSet.next()) {
				output += "<tr><td>" + rSet.getInt("UserId") + "</td><td>" + rSet.getString("UserName") + "</td><td>"
						+ rSet.getString("UserEmail") + "</td><td>" + rSet.getInt("UserTypeId") + "</td></tr>";
			}
			output += "</tbody></table>";
			statement.close();
			rSet.close();

			out.println(output);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	public static List<Users> listAllUsers(String sql) {
		List<Users> users = new ArrayList<Users>();
		try {
			Connection connection = DBConnection.createConnection();
			Statement statement = connection.createStatement();
			ResultSet rSet = statement.executeQuery(sql), rSet2 = null;
			while (rSet.next()) {
				Users user = new Users();
				user.setId(rSet.getInt(1));
				user.setEmail(rSet.getString(4));
				user.setName(rSet.getString(2));
				user.setLastUpdated(rSet.getString(6));

				// Need to change
				rSet2 = connection.createStatement()
						.executeQuery("select * from usertype where UserTypeId = " + rSet.getInt(5));
				while (rSet2.next()) {
					user.setType(rSet2.getString(2));
				}

				users.add(user);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return users;
	}

	public static List<Users> listSelectedUsers(String sql) {
		List<Users> users = new ArrayList<Users>();
		Connection connection = null;
		ResultSet rSet = null, rSet2 = null;
		try {
			connection = DBConnection.createConnection();
			rSet = connection.createStatement().executeQuery(sql);
			while (rSet.next()) {
				Users user = new Users();
				user.setId(rSet.getInt(1));
				user.setEmail(rSet.getString(4));
				user.setName(rSet.getString(2));

				// Need to change
				rSet2 = connection.createStatement()
						.executeQuery("select * from usertype where UserTypeId = " + rSet.getInt(5));
				while (rSet2.next()) {
					user.setType(rSet2.getString(2));
				}

				users.add(user);
			}
			rSet2.close();
			connection.close();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return users;

	}

}

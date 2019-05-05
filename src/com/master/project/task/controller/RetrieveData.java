package com.master.project.task.controller;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;

import com.master.project.task.beans.Users;
import com.master.project.task.util.DBConnection;

/**
 * Servlet implementation class RetrieveData
 */
@WebServlet("/RetrieveData")
public class RetrieveData {

	public static List<Users> listAllUsers(String sql) {
		List<Users> users = new ArrayList<Users>();
		Connection connection = null;
		Statement statement = null;
		ResultSet rSet = null,rSet2 = null;
		try {
			connection = DBConnection.createConnection();
			statement = connection.createStatement();
			rSet = statement.executeQuery(sql);
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
		}finally {
			if (rSet != null || rSet2 !=null) {
				try {
					rSet.close();
					rSet2.close();
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

package com.master.project.task.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.master.project.task.util.DBConnection;
import com.master.project.task.util.EncryptPassword;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String email, password, fName, lName;
	private Connection conn = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Registration() {
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
			conn  = DBConnection.createConnection();
			
			fName = request.getParameter("fname");
			lName = request.getParameter("lname");
			email = request.getParameter("email");
			System.out.println(request.getParameter("password"));
			System.out.println(request.getParameter("confirm"));
			password = EncryptPassword.encryption(request.getParameter("password"));
			
			
			if (checkUserName()) {
				PreparedStatement ps = conn
						.prepareStatement("INSERT INTO users(first_name,last_name,email,password) VALUES(?,?,?,?)");
				
				ps.setString(1, fName);
				ps.setString(2, lName);
				ps.setString(3, email);
				ps.setString(4, password);

				ps.executeUpdate();
				request.getSession().setAttribute("firstName", fName);
				conn.close();
				request.getRequestDispatcher("/home.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "User Already exists");
				System.out.println("exists");
				RequestDispatcher rd = request.getRequestDispatcher("/signup.jsp");
				rd.include(request, response);
				return;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	boolean checkUserName() {

		try {
			Statement stmt = conn.createStatement();
			ResultSet rSet1 = stmt.executeQuery("select * from users where email='" + email + "'");
			if (rSet1.next())
				return false;
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}

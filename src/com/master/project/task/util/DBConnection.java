package com.master.project.task.util;

import java.sql.Connection;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

public class DBConnection {
	private static final String SERVER = "localhost";
	private static final int PORT = 3306;
	private static final String DB = "master_proje";
	private static final String USER = "root";
	private static final String PASSWORD = "Admin123";


	public Connection connection;

	public static Connection createConnection() {
		Connection connection = null;
		try {
			MysqlDataSource db = new MysqlDataSource();
			db.setServerName(SERVER);
			db.setPort(PORT);
			db.setDatabaseName(DB);
			db.setUser(USER);
			db.setPassword(PASSWORD);

			connection = db.getConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
}

<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Simple DB Connection</title>
</head>
<body>
	<h1 align="center"> Current Task </h1>
	<%=runMySQL()%>

	<%!String runMySQL() throws SQLException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("Where is your MySQL JDBC Driver?");
			e.printStackTrace();
			return null;
		}

		System.out.println("MySQL JDBC Driver Registered!");
		Connection connection = null;

		try {
			connection = DriverManager.getConnection("jdbc:mysql://ec2-3-15-238-255.us-east-2.compute.amazonaws.com:3306/MyDBHenke0930", "ahenke", "ah6708511");
		} catch (SQLException e) {
			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
			return null;
		}

		if (connection != null) {
			System.out.println("You made it, take control your database now!");
		} else {
			System.out.println("Failed to make connection!");
		}

		PreparedStatement query = null;
		StringBuilder sb = new StringBuilder();

		try {
			connection.setAutoCommit(false);
			String selectSQL = "SELECT * FROM ToDo";
			query = connection.prepareStatement(selectSQL);

			ResultSet rs = query.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String task = rs.getString("task").trim();
				String tasky = rs.getString("tasktype").trim();

				// Display values to webpage.
				sb.append("ID: " + id + "<br>");
				sb.append("Task: " + task + "<br>");
				sb.append("TaskType: " + tasky + "<br>");
				sb.append("----------------------------------------" + "<br>");
			}
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sb.toString();
	}%>

	<a href=/WebprojectTo-DoListHenke/Insert.html>New Task?</a> <br>
</body>
</html>
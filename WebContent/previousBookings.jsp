
<%@ page import="Utils.Util"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<html>
<head>
<link href="css/homestyles1.css" rel="stylesheet">
<link href="css/popup.css" rel="stylesheet">
<link href="css/textbox.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: left;
	padding: 8px;
}

td a {
	display: block;
	width: 100%;
}

tr:nth-child(even) {
	background-color: #ff6347;
}
</style>
</head>
<body>
	<header>
		<div class="container">
			<nav class="navbar fixed-top">
				<ul>
					<li><a href="home.jsp">HOME</a></li>
					<li><a href="dashboard.jsp">DASHBOARD</a></li>
				</ul>
			</nav>
		</div>
	</header>
	<h2 style="color: Tomato;">Booking::</h2>
	<div style="overflow-x: auto;">
		<table>
			<tr>
				<th>S. No</th>
				<th>Booking Id</th>
				<th>Garage Name</th>
				<th>Number_Plate</th>
				<th>Spot</th>
				<th>Date</th>
				<th>Start Hour</th>
				<th>End Hour</th>
				<th>Cost</th>
				<th>After Penalty Cost</th>
				<th>Booking Time</th>
				<th>Code</th>
			</tr>
			<div>
				<%
					String username = (String) session.getAttribute("uname");

				try (Connection connection = Util.getConnection()) {
					PreparedStatement statement = connection.prepareStatement(
					"SELECT * FROM parkingsolution.Booking,Parking_Slip WHERE Booking.Booking_Id = Parking_Slip.Booking_Id and Booking.User_Id = ? and booking.Date < DATE_SUB(CURDATE(), INTERVAL 1 DAY); ");
					statement.setInt(1, Util.getUserId(username));
					ResultSet rs = statement.executeQuery();
					int i = 1;
					while (rs.next()) {
				%>
				<tr>
					<td><%=i++%></td>
					<td><%=rs.getInt(1)%></td>
					<td><%=Util.getGarageName(rs.getInt(11))%></td>
					<td><%=Util.getCarNumber(rs.getInt(3))%></td>
					<td><%=rs.getInt(4)%></td>
					<td><%=rs.getDate(6)%></td>
					<td><%=rs.getInt(7)%></td>
					<td><%=rs.getInt(8)%></td>
					<td><%=rs.getInt(9)%></td>
					<td><%=rs.getInt(19)%></td>
					<td><%=rs.getDate(10)%></td>
					<td><%=rs.getString(5)%></td>
				</tr>
				<%
					}
				rs.close();
				} catch (SQLException e) {
				out.println("SQLException caught: " + e.getMessage());
				}
				%>

			</div>
		</table>
	</div>
</body>
</html>

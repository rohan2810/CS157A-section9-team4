package Utils;

import java.sql.*;

public class Util {

    public static int getUserId(String username) throws ClassNotFoundException {
        String getUserId = "SELECT Id from parkingsolution.User where Username = ?";

        int id = 0;
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/parkingsolution", "root", "root")) {

            PreparedStatement preparedStatement1 = connection.prepareStatement(getUserId);
            preparedStatement1.setString(1, username);
            ResultSet rs = preparedStatement1.executeQuery();
            rs.next();
            id = rs.getInt(1);


        } catch (SQLException e) {
            printSQLException(e);
        }
        return id;
    }

    public static int getGarageId(String garageName) throws ClassNotFoundException {
        String getGarageId = "SELECT Garage_Id from parkingsolution.Garage where Garage_Name = ?";

        int id = 0;
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/parkingsolution", "root", "root")) {

            PreparedStatement preparedStatement1 = connection.prepareStatement(getGarageId);
            preparedStatement1.setString(1, garageName);
            ResultSet rs = preparedStatement1.executeQuery();
            rs.next();
            id = rs.getInt(1);


        } catch (SQLException e) {
            printSQLException(e);
        }
        return id;
    }

    public static void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

}

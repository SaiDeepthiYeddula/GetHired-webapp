package Services;

import models.UserModel;

import java.sql.*;

public class MySQLdb {
    String url = "jdbc:mysql://localhost:3306/job_portal";
    String username = "root";
    String password = "abcdefgh";
    Connection connection = null;
    static MySQLdb instance = null;


    public MySQLdb() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (SQLException | ClassNotFoundException exception) {
            exception.printStackTrace();
        }
    }

    public static synchronized MySQLdb getInstance() {
        if(instance == null) {
            instance = new MySQLdb();
        }
        return instance;
    }
    public UserModel doLogin(String email, String password) throws SQLException {
        UserModel userModel = null;

        // PreparedStatement

//        String qLogin = "SELECT name FROM users WHERE email = ? AND password = ?";
//        PreparedStatement preparedStatement = connection.prepareStatement(qLogin);
//        preparedStatement.setString(1, email);
//        preparedStatement.setString(2, password);
//        ResultSet resultSet = preparedStatement.executeQuery();


        // Statement
        String qLogin = "SELECT fname FROM users WHERE email = '"+ email +"' AND password = '"+ password +"'";
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(qLogin);


        if(resultSet.next()) {
            String name = resultSet.getString("fname");

            userModel = new UserModel(email, name);
        }
        resultSet.close();
        statement.close();
//        preparedStatement.close();
        return userModel;

    }
    public boolean doSignup(String fname, String lname, String email, String password, String profession)throws SQLException {
        boolean result = false;
        String qDoSignup = "INSERT INTO users (fname,lname,email,password,profession) VALUES(?, ?, ?, ?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(qDoSignup);
        preparedStatement.setString(1, fname);
        preparedStatement.setString(2, lname);
        preparedStatement.setString(3, email);
        preparedStatement.setString(4, password);
        preparedStatement.setString(5, profession);
        int rows_update = preparedStatement.executeUpdate();
        if(rows_update > 0) {
            result = true;
        }
        preparedStatement.close();
        return result;
    }
}

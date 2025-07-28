/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class test {
    public static void main(String[] args) throws FileNotFoundException, IOException {
        try (InputStream input = new FileInputStream("DBconfig.properties")){
            Properties props = new Properties();
            props.load(input);
            String user = props.getProperty("db.user");
            String pass = props.getProperty("db.password");
            String url = "jdbc:sqlserver://localhost\\SQLEXPRESS:1433;databaseName=Sneaker_DB";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }
}

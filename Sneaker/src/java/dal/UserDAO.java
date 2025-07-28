package dal;
import model.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO extends DBContext {

    public Account getUser(String email, String pass) {
        String sql = "select * from [User] where user_email=? AND user_pass=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, email);
            pre.setString(2, pass);
            ResultSet resultSet = pre.executeQuery();
            while (resultSet.next()) {
                Account acc = new Account(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3),
                        resultSet.getString(4), resultSet.getBoolean(5), resultSet.getString(6), resultSet.getString(7));
                return acc;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Account> getAllUser() {
        String sql = "select * from [User] ";
        List<Account> list = new ArrayList<>();
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet resultSet = pre.executeQuery();
            while (resultSet.next()) {
                Account acc = new Account(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3),
                        resultSet.getString(4), resultSet.getBoolean(5), resultSet.getString(6), resultSet.getString(7));
                list.add(acc);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean checkEmailExisted(String regisEmail) {
        String sql = "select * from [User] where user_email=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, regisEmail);
            ResultSet resultSet = pre.executeQuery();
            while (resultSet.next()) {
                return resultSet.getString("user_email").equals(regisEmail);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public void addUser(Account account) {
        String sql = """
                     INSERT INTO [dbo].[User]
                                ([user_name]
                                ,[user_email]
                                ,[user_pass]
                                ,[isAdmin]
                                ,[address]
                                ,[phone])
                          VALUES
                                (?
                                ,?
                                ,?
                                ,?
                                ,?
                                ,?)""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, account.getUser_name());
            pre.setString(2, account.getUser_email());
            pre.setString(3, account.getUser_pass());
            pre.setBoolean(4, account.isIsAdmin());
            pre.setString(5, account.getAddress());
            pre.setString(6, account.getPhone());
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getUserID(String email) {
        String sql = """
                     SELECT  [user_id]
                     
                       FROM [Sneaker_DB].[dbo].[User]
                     
                       where user_email = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, email);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public Account getUserByID(int id) {
        String sql = """
                     SELECT  *
                     
                       FROM [Sneaker_DB].[dbo].[User]
                     
                       where user_id = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getBoolean(5), rs.getString(6), rs.getString(7));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        new UserDAO().updateUser(new Account(11, "username", "userEmail", "123", true, "abc", "123"));
    }

    public void setAdmin(int id, boolean role) {
        String sql = """
                   UPDATE [dbo].[User]
                   SET [isAdmin] = ?
                   WHERE user_id=?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setBoolean(1, role);
            pre.setInt(2, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteUser(int id) {
        String sql = """
                   DELETE FROM [dbo].[User]
                         WHERE user_id=?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateUser(Account account) {
        String sql = """
                UPDATE [dbo].[User]
                        SET [user_name] =?
                           ,[user_email] =?
                           ,[user_pass] =?
                           ,[isAdmin] = ?
                           ,[address] = ?
                           ,[phone] = ?
                      WHERE user_id=?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, account.getUser_name());
            pre.setString(2, account.getUser_email());
            pre.setString(3, account.getUser_pass());
            pre.setBoolean(4, account.isIsAdmin());
            pre.setString(5, account.getAddress());
            pre.setString(6, account.getPhone());
            pre.setInt(7, account.getUser_id());
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}

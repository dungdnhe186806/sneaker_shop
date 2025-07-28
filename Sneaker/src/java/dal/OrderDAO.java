package dal;

import model.Order;
import model.OrderDetail;
import model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO extends DBContext {

    public void addOrder(Order order) {
        String sqlOrder = """
                     INSERT INTO [dbo].[Order]
                                ([amound]
                                ,[accountid]
                                ,[createdAt]
                                ,[address]
                                ,[note]
                                ,[phone]
                                ,[payMethod]
                                ,[name])
                          VALUES
                                (?
                                ,?
                                ,GETDATE()
                                ,?
                                ,?
                                ,?
                                ,?
                                ,?)""";

        String sqlDetail = """
                           INSERT INTO [dbo].[OrderDetail]
                                      ([quantity]
                                      ,[productId]
                                      ,[orderId]
                                      ,[size]
                                      ,[color])
                                VALUES
                                      (?
                                      ,?
                                      ,IDENT_CURRENT('Order')
                                      ,?
                                      ,?)""";

        try {
            ProductDAO pdao = new ProductDAO();
            PreparedStatement pre1 = connection.prepareStatement(sqlOrder);
            pre1.setFloat(1, (float) order.getAmount());
            if (order.getUser() == null) {
                pre1.setNull(2, java.sql.Types.NULL);
            } else {
                pre1.setInt(2, order.getUser().getUser_id());
            }
            pre1.setString(3, order.getAddress());
            pre1.setString(4, order.getNote());
            pre1.setString(5, order.getPhone());
            pre1.setString(6, order.getPaymentMethod());
            pre1.setString(7, order.getName());
            pre1.executeUpdate();
            for (OrderDetail i : order.getListOrderDetail()) {
                Product p = pdao.getProductByID(i.getProduct().getProductID());
                if (p.getProductQuantity() - i.getQuantity() <= 0) {
                    pdao.updateProduct(new Product(p.getProductID(), p.getProductName(), p.getProductImg(), 0,
                            p.getProductPriceFloat(), p.getProductDescription(), p.getCate()));
                } else {
                    Product temp = new Product(p.getProductID(), p.getProductName(), p.getProductImg(), p.getProductQuantity() - i.getQuantity(),
                            p.getProductPriceFloat(), p.getProductDescription(), p.getCate());
                    temp.setColor(pdao.getColorByID(p.getProductID()));
                    temp.setSize(pdao.getSizeByID(p.getProductID()));
                    pdao.updateProduct(temp);
                }
                PreparedStatement pre2 = connection.prepareStatement(sqlDetail);
                pre2.setInt(1, i.getQuantity());
                pre2.setInt(2, i.getProduct().getProductID());
                pre2.setString(3, i.getSize());
                pre2.setString(4, i.getColor());
                pre2.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Order> getBillByDay() {

        String sql = """
                        SELECT *
                        FROM [Sneaker_DB].[dbo].[Order]
                        where DAY(createdAt)= DAY(GETDATE()) AND MONTH(createdAt)= MONTH(GETDATE()) AND YEAR(createdAt)=YEAR(GETDATE())""";
        List<Order> list = new ArrayList<>();
        try {
            UserDAO udao = new UserDAO();
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Integer accId = (Integer) rs.getObject("accountid");
                if (accId != null) {
                    list.add(new Order(rs.getInt(1), (double) rs.getFloat(2), udao.getUserByID(rs.getInt("accountid")), rs.getString(5), rs.getString(4),
                            rs.getString(9), rs.getString(6), rs.getString(7), rs.getString(8)));
                } else {
                    list.add(new Order(rs.getInt(1), (double) rs.getFloat(2), null, rs.getString(5), rs.getString(4),
                            rs.getString(9), rs.getString(6), rs.getString(7), rs.getString(8)));
                }

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;

    }

    public int CountBill() {
        String sql = """
                     SELECT COUNT(*) as 'count'
                       FROM [Sneaker_DB].[dbo].[Order]""";
        int count = 0;
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return count;
    }

    public List<Order> getBillInfo() {
        String sql = """
                        SELECT *
                        FROM [Sneaker_DB].[dbo].[Order] 
                        order by createdAt desc""";
        List<Order> list = new ArrayList<>();
        try {
            UserDAO udao = new UserDAO();
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Integer accId = (Integer) rs.getObject("accountid");
                if (accId != null) {
                    list.add(new Order(rs.getInt(1), (double) rs.getFloat(2), udao.getUserByID(rs.getInt("accountid")), rs.getString(5), rs.getString(4),
                            rs.getString(9), rs.getString(6), rs.getString(7), rs.getString(8)));
                } else {
                    list.add(new Order(rs.getInt(1), (double) rs.getFloat(2), null, rs.getString(5), rs.getString(4),
                            rs.getString(9), rs.getString(6), rs.getString(7), rs.getString(8)));
                }

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<OrderDetail> getDetail(int id) {
        String sql = """
                        SELECT *
                          FROM [Sneaker_DB].[dbo].[OrderDetail]
                        
                          where orderId=?""";
        List<OrderDetail> list = new ArrayList<>();
        try {
            ProductDAO pdao = new ProductDAO();
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(rs.getInt(2), rs.getInt(4), pdao.getProductByID(rs.getInt(3)), rs.getString(5), rs.getString(6)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;

    }

    public List<Order> getOrderByUserID(int id) {
        String sql = """
                     SELECT [id]
                           ,[amound]
                           ,[accountid]
                           ,[createdAt]
                           ,[address]
                           ,[note]
                           ,[phone]
                           ,[payMethod]
                           ,[name]
                       FROM [Sneaker_DB].[dbo].[Order]
                       where accountid = ?""";
        List<Order> list = new ArrayList<>();
        try {
            UserDAO dao = new UserDAO();
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), (double) rs.getFloat(2), dao.getUserByID(rs.getInt(3)), rs.getString(5), rs.getString(4),
                        rs.getString(9), rs.getString(6), rs.getString(7), rs.getString(8)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        System.out.println(new OrderDAO().getOrderByUserID(1));
    }

}

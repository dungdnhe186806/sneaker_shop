package dal;

import model.Category;
import model.Color;
import model.Product;
import model.Size;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ProductDAO extends DBContext {

    public List<Product> getAllProduct() {
        String sql = "select  p.id, p.name,p.image,p.quantity, p.price,p.description,c.name from Category c inner join Product p on c.id=p.cate_id";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Category cate = new Category(rs.getString(7));
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4),
                        rs.getFloat(5), rs.getString(6), cate));
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getTop10NewProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 10 p.id , p.name,p.image,  p.quantity, p.price, p.description FROM product p ORDER BY NEWID()";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4),
                        rs.getFloat(5), rs.getString(6)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getTrendProduct() {
        List<Product> list = new ArrayList<>();
        String sql = """
                     select top 12 p.* from Product p 
                                          left outer join 
                                          (SELECT [productId], sum(quantity) as 'count'
                                            FROM [Sneaker_DB].[dbo].[OrderDetail]
                                            group by [productId]) as c
                                          on c.productId=p.id
                                          order by c.count desc""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4),
                        rs.getFloat(5), rs.getString(6)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductByID(int id) {
        String sql = "select p.*, c.name from Category c inner join Product p on p.cate_id=c.id where p.id=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Category cate = new Category(rs.getInt(7), rs.getString(8));
                return new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getInt(4), rs.getFloat(5), rs.getString(6), cate);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Size> getSizeByID(int id) {
        List<Size> list = new ArrayList<>();
        String sql = "select * from product_size where product_id=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Size(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Color> getColorByID(int id) {
        List<Color> list = new ArrayList<>();
        String sql = "select * from product_color where product_id=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Color(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<String> getAllColor() {
        List<String> list = new ArrayList<>();
        String sql = "select distinct color from product_color";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Category getCategoryByID(int id) {
        String sql = "select c.id, c.name from Category c inner join Product p on p.cate_id=c.id where p.id=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return new Category(rs.getInt(1), rs.getString(2));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getProductByCategory(int category_id) {
        List<Product> list = new ArrayList<>();
        String sql = "select p.*,c.name from Product p inner join Category c on p.cate_id=c.id where c.id=?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, category_id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt(7), rs.getString(8));
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4),
                        rs.getFloat(5), rs.getString(6), c));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Category> getAllCategory() {
        String sql = "select c.id,c.name from Category c";
        List<Category> list = new ArrayList<>();
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getListByPage(List<Product> list,
            int start, int end) {
        List<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Product> sortListProduct(List<Product> list,
            String sortBy) {
        if (sortBy.equals("default")) {
            list.sort((Product o1, Product o2) -> Integer.compare(o2.getProductID(), o1.getProductID()));
        }
        if (sortBy.equals("nameAZ")) {
            list.sort((Product o1, Product o2) -> o1.getProductName().compareTo(o2.getProductName()));
        }
        if (sortBy.equals("nameZA")) {
            list.sort((Product o1, Product o2) -> -(o1.getProductName().compareTo(o2.getProductName())));
        }
        if (sortBy.equals("priceAcs")) {
            list.sort((Product o1, Product o2) -> Float.compare(o1.getProductPriceFloat(), o2.getProductPriceFloat()));
        }
        if (sortBy.equals("priceDec")) {
            list.sort((Product o1, Product o2) -> -Float.compare(o1.getProductPriceFloat(), o2.getProductPriceFloat()));
        }
        return list;
    }

    public List<Product> getProductsByFilter(String searchKey, int cateID, float minPrice, float maxPrice, String sizeRaw, String colorRaw) {
        StringBuilder sql = new StringBuilder("""
                                              SELECT distinct p.*,c.name as cateName
                                              FROM Product p  
                                              inner join 
                                              Category c
                                              on p.cate_id=c.id
                                              inner join
                                              product_size pz 
                                              on p.id = pz.product_id
                                              inner join product_color pc
                                              on pc.product_id=p.id  
                                              WHERE 1=1 """);
        List<Product> list = new ArrayList<>();
        boolean hasCondition = false;
        // Add conditions to the SQL query
        if (searchKey != null) {
            sql.append(" AND LOWER(p.name) LIKE ?");
            hasCondition = true;
        }
        if (cateID > 0) {
            sql.append(" AND c.id = ?");
            hasCondition = true;
        }
        if (minPrice >= 0) {
            sql.append(" AND  p.price >= ?");
            hasCondition = true;
        }
        if (maxPrice >= 0) {
            sql.append(" AND  p.price <= ?");
            hasCondition = true;
        }
        String[] size = new String[]{};
        String[] color = new String[]{};
        if (sizeRaw != null && !sizeRaw.isEmpty()) {
            size = sizeRaw.split(",");
            if (size != null && size.length > 0) {
                sql.append(" AND  pz.size IN (");
                for (int i = 0; i < size.length; i++) {
                    sql.append("?");
                    if (i < size.length - 1) {
                        sql.append(", ");
                    }
                }
                sql.append(")");
            }
            hasCondition = true;
        }
        if (colorRaw != null && !colorRaw.isEmpty()) {
            color = colorRaw.split(",");
            if (color != null && color.length > 0) {
                sql.append(" AND pc.color IN (");
                for (int i = 0; i < color.length; i++) {
                    sql.append("?");
                    if (i < color.length - 1) {
                        sql.append(", ");
                    }
                }
                sql.append(")");
            }
            hasCondition = true;
        }
        if (!hasCondition) {
            sql.append(" AND 1=0");
        }
        try {
            PreparedStatement pre = connection.prepareStatement(sql.toString());
            // Set parameters based on the conditions
            int paramIndex = 1;
            if (searchKey != null) {
                pre.setString(paramIndex++, "%" + searchKey.toLowerCase() + "%");
            }
            if (cateID > 0) {
                pre.setInt(paramIndex++, cateID);
            }
            if (minPrice >= 0) {
                pre.setFloat(paramIndex++, minPrice);
            }
            if (maxPrice >= 0) {
                pre.setFloat(paramIndex++, maxPrice);
            }
            if (size != null && size.length > 0) {
                for (String s : size) {
                    pre.setString(paramIndex++, s);
                }
            }
            if (color != null && color.length > 0) {
                for (String c : color) {
                    pre.setString(paramIndex++, c);
                }
            }
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Category cate = new Category(rs.getString(7));
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4),
                        rs.getFloat(5), rs.getString(6), cate));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        System.out.println(sql);
        return list;
    }

    public int CountProduct() {
        String sql = "SELECT COUNT(*) as 'count' from Product";
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

    public int CountUser() {
        String sql = """
                     SELECT COUNT(*) as 'count'   FROM [Sneaker_DB].[dbo].[User]
                       WHERE isAdmin = 0""";
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

    public int CountProductLow() {
        String sql = "SELECT COUNT(*) as 'count' from Product where quantity<50";
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

    public Category getCategoryByName(String name) {
        String sql = """
                     SELECT *
                       FROM [dbo].[Category]
                       where LOWER(name)=LOWER(?)""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, name);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return new Category(rs.getInt(1), rs.getString(2));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertCategory(String name) {
        String sql = """
                     INSERT INTO [dbo].[Category]
                                ([name])
                          VALUES
                                (?)""";
        try {
                PreparedStatement pre = connection.prepareStatement(sql);
                pre.setString(1, name);
                pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void ProductDelete(int id) {
        String sql = """
                     DELETE FROM [dbo].[Product]
                           WHERE id = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
//        Category cate = new Category(3);
//        List<Size> sizes = List.of(new Size(1, "S"), new Size(1, "M"), new Size(1, "L"), new Size(1, "XL"));
//        List<Color> colors = List.of(
//                new Color(1, "#000000"), new Color(1, "#ffffff"), new Color(1, "#FFA500"),
//                new Color(1, "#800080"), new Color(1, "#00FF00"), new Color(1, "#FF0000"));
//
//        Product product = new Product(51, "Adizero", "${pageContext.request.contextPath}/assets/images/ProductImg/bootstrap size.jpg",
//                489, (float) 36.83, "Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.", cate);
//        product.setColor(colors);
//        product.setSize(sizes);
        new ProductDAO().insertCategory("babi");
//        System.out.println(new ProductDAO().getCategoryByName("Shoes"));
    }

    private void deleteSizesByID(int id) {
        String sql = """
                     DELETE FROM [dbo].[product_size]
                                               WHERE product_id = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    private void deleteColorsByID(int id) {
        String sql = """
                     DELETE FROM [dbo].[product_color]
                        WHERE product_id = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateProduct(Product product) {
        String sql1 = """
                     UPDATE [dbo].[Product]
                        SET [name] = ?
                              ,[image] = ?
                              ,[quantity] = ?
                              ,[price] = FORMAT(?, 'N2')
                              ,[description] = ?
                              ,[cate_id] = ?
                      WHERE id=?""";
        String sql2 = """
                      INSERT INTO [dbo].[product_color]
                                 ([product_id]
                                 ,[color])
                           VALUES
                                 (?
                                 ,?)""";
        String sql3 = """
                      INSERT INTO [dbo].[product_size]
                                 ([product_id]
                                 ,[size])
                           VALUES
                                 (?
                                 ,?)""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql1);
            pre.setString(1, product.getProductName());
            pre.setString(2, product.getProductImg());
            pre.setInt(3, product.getProductQuantity());
            pre.setFloat(4, product.getProductPriceFloat());
            pre.setString(5, product.getProductDescription());
            pre.setInt(6, product.getCate().getCategory_id());
            pre.setInt(7, product.getProductID());
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        deleteColorsByID(product.getProductID());
        deleteSizesByID(product.getProductID());
        try {
            for (Color c : product.getColor()) {
                PreparedStatement pre = connection.prepareStatement(sql2);
                pre.setInt(1, product.getProductID());
                pre.setString(2, c.getColor());
                pre.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        try {
            for (Size s : product.getSize()) {
                PreparedStatement pre = connection.prepareStatement(sql3);
                pre.setInt(1, product.getProductID());
                pre.setString(2, s.getSize());
                pre.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertProduct(Product product) {
        String sql1 = """
                     INSERT INTO [dbo].[Product]
                                 ([name]
                                 ,[image]
                                 ,[quantity]
                                 ,[price]
                                 ,[description]
                                 ,[cate_id])
                           VALUES
                                 (?
                                 ,?
                                 ,?
                                 ,?
                                 ,?
                                 ,?)""";
        String sql2 = """
                      INSERT INTO [dbo].[product_color]
                                 ([product_id]
                                 ,[color])
                           VALUES
                                 (IDENT_CURRENT('Product')
                                 ,?)""";
        String sql3 = """
                      INSERT INTO [dbo].[product_size]
                                 ([product_id]
                                 ,[size])
                           VALUES
                                 (IDENT_CURRENT('Product')
                                 ,?)""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql1);
            pre.setString(1, product.getProductName());
            pre.setString(2, product.getProductImg());
            pre.setInt(3, product.getProductQuantity());
            pre.setFloat(4, product.getProductPriceFloat());
            pre.setString(5, product.getProductDescription());
            pre.setInt(6, product.getCate().getCategory_id());
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        deleteColorsByID(product.getProductID());
        deleteSizesByID(product.getProductID());

        try {
            for (Color c : product.getColor()) {
                PreparedStatement pre = connection.prepareStatement(sql2);
                pre.setString(1, c.getColor());
                pre.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        try {
            for (Size s : product.getSize()) {
                PreparedStatement pre = connection.prepareStatement(sql3);
                pre.setString(1, s.getSize());
                pre.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getCurentID() {
        String sql = """
                     SELECT IDENT_CURRENT('Product')""";
        int count = -1;
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
}

package controller.admin;

import model.Account;
import model.Category;
import model.Color;
import model.Product;
import model.Size;
import dal.DBContext;
import dal.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductManager extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("user");

        if (user != null && user.isIsAdmin()) {
            if (action == null) {
                ProductDAO pdao = new ProductDAO();
                List<Product> product = pdao.getAllProduct();
                for (Product p : product) {
                    List<Size> size = pdao.getSizeByID(p.getProductID());
                    List<Color> color = pdao.getColorByID(p.getProductID());
                    Category cate = pdao.getCategoryByID(p.getProductID());
                    p.setSize(size);
                    p.setColor(color);
                    p.setCate(cate);
                }
                List<Category> cates = pdao.getAllCategory();
                request.setAttribute("ProductData", product);
                request.setAttribute("CategoryData", cates);
                request.getRequestDispatcher("View/Admin/product.jsp").forward(request, response);
            } else {
                if (action.equals("insert")) {
                    ProductDAO c = new ProductDAO();
                    List<Category> category = c.getAllCategory();
                    request.setAttribute("CategoryData", category);
                    request.setAttribute("currentId", c.getCurentID());
                    request.getRequestDispatcher("View/Admin/productInsert.jsp").forward(request, response);
                }
                if (action.equals("insertCategory")) {
                    String name = request.getParameter("name");
                    ProductDAO pdao = new ProductDAO();
                    Category c = pdao.getCategoryByName(name);
                    if (c != null) {
                        request.setAttribute("error", name + " already");
                        request.getRequestDispatcher("View/Admin/productInsert.jsp").forward(request, response);
                    } else {
                        pdao.insertCategory(name);
                        request.getRequestDispatcher(request.getContextPath() + "/productmanager?action=insert").forward(request, response);
                    }
                }

                if (action.equals("getModalProduct")) {
                    String productIDRaw = request.getParameter("id");
                    try {
                        int id = Integer.parseInt(productIDRaw);
                        ProductDAO dao = new ProductDAO();
                        Product modalProduct = dao.getProductByID(id);
                        List<Size> sizeList = dao.getSizeByID(id);
                        List<Color> colorList = dao.getColorByID(id);
                        modalProduct.setColor(colorList);
                        modalProduct.setSize(sizeList);
                        request.setAttribute("pModal", modalProduct);
                        request.setAttribute("CategoryData", dao.getAllCategory());
                        request.getRequestDispatcher("View/Admin/product.jsp").forward(request, response);
                    } catch (NumberFormatException e) {
                        response.getWriter().print(e);
                    }
                }

                if (action.equals("insertproduct")) {
                    String category_id = request.getParameter("category_id");
                    String product_name = request.getParameter("product_name");
                    String product_price = request.getParameter("product_price");
                    String product_size = request.getParameter("product_size");
                    String product_color = request.getParameter("product_color");
                    String product_quantity = request.getParameter("product_quantity");
                    String product_img = request.getContextPath() + "/assets/images/ProductImg/" + request.getParameter("product_img");
                    String product_describe = request.getParameter("product_describe");
                    int quantity = Integer.parseInt(product_quantity);
                    float price = Float.parseFloat(product_price);
                    int cid = Integer.parseInt(category_id);
                    ProductDAO dao = new ProductDAO();
                    Category cate = new Category(cid);
                    int id = dao.getCurentID() + 1;
                    String[] size_rw = product_size.split("\\s*,\\s*");
                    String[] color_rw = product_color.split("\\s*,\\s*");
                    int[] size = new int[size_rw.length];
                    int[] color = new int[color_rw.length];
                    //size
                    List<Size> list = new ArrayList<>();
                    try {
                        for (int i = 0; i < size.length; i++) {
                            Size s = new Size(id, size_rw[i]);
                            list.add(s);
                        }
                    } catch (Exception e) {
                        Logger.getLogger(Exception.class.getName()).log(Level.SEVERE, null, e);
                    }
                    // color
                    List<Color> list2 = new ArrayList<>();
                    try {
                        for (int i = 0; i < color.length; i++) {
                            Color s1 = new Color(id, color_rw[i]);
                            list2.add(s1);
                        }
                    } catch (Exception e) {
                       Logger.getLogger(Exception.class.getName()).log(Level.SEVERE, null, e);
                    }

                    Product product = new Product();
                    product.setCate(cate);
                    product.setProductID(id);
                    product.setProductName(product_name);
                    product.setProductPrice(price);
                    product.setProductDescription(product_describe);
                    product.setProductQuantity(quantity);
                    product.setProductImg(product_img);
                    product.setSize(list);
                    product.setColor(list2);
                    dao.insertProduct(product);
                    response.sendRedirect("productmanager?action=insert");
                }

                if (action.equals("deleteProduct")) {
                    String product_id = request.getParameter("id");
                    try {
                        int id = Integer.parseInt(product_id);
                        ProductDAO pdao = new ProductDAO();
                        pdao.ProductDelete(id);
                        response.sendRedirect(request.getContextPath() + "/productmanager");
                    } catch (IOException | NumberFormatException e) {
                    }
                }

                if (action.equals("updateProduct")) {
                    String product_id = request.getParameter("product_id");
                    String category_id = request.getParameter("category_id");
                    String product_name = request.getParameter("product_name");
                    String product_price = request.getParameter("product_price");
                    String product_size = request.getParameter("product_size");
                    String product_color = request.getParameter("product_color");
                    String product_imgRaw = request.getParameter("product_img");
                    String product_quantity = request.getParameter("product_quantity");
                    String product_describe = request.getParameter("product_describe");
                    int id = Integer.parseInt(product_id);
                    int quantity = Integer.parseInt(product_quantity);
                    float price = Float.parseFloat(product_price);
                    int cid = Integer.parseInt(category_id);
                    ProductDAO dao = new ProductDAO();
                    String product_img = request.getContextPath() + "/assets/images/ProductImg/" + request.getParameter("product_img");
                    Category cate = new Category(cid);
                    if (product_imgRaw == null ||  product_imgRaw.isBlank()) {
                        product_img = dao.getProductByID(id).getProductImg();
                    } 
                    String[] size_rw = product_size.split("\\s*,\\s*");
                    String[] color_rw = product_color.split("\\s*,\\s*");
                    int[] size = new int[size_rw.length];
                    int[] color = new int[color_rw.length];
                    //size
                    List<Size> list = new ArrayList<>();
                    try {
                        for (int i = 0; i < size.length; i++) {
                            Size s = new Size(id, size_rw[i]);
                            list.add(s);
                        }
                    } catch (Exception e) {
                        
                    }
                    
                    List<Color> list2 = new ArrayList<>();
                    try {
                        for (int i = 0; i < color.length; i++) {
                            Color s1 = new Color(id, color_rw[i]);
                            list2.add(s1);
                        }
                    } catch (Exception e) {
                    }

                    Product product = new Product();
                    product.setCate(cate);
                    product.setProductID(id);
                    product.setProductName(product_name);
                    product.setProductPrice(price);
                    product.setProductDescription(product_describe);
                    product.setProductQuantity(quantity);
                    product.setProductImg(product_img);
                    product.setSize(list);
                    product.setColor(list2);
                    dao.updateProduct(product);
                    response.sendRedirect("productmanager");
                }
            }
        } else {
            response.sendRedirect("user?action=login");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

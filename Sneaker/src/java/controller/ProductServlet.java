
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import model.Category;
import model.Color;
import model.Product;
import model.Size;
import dal.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;


public class ProductServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");

        if (action == null) {
            ProductDAO dao = new ProductDAO();
            List<Product> productList = dao.getAllProduct();
            List<Category> category = dao.getAllCategory();
            List<String> colors = dao.getAllColor();
            dao.sortListProduct(productList, "default");
            request.getSession().setAttribute("productList", productList);
            request.getSession().setAttribute("ListColor", colors);
            request.getSession().setAttribute("CategoryData", category);
            pagination(request, response);
        } else {
            
            if (action.equals("listByCategory")) {
                String category_id = request.getParameter("category_id");
                int category_id1 = Integer.parseInt(category_id);
                ProductDAO c = new ProductDAO();
                List<Product> productList = c.getProductByCategory(category_id1);
                request.setAttribute("SelectedCateID", category_id1);
                request.getSession().setAttribute("productList", productList);
                pagination(request, response);
            }
            
            if (action.equals("productdetail")) {
                String product_idRaw = request.getParameter("productId");
                try {
                    int product_id = Integer.parseInt(product_idRaw);
                    ProductDAO c = new ProductDAO();
                    List<Size> sizeList = c.getSizeByID(product_id);
                    List<Color> colorList = c.getColorByID(product_id);
                    model.Product product = c.getProductByID(product_id);
                    int category_id = product.getCate().getCategory_id();
                    List<model.Product> productByCategory = c.getProductByCategory(category_id);

                    request.setAttribute("ProductData", product);
                    request.setAttribute("SizeData", sizeList);
                    request.setAttribute("ColorData", colorList);
                    request.setAttribute("ProductByCategory", productByCategory);
                    request.getRequestDispatcher("/View/User/ProductDetail.jsp").forward(request, response);
                } catch (NumberFormatException e) {
                }
            }
            
            if (action.equals("searchFilter")) {
                ProductDAO dao = new ProductDAO();
                HttpSession session = request.getSession();
                String searchKey = request.getParameter("searchKey");
                String priceMinRaw = request.getParameter("priceMin");
                String priceMaxRaw = request.getParameter("priceMax");
                String CateIDRaw = request.getParameter("cateID");
                String size = request.getParameter("size");
                String color = request.getParameter("color");
                try {
                    float priceMin = -1;
                    if (priceMinRaw != null) {
                        priceMin = Float.parseFloat(priceMinRaw);
                    }
                    float priceMax = -1;
                    if (priceMaxRaw != null) {
                        priceMax = Float.parseFloat(priceMaxRaw);
                    }

                    int cateID = -1;
                    if (CateIDRaw != null) {
                        cateID = Integer.parseInt(CateIDRaw);
                    }
                    List<Product> list = dao.getProductsByFilter(searchKey, cateID, priceMin, priceMax, size, color);
                    if (session.getAttribute("ListColor") == null || session.getAttribute("CategoryData") == null) {
                        session.setAttribute("ListColor", dao.getAllColor());
                        session.setAttribute("CategoryData", dao.getAllCategory());
                    }
                    session.setAttribute("productList", list);
                    pagination(request, response);

                } catch (NumberFormatException e) {
                    response.getWriter().print(e);
                }

            }
            
            if (action.equals("pagination")) {
                pagination(request, response);
            }
            
            if (action.equals("sortProduct")) {
                ProductDAO dao = new ProductDAO();
                String sortBy = request.getParameter("sortBy");
                List<Product> productList = (List) request.getSession().getAttribute("productList");
                dao.sortListProduct(productList, sortBy);
                request.getSession().setAttribute("productList", productList);
                request.getSession().setAttribute("sortBy", sortBy);
                pagination(request, response);
            }
            
            if (action.equals("getModalInfo")) {
                String productIDRaw = request.getParameter("productID");
                try {
                    int productID = Integer.parseInt(productIDRaw);
                    ProductDAO dao = new ProductDAO();
                    Product modalProduct = dao.getProductByID(productID);
                    List<Size> sizeList = dao.getSizeByID(productID);
                    List<Color> colorList = dao.getColorByID(productID);
                    request.setAttribute("modalProduct", modalProduct);
                    request.setAttribute("SizeData", sizeList);
                    request.setAttribute("ColorData", colorList);
                    request.getRequestDispatcher("/View/Common/HomeProductModal.jsp").forward(request, response);
                } catch (NumberFormatException e) {
                    response.getWriter().print(e);
                }
            }
        }
    }

    public void pagination(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = (List) request.getSession().getAttribute("productList");
        ProductDAO c = new ProductDAO();
        int page;
        int numperpage ;
        if(request.getParameter("numberPage") == null){
            numperpage = request.getSession().getAttribute("numberPage") != null ? (int) request.getSession().getAttribute("numberPage") : 12;
        }else{
            numperpage = Integer.parseInt(request.getParameter("numberPage"));
        }
        int size = productList.size();
        int num = (size % numperpage == 0 ? (size / numperpage) : (size / numperpage) + 1);//so trang
        if (num == 0) {
            num = 1;
        }
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
            if (page > num) {
                page = num;
            }
        }

        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(page * numperpage, size);
        List<Product> product = c.getListByPage(productList, start, end);
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        request.setAttribute("ListSize", size);
        request.getSession().setAttribute("numberPage", numperpage);
        request.setAttribute("ProductData", product);
        request.getRequestDispatcher("/View/User/Shop.jsp").forward(request, response);
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

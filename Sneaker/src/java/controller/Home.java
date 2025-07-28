package controller;

import model.Product;
import model.Cart;
import model.Item;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

public class Home extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        ProductDAO c = new ProductDAO();

        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie cookie : arr) {
                if (cookie.getName().equals("cart")) {
                    txt += cookie.getValue();
                }
            }
        }
        Cart cart = new Cart(txt, c.getAllProduct());
        List<Item> listItem = cart.getItems();
        int cartSize = 0;
        if (listItem != null) {
            cartSize = cart.getItems().size();
        }
        List<Product> product = c.getTop10NewProduct();
        List<Product> product1 = c.getTrendProduct();

        String modalMess = request.getParameter("modalMess");
        if(modalMess != null){
            request.setAttribute("modalMess", "Đặt hàng thành công! Cảm ơn bạn đã ủng hộ chúng tôi, tiếp tục mua hàng nhé.");
            request.setAttribute("modalTitle", "Đặt hàng thành công!");
        }

        request.getSession().setAttribute("cart", cart);
        request.getSession().setAttribute("cartSize", cartSize);
        request.setAttribute("top10", product);
        request.setAttribute("topTrend", product1);
        request.getRequestDispatcher("/View/User/Home.jsp").forward(request, response);
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

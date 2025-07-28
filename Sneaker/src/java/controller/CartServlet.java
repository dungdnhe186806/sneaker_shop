package controller;

import model.Cart;
import model.Item;
import model.Product;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

public class CartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        ProductDAO dao = new ProductDAO();
        if (action == null) {
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
            String modalMess = request.getParameter("modalMess");
            if (modalMess != null) {
                request.setAttribute("modalMess", "Đặt hàng không thành công! Vui lòng thêm sản phẩm vào giỏ hàng để tiếp tục.");
                request.setAttribute("modalTitle", "Giỏ hàng trống!");
            }
            session.setAttribute("cart", cart);
            session.setAttribute("cartSize", cartSize);
            request.getRequestDispatcher("/View/User/Cart.jsp").forward(request, response);
        } else {

            if (action.equals("addToCart")) {
                String idRaw = request.getParameter("id");
                String quantityRaw = request.getParameter("quantity");
                String size = request.getParameter("size");
                String color = request.getParameter("color");

                try {
                    int id = Integer.parseInt(idRaw);
                    int quantity = Integer.parseInt(quantityRaw);

                    Cart cart = (Cart) session.getAttribute("cart");

                    cart.addItem(new Item(dao.getProductByID(id), quantity, size, color));
                    session.setAttribute("cart", cart);
                    saveCartToCookies(request, response);
                } catch (NumberFormatException e) {
                    response.getWriter().print(e);
                }
            }

            if (action.equals("deleteFromCart")) {
                String idRaw = request.getParameter("id");
                try {
                    int id = Integer.parseInt(idRaw);

                    Cart cart = (Cart) session.getAttribute("cart");

                    cart.removeItem(id);
                    session.setAttribute("cart", cart);
                    saveCartToCookies(request, response);
                } catch (NumberFormatException e) {
                    response.getWriter().print(e);
                }
            }
            if (action.equals("updateCart")) {
                String idRaw = request.getParameter("id");
                String quantityRaw = request.getParameter("quantity");
                String size = request.getParameter("size");
                String color = request.getParameter("color");
                String oldSize = request.getParameter("oldSize");
                String oldColor = request.getParameter("oldColor");
                try {
                    int id = Integer.parseInt(idRaw);
                    int quantity = Integer.parseInt(quantityRaw);
                    Cart cart = (Cart) session.getAttribute("cart");

                    cart.UpdateItem(id, quantity, size, color, oldColor, oldSize);
                    session.setAttribute("cart", cart);
                    saveCartToCookies(request, response);
                } catch (NumberFormatException e) {
                    response.getWriter().print(e);
                }
            }
            if (action.equals("clearCart")) {
                Cart cart = new Cart();
                session.setAttribute("cart", cart);
                saveCartToCookies(request, response);
            }
        }

    }
    private void saveCartToCookies(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        String txt = cart.getCookieForm();
        Cookie cartCookies = new Cookie("cart", txt);
        cartCookies.setMaxAge(3 * 24 * 60 * 60);
        response.addCookie(cartCookies);
        response.sendRedirect(request.getContextPath() + "/Cart");
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

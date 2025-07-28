
package controller;

import model.Cart;
import model.Item;
import model.Order;
import model.OrderDetail;
import dal.OrderDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;


public class OrderServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            String shipFeeRaw = request.getParameter("shipFee");
            try {

                Cart cart = (Cart) request.getSession().getAttribute("cart");
                if (cart.getItems().isEmpty()) {
                    response.sendRedirect(request.getContextPath() + "/Cart?modalMess=emptyCart");
                } else {
                    int shipFee = Integer.parseInt(shipFeeRaw);
                    request.setAttribute("shipFee", shipFee);
                    request.getRequestDispatcher("View/User/Checkout.jsp").forward(request, response);
                }
            } catch (NumberFormatException e) {
                response.getWriter().print(e);
            }

        } else {
            if (action.equals("createOrder")) {
                try {
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    String address = request.getParameter("address");
                    String phone = request.getParameter("phone");
                    String note = request.getParameter("note");
                    String payMethod = request.getParameter("payMethod");
                    String amountRaw = request.getParameter("totalAmount");

                    UserDAO udao = new UserDAO();
                    OrderDAO odao = new OrderDAO();
                    Cart cart = (Cart) request.getSession().getAttribute("cart");

                    List<OrderDetail> odList = new ArrayList<>();
                    for (Item i : cart.getItems()) {
                        OrderDetail od = new OrderDetail(i.getQuantity(), 0, i.getProduct(), i.getSize(), i.getColor());
                        odList.add(od);
                    }
                    try {
                        int accId = udao.getUserID(email);
                        double amount = Double.parseDouble(amountRaw);
                        Order order = new Order(0, amount, udao.getUserByID(accId), address, "", name, note, phone, payMethod);
                        order.setListOrderDetail(odList);
                        odao.addOrder(order);
                    } catch (NumberFormatException e) {
                        response.getWriter().print(e);
                    }
                    request.getSession().setAttribute("cart", new Cart());
                    String txt = new Cart().getCookieForm();
                    Cookie cartCookies = new Cookie("cart", txt);
                    cartCookies.setMaxAge(3 * 24 * 60 * 60);
                    response.addCookie(cartCookies);
                    response.sendRedirect(request.getContextPath() + "/Home?modalMess=successfulOrder");
                } catch (IOException e) {
                    response.getWriter().print(e);
                }

            }
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

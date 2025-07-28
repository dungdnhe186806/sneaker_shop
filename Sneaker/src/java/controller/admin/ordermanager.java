package controller.admin;

import model.Account;
import model.Order;
import model.OrderDetail;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

public class ordermanager extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
            HttpSession session = request.getSession();
            Account user = (Account) session.getAttribute("user");
            String action = request.getParameter("action");
            OrderDAO dao = new OrderDAO();

            if (user==null||user.isIsAdmin()) {
                if (action == null) {
                    List<Order> order = dao.getBillInfo();
                    request.setAttribute("order", order);
                    request.getRequestDispatcher("View/Admin/order.jsp").forward(request, response);
                } else {
                    if (action.equals("showdetail")) {
                        String orderid = request.getParameter("order_id");
                        int id = Integer.parseInt(orderid);
                        List<OrderDetail> detail = dao.getDetail(id);
                        request.setAttribute("detail", detail);
                        request.getRequestDispatcher("View/Admin/orderDetail.jsp").forward(request, response);
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

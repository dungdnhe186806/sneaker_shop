package controller.admin;

import model.Account;
import model.Order;
import dal.OrderDAO;
import dal.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;


public class DashBoard extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("user");
        if (user != null && user.isIsAdmin()) {
            ProductDAO pdao = new ProductDAO();
            OrderDAO odao = new OrderDAO();
            int count = pdao.CountProduct();
            int countuser = pdao.CountUser();
            int countbill = odao.CountBill();
            int countproductlow = pdao.CountProductLow();
            List<Order> orderbyday = odao.getBillByDay();
            request.setAttribute("product", count);
            request.setAttribute("user", countuser);
            request.setAttribute("orderCount", countbill);
            request.setAttribute("low", countproductlow);
            request.setAttribute("orderbyday", orderbyday);
            request.getRequestDispatcher("View/Admin/indexAdmin.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/View/User/loginRegister.jsp");
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

package controller.admin;

import model.Account;
import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

public class customermanager extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("user");
        String action = request.getParameter("action");
        if (user==null||user.isIsAdmin()) {
            if (action == null) {
                UserDAO udao = new UserDAO();
                List<Account> user1 = udao.getAllUser();
                request.setAttribute("user", user1);
                request.getRequestDispatcher("View/Admin/customer.jsp").forward(request, response);
            } else {
                if (action.equals("updateUserRole")) {
                    String user_id = request.getParameter("id");
                    String isAdmin = request.getParameter("role");
                    int id = Integer.parseInt(user_id);
                    boolean role = false;
                    if(isAdmin.equals("Admin")){
                        role=true;
                    }
                    UserDAO dao = new UserDAO();
                    dao.setAdmin(id, role);
                    response.sendRedirect(request.getContextPath()+"/customermanager");
                }
                
                if(action.equals("deleteUser")){
                    String userId=request.getParameter("id");
                    try {
                        int id=Integer.parseInt(userId);
                        UserDAO dao = new UserDAO();
                        dao.deleteUser(id);
                        response.sendRedirect(request.getContextPath()+"/customermanager");
                    } catch (NumberFormatException e) {
                    }
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

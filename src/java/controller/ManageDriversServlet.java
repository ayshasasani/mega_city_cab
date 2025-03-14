package controller;

import dao.DriverDAO;
import model.Driver;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/manage-drivers")
public class ManageDriversServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DriverDAO driverDAO;

    public void init() {
        driverDAO = new DriverDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Driver> drivers = driverDAO.getAllDrivers();
        request.setAttribute("drivers", drivers);
        request.getRequestDispatcher("/admin-drivers.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            int driverId = request.getParameter("driverId") != null ? Integer.parseInt(request.getParameter("driverId")) : 0;

            switch (action) {
                case "add":
                    Driver newDriver = new Driver(0, request.getParameter("name"), request.getParameter("phone"), request.getParameter("licenseNumber"), request.getParameter("availability"));
                    driverDAO.addDriver(newDriver);
                    break;
                case "update":
                    Driver updatedDriver = new Driver(driverId, request.getParameter("name"), request.getParameter("phone"), request.getParameter("licenseNumber"), request.getParameter("availability"));
                    driverDAO.updateDriver(updatedDriver);
                    break;
                case "delete":
                    driverDAO.deleteDriver(driverId);
                    break;
            }
        }
        response.sendRedirect("manage-drivers");
    }
}

package sit.int202.classicmodels.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sit.int202.classicmodels.entities.Office;
import sit.int202.classicmodels.repositories.OfficeRepository;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Servlet", value = "/ListOfficesServlet")
public class ListOfficesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OfficeRepository officeRepository = new OfficeRepository();
        List offices = officeRepository.findAll();
        officeRepository.close();

        request.setAttribute("offices", offices);

        // Forward to the JSP page
        request.getRequestDispatcher("/listOffices.jsp").forward(request, response);
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // รับข้อมูลจากฝั่ง client
        String action = request.getParameter("action");

        // ตรวจสอบ action และประมวลผลตามที่ต้องการ
        if ("insert".equals(action)) {
            performInsert(request, response);
        } else if ("delete".equals(action)) {
            performDelete(request, response);
        } else if ("update".equals(action)) {
            performUpdate(request, response);
        } else if ("search".equals(action)) {
            performSearch(request, response);
        }else {
            // กรณี action ไม่ระบุหรือไม่รู้จัก
            response.sendRedirect("error.jsp");
        }
    }

     private void performInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // รับข้อมูลจากฝั่ง client
        String officeCode = request.getParameter("officeCode");
        String city = request.getParameter("city");
        String phone = request.getParameter("phone");
        String addressLine1 = request.getParameter("addressLine1");
        String addressLine2 = request.getParameter("addressLine2");
        String state = request.getParameter("state");
        String country = request.getParameter("country");
        String postalCode = request.getParameter("postalCode");
        String territory = request.getParameter("territory");

        // ทำตามที่ต้องการ เช่น เพิ่มข้อมูลลงในฐานข้อมูล
        Office newOffice = new Office();
        newOffice.setOfficeCode(officeCode);
        newOffice.setCity(city);
        newOffice.setPhone(phone);
        newOffice.setAddressLine1(addressLine1);
        newOffice.setAddressLine2(addressLine2);
        newOffice.setState(state);
        newOffice.setCountry(country);
        newOffice.setPostalCode(postalCode);
        newOffice.setTerritory(territory);

        OfficeRepository officeRepository = new OfficeRepository();
        try {
            boolean success = officeRepository.insert(newOffice);
            if (success) {
                response.sendRedirect("ListOfficesServlet");
            } else {
                // Set the error message as a request attribute for the error.jsp to display
                request.setAttribute("errorMessage", "Error during office insertion: Unknown error");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        }catch (Exception e) {
            e.printStackTrace(); // Print the exception to the console for debugging

            // Print detailed error information to the response for debugging
            response.getWriter().println("Error during office insertion: " + e.getMessage());
            response.getWriter().println("Cause: " + e.getCause());
            response.getWriter().println("Stack trace:");
            e.printStackTrace(response.getWriter());
            response.getWriter().flush();
        }
        finally {
            officeRepository.close();
        }
    }




    private void performDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // รับข้อมูลจากฝั่ง client
        String officeCodeToDelete = request.getParameter("deleteOfficeCode");

        // ทำตามที่ต้องการ เช่น ลบข้อมูลจากฐานข้อมูล
        OfficeRepository officeRepository = new OfficeRepository();
        boolean success = officeRepository.delete(officeCodeToDelete);
        officeRepository.close();

        // หลังจากทำเสร็จ, สามารถ redirect ไปยังหน้าอื่นๆ หรือส่งข้อมูล response กลับไปยัง client
        if (success) {
            response.sendRedirect("ListOfficesServlet");
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    private void performUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // รับข้อมูลจากฝั่ง client
        String officeCodeToUpdate = request.getParameter("updateOfficeCode");
        String newCity = request.getParameter("newCity");
        String newPhone = request.getParameter("newPhone");
        String newAddressLine1 = request.getParameter("newAddressLine1");
        String newAddressLine2 = request.getParameter("newAddressLine2");
        String newState = request.getParameter("newState");
        String newCountry = request.getParameter("newCountry");
        String newPostcode = request.getParameter("newPostcode");
        String newTerritory = request.getParameter("newTerritory");


        // ทำตามที่ต้องการ เช่น แก้ไขข้อมูลในฐานข้อมูล
        OfficeRepository officeRepository = new OfficeRepository();
        Office existingOffice = officeRepository.find(officeCodeToUpdate);

        if (existingOffice != null) {
            // แก้ไขข้อมูล
            existingOffice.setCity(newCity);
            existingOffice.setPhone(newPhone);
            existingOffice.setAddressLine1(newAddressLine1);
            existingOffice.setAddressLine2(newAddressLine2);
            existingOffice.setState(newState);
            existingOffice.setCountry(newCountry);
            existingOffice.setPostalCode(newPostcode);
            existingOffice.setTerritory(newTerritory);


            // บันทึกการแก้ไขลงในฐานข้อมูล
            boolean success = officeRepository.update(existingOffice);
            officeRepository.close();

            // หลังจากทำเสร็จ, สามารถ redirect ไปยังหน้าอื่นๆ หรือส่งข้อมูล response กลับไปยัง client
            if (success) {
                response.sendRedirect("ListOfficesServlet");
            } else {
                response.sendRedirect("error.jsp");
            }
        } else {
            response.sendRedirect("error.jsp");
        }
    }


    private void performSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the form
        String searchCity = request.getParameter("searchCity");
        String searchCountry = request.getParameter("searchCountry");
        // Add other parameters as needed

        // Search for offices in the database
        OfficeRepository officeRepository = new OfficeRepository();
        List<Office> searchResults = officeRepository.findByCityAndCountry(searchCity, searchCountry);
        officeRepository.close();

        // Set the search results in the request attribute
        request.setAttribute("searchResults", searchResults);

        // Forward to a JSP page to display the search results
        RequestDispatcher dispatcher = request.getRequestDispatcher("searchResults.jsp");
        dispatcher.forward(request, response);
    }
}

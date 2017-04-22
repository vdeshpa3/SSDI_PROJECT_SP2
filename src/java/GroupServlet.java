/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import test.DbManager;

/**
 *
 * @author Akshay
 */
public class GroupServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String group_name = request.getParameter("search_group");
        boolean flag = false;
        try
        {
            ArrayList Rows = new ArrayList();
            
            DbManager db = new DbManager();
            java.sql.Connection conn = db.getConnection();
            if(conn == null)
            {
                System.out.println("Connection not established");
            }
            else
            {
                System.out.println("Connection Established");
                PreparedStatement pst = conn.prepareStatement("SELECT * FROM groups WHERE g_name like '%" + group_name + "%'");
                //pst.setString(1, group_name);
                //pst.setString(2, pass);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) 
                {
                    ArrayList row = new ArrayList();
                    for (int i = 1; i <= 3; i++) 
                    {
                        row.add(rs.getString(i));
                        System.out.println("row " + i);
                    }
                    Rows.add(row);
                    System.out.println("Group Found");
                    flag=true;
                }
            }
            
            if(flag == true)
            {
                {
                    request.setAttribute("ResultSet", Rows);
                    request.setAttribute("group_name", group_name);
                    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    rd.forward(request, response);   
                }
        }
        }catch (SQLException e) {
            System.out.println(e);
        }
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

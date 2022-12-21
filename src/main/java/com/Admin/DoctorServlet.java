package com.Admin;

import java.io.IOException;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/")
public class DoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminDbUtil adminDbUtil;

    public DoctorServlet() {
        super();
        this.adminDbUtil = new AdminDbUtil();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//calling the doGet method
		this.doGet(request, response);
		
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getServletPath();
		
		//switch for handeling servlet path
		switch (action) {
		
		//for show new doctor form
		case "/new":
			
			showNewForm(request, response);
			
			break;
		
		//for insert new doctor
		case "/insert":
			
			try {
				insertDoctor(request, response);
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
			
			break;
		
			//for deleting a doctor
		case "/delete":
			
			try {
			deleteDoctor(request, response);
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
			
			break;
		
		//for show update method
		case "/edit":
			
			try {
				showUpdateForm(request, response);
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
			
			break;
		
		//for update doctor
		case "/update":
			
			try {
				updateDoctor(request, response);
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
			
			break;
		
		//for doctor list
		default:
			
			try {
				listDoctor(request, response);
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
			
			break;
		
		}
		
	}
	
	//show new form cntrl
	private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("addDoctor.jsp");
		dispatcher.forward(request, response);
		
	}
	
	//Create doctor cntrl
	private void insertDoctor(HttpServletRequest request, HttpServletResponse response) throws SQLException,ServletException,IOException{
		
		String dName = request.getParameter("dName");
		String dEmail = request.getParameter("dEmail");
		String dSpec = request.getParameter("dSpec");
		String dContactNo = request.getParameter("dContactNo");
		String dHospital = request.getParameter("dHospital");
		
		Doctor newdoc = new Doctor(dName, dEmail, dSpec, dContactNo, dHospital);
		adminDbUtil.insertDoctor(newdoc);
		response.sendRedirect("list");
		
	}
	
	//to show update form
	private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws SQLException,ServletException,IOException{
		
		int id = Integer.parseInt(request.getParameter("dID"));
		Doctor exsistingDoc = adminDbUtil.selectDoctor(id);
		request.setAttribute("doctor", exsistingDoc);
		RequestDispatcher dispatcher = request.getRequestDispatcher("addDoctors.jsp");
		dispatcher.forward(request, response);
		
	}
	
	// select all doctors
	private void listDoctor(HttpServletRequest request, HttpServletResponse response) throws SQLException,ServletException,IOException{
		
		List<Doctor> listDoctor = adminDbUtil.selectAllDoctor();
		request.setAttribute("listDoctor", listDoctor);
		RequestDispatcher dispatcher = request.getRequestDispatcher("doctorList.jsp");
		dispatcher.forward(request, response);
		
	}
	
	//update doctor cntrl
	private void updateDoctor(HttpServletRequest request, HttpServletResponse response) throws SQLException,ServletException,IOException{
				
		int dID = Integer.parseInt(request.getParameter("dID"));
		String dName = request.getParameter("dName");
		String dEmail = request.getParameter("dEmail");
		String dSpec = request.getParameter("dSpec");
		String dContactNo = request.getParameter("dContactNo");
		String dhospital = request.getParameter("dHospital");
		
		Doctor doctor = new Doctor(dID, dName, dEmail, dSpec, dContactNo, dhospital);
		adminDbUtil.updateDoctor(doctor);
		response.sendRedirect("list");
		
	}
	
	//delete doctor cntrl
	private void deleteDoctor(HttpServletRequest request, HttpServletResponse response) throws SQLException,ServletException,IOException{
		
		int dID = Integer.parseInt(request.getParameter("dID"));
		adminDbUtil.deleteDoctor(dID);
		response.sendRedirect("list");
		
	}

}

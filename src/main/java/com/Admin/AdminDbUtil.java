package com.Admin;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.ArrayList;

public class AdminDbUtil {
	
	private static Connection con = null;
	private static Statement stmt = null;
	
	//SQL queries
	private static final String insert_doctor = "INSERT INTO doctor" + " (dName, dEmail, dSpec, dContactNo, dHospital) VALUES " + " (?, ?, ?, ?, ?);";
	private static final String select_doctor_by_ID = "SELECT dID, dName, dEmail, dSpec, dContactNo, dHospital FROM doctor WHERE dID = ?;";
	private static final String select_all_doctors = "SELECT * FROM echanneling.doctor";
	private static final String delete_doctor_record = "DELETE FROM doctor WHERE dID = ?;";
	private static final String update_doctor_record = "UPDATE doctor SET dName = ?, dEmail = ?, dSpec = ?, dContactNo = ?, dHospital = ? WHERE dID = ?;";
	
	//insert doctor
	public void insertDoctor(Doctor doctor) {
			
		try {
			
			//creating db connection
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			//Assigning values to the place holders
			PreparedStatement preparedStatement = con.prepareStatement(insert_doctor);
			preparedStatement.setString(1, doctor.getdName());
			preparedStatement.setString(2, doctor.getdEmail());
			preparedStatement.setString(3, doctor.getdSpec());
			preparedStatement.setString(4, doctor.getdContactNo());
			preparedStatement.setString(5, doctor.getdHospital());
			
			//executing sql query
			preparedStatement.executeUpdate();
		
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
	 }
	
	//select doctor by id
	public Doctor selectDoctor(int id) {
		
		Doctor doctor = null;
		
		try {
			
			//creating db connection
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			//Assigning values to the place holders
			PreparedStatement preparedStatement = con.prepareStatement(select_doctor_by_ID);
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			
			//executing sql query
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				
				String dName = rs.getString("dName");
				String dEmail = rs.getString("dEmail");
				String dSpec = rs.getString("dSpec");
				String dContactNo = rs.getString("dContactNo");
				String dHospital = rs.getString("dHospital");
				
				doctor = new Doctor(id, dName, dEmail, dSpec, dContactNo, dHospital);
				
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return doctor;
		
	}
	
	//select all doctors
	public List<Doctor> selectAllDoctor() {
		
		List<Doctor> doctors = new ArrayList<>();
		
		try {
			
			//creating db connection
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			//executing sql query
			PreparedStatement preparedStatement = con.prepareStatement(select_all_doctors);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				
				int dID = rs.getInt("dID");
				String dName = rs.getString("dName");
				String dEmail = rs.getString("dEmail");
				String dSpec = rs.getString("dSpec");
				String dContactNo = rs.getString("dContactNo");
				String dHospital = rs.getString("dHospital");
				
				Doctor doc = new Doctor(dID, dName, dEmail, dSpec, dContactNo, dHospital);
				doctors.add(doc);
				
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return doctors;
		
	}
	
	//update doctor(have more things to do)
	
	public boolean updateDoctor(Doctor doctor) {
		
		boolean rowUpdated = false;
		
		try {
			
			//creating db connection
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			//Assigning values to the place holders
			PreparedStatement statement = con.prepareStatement(update_doctor_record);
			statement.setString(1, doctor.getdName());
			statement.setString(2, doctor.getdEmail());
			statement.setString(3, doctor.getdSpec());
			statement.setString(4, doctor.getdContactNo());
			statement.setString(5, doctor.getdHospital());
			statement.setInt(6, doctor.getdID());
			System.out.println(statement);
			
			//executing sql query
			rowUpdated = statement.executeUpdate() > 0;
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return rowUpdated;
		
	}
	
	//delete doctor(have more things to do)
	
	public boolean deleteDoctor(int dID) {
		
		boolean rowDeleted = false;
		
		try {
			
			//creating db connection
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			//Assigning values to the place holders
			PreparedStatement statement = con.prepareStatement(delete_doctor_record);
			statement.setInt(1, dID);
			System.out.println(statement);
			
			//executing sql query
			rowDeleted = statement.executeUpdate() > 0;
			
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rowDeleted;
		
	}
	
}

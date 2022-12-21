package com.Admin;

public class Doctor {
	
	private int dID;
	private String dName;
	private String dEmail;
	private String dSpec;
	private String dContactNo;
	private String dHospital;
	
	//Constructor
	public Doctor() {
		super();
	}
	
	//Parameterized constructor
	
	public Doctor(int dID, String dName, String dEmail, String dSpec, String dContactNo, String dHospital) {
		this.dID = dID;
		this.dName = dName;
		this.dEmail = dEmail;
		this.dSpec = dSpec;
		this.dContactNo = dContactNo;
		this.dHospital = dHospital;
	}
	
	//parameterized constructor without primary key
	
	public Doctor(String dName, String dEmail, String dSpec, String dContactNo, String dHospital) {
		this.dName = dName;
		this.dEmail = dEmail;
		this.dSpec = dSpec;
		this.dContactNo = dContactNo;
		this.dHospital = dHospital;
	}
		
	//Setters and getters for the Doctor class

	//ID
	public int getdID() {
		return dID;
	}

	public void setdId(int dID) {
		this.dID = dID;
	}
	
    //Name
	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}
	
	//Email
	public String getdEmail() {
		return dEmail;
	}

	public void setdEmail(String dEmail) {
		this.dEmail = dEmail;
	}
	
	//Specialization
	public String getdSpec() {
		return dSpec;
	}

	public void setdSpec(String dSpec) {
		this.dSpec = dSpec;
	} 
	
	//ContactNo
	public String getdContactNo() {
		return dContactNo;
	}

	public void setdContactNo(String dContactNo) {
		this.dContactNo = dContactNo;
	}
	
	//Hospital
	public String getdHospital() {
		return dHospital;
	}

	public void setdHospital(String dHospital) {
		this.dHospital = dHospital;
	}
	
}

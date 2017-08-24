/**
 * 
 */
package com.macmis.models.reports;

/**
 * @author Venu S Reddy
 *
 */
public class StudentFilterModel {
	String studentId = "";
	String idList = "";
	String firstName = "";
	String lastName = "";
	String emailId = "";
	String telephone = "";
	String city = "";
	String province = "";
	String country = "";
	String genderList = "";
	String statusList = "";
	String currstatusList = "";

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String id) {
		this.studentId = id;
	}

	public String getIdList() {
		return idList;
	}

	public void setIdList(String idlist) {
		this.idList = idlist;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getGenderList() {
		return genderList;
	}

	public void setGenderList(String genderList) {
		this.genderList = genderList;
	}

	public String getStatusList() {
		return statusList;
	}

	public void setStatusList(String statusList) {
		this.statusList = statusList;
	}

	public String getCurrstatusList() {
		return currstatusList;
	}

	public void setCurrstatusList(String currstatusList) {
		this.currstatusList = currstatusList;
	}

}
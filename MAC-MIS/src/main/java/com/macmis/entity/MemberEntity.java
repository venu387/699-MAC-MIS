/**
 * 
 */
package com.macmis.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * @author Venu S Reddy
 *
 */
@Entity
@Table(name = "Member")
public class MemberEntity {
	int sid;
	String studentId;
	String firstName;
	String middleName;
	String lastName;
	String emailId;
	String telephone;
	String address;
	String city;
	String province;
	String postalCode;
	String country;
	int gender;
	int status;
	String username;
	String password;
	int type;
	int currstatus;//Current/Past
	int year;
	int semester;

	@Id
	@SequenceGenerator(name = "sid_seq", sequenceName = "sid_seq")
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "sid_seq")
	@Column(name = "SID", unique = true, nullable = false)
	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}
	@Column(name = "curr_status", columnDefinition="int default 0")
	public int getCurrstatus() {
		return currstatus;
	}

	public void setCurrstatus(int currstatus) {
		this.currstatus = currstatus;
	}
	@Column(name = "year", columnDefinition="int default 1900")
	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}
	@Column(name = "semester", columnDefinition="int default 0")
	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}
	@Column(name = "username")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	@Column(name = "password")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "student_Id")
	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	@Column(name = "first_name")
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	@Column(name = "middle_name")
	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	
	@Column(name = "last_name")
	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	@Column(name = "email_id")
	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	@Column(name = "telephone")
	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	@Column(name = "address")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	@Column(name = "city")
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	@Column(name = "province")
	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}
	@Column(name = "postal_code")
	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	@Column(name = "country")
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
	@Column(name = "gender", columnDefinition="int default 0")
	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}
	@Column(name = "status", columnDefinition="int default 0")
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	@Column(name = "type", columnDefinition="int default 0")
	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
}

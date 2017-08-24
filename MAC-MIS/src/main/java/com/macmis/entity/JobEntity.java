/**
 * 
 */
package com.macmis.entity;

import java.util.Date;

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
@Table(name = "Job")
public class JobEntity {

	int sid;
	String title;
	int group;
	int company;
	int internshipType;
	String contactEmailId;
	String salary;
	Date expDoj;
	int Status;
	String url;
	String description;
	
	@Column(name = "url")
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}

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
	@Column(name = "title")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Column(name = "job_group")
	public int getGroup() {
		return group;
	}
	public void setGroup(int group) {
		this.group = group;
	}
	@Column(name = "company")
	public int getCompany() {
		return company;
	}
	public void setCompany(int company) {
		this.company = company;
	}
	@Column(name = "internship_type")
	public int getInternshipType() {
		return internshipType;
	}
	public void setInternshipType(int internshipType) {
		this.internshipType = internshipType;
	}
	@Column(name = "contact_email_id")
	public String getContactEmailId() {
		return contactEmailId;
	}
	public void setContactEmailId(String contactEmailId) {
		this.contactEmailId = contactEmailId;
	}
	@Column(name = "salary")
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	@Column(name = "exp_doj")
	public Date getExpDoj() {
		return expDoj;
	}
	public void setExpDoj(Date expDoj) {
		this.expDoj = expDoj;
	}
	@Column(name = "status", columnDefinition="int default 1")
	public int getStatus() {
		return Status;
	}
	public void setStatus(int status) {
		Status = status;
	}
	@Column(name = "description", length=5000)
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}

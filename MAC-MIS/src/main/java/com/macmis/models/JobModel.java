/**
 * 
 */
package com.macmis.models;

import java.util.Date;
import java.util.List;

/**
 * @author Venu S Reddy
 *
 */
public class JobModel {
	int sid;
	String title;
	JobGroupModel group;
	CompanyModel company;
	int internshipType;
	String contactEmailId;
	String salary;
	Date expDoj;
	int Status;
	String url;
	String sendAlert; //1-All 2-Selected
	String hdnIdList;
	
	public String getSendAlert() {
		return sendAlert;
	}
	public void setSendAlert(String sendAlert) {
		this.sendAlert = sendAlert;
	}
	public String getHdnIdList() {
		return hdnIdList;
	}
	public void setHdnIdList(String hdnIdList) {
		this.hdnIdList = hdnIdList;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	String description;
	List<JobReqAndRoleModel> reqRoleList;
	
	public List<JobReqAndRoleModel> getReqRoleList() {
		return reqRoleList;
	}
	public void setReqRoleList(List<JobReqAndRoleModel> reqRoleList) {
		this.reqRoleList = reqRoleList;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public JobGroupModel getGroup() {
		return group;
	}
	public void setGroup(JobGroupModel group) {
		this.group = group;
	}
	public CompanyModel getCompany() {
		return company;
	}
	public void setCompany(CompanyModel company) {
		this.company = company;
	}
	public int getInternshipType() {
		return internshipType;
	}
	public void setInternshipType(int internshipType) {
		this.internshipType = internshipType;
	}
	public String getContactEmailId() {
		return contactEmailId;
	}
	public void setContactEmailId(String contactEmailId) {
		this.contactEmailId = contactEmailId;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public Date getExpDoj() {
		return expDoj;
	}
	public void setExpDoj(Date expDoj) {
		this.expDoj = expDoj;
	}
	public int getStatus() {
		return Status;
	}
	public void setStatus(int status) {
		Status = status;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}

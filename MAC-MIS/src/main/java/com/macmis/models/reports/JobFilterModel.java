/**
 * 
 */
package com.macmis.models.reports;

/**
 * @author Venu S Reddy
 *
 */
public class JobFilterModel {
	String title;
	String jobGroup;
	String jobList;
	int salaryFrom;
	int salaryTo;
	String city;
	String province;
	String country;
	String jobStatusList;

	
	public String getJobList() {
		return jobList;
	}

	public void setJobList(String jobList) {
		this.jobList = jobList;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getJobGroup() {
		return jobGroup;
	}

	public void setJobGroup(String jobGroup) {
		this.jobGroup = jobGroup;
	}

	public int getSalaryFrom() {
		return salaryFrom;
	}

	public void setSalaryFrom(int salaryFrom) {
		this.salaryFrom = salaryFrom;
	}

	public int getSalaryTo() {
		return salaryTo;
	}

	public void setSalaryTo(int salaryTo) {
		this.salaryTo = salaryTo;
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

	public String getJobStatusList() {
		return jobStatusList;
	}

	public void setJobStatusList(String jobStatusList) {
		this.jobStatusList = jobStatusList;
	}

}
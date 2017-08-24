/**
 * 
 */
package com.macmis.models.reports;

/**
 * @author Venu S Reddy
 *
 */
public class ReportsModel {
	private boolean includeStudent;
	private boolean includeInternship;
	private boolean includeJob;
	private boolean includeCompany;
	
	private StudentFilterModel studentFilter;
	private InternshipFilterModel internshipFilter;
	private JobFilterModel jobFilter;
	private CompanyFilterModel companyFilter;
	
	
	public boolean isIncludeStudent() {
		return includeStudent;
	}
	public void setIncludeStudent(boolean includeStudent) {
		this.includeStudent = includeStudent;
	}
	public boolean isIncludeInternship() {
		return includeInternship;
	}
	public void setIncludeInternship(boolean includeInternship) {
		this.includeInternship = includeInternship;
	}
	public boolean isIncludeJob() {
		return includeJob;
	}
	public void setIncludeJob(boolean includeJob) {
		this.includeJob = includeJob;
	}
	public boolean isIncludeCompany() {
		return includeCompany;
	}
	public void setIncludeCompany(boolean includeCompany) {
		this.includeCompany = includeCompany;
	}
	public StudentFilterModel getStudentFilter() {
		return studentFilter;
	}
	public void setStudentFilter(StudentFilterModel studentFilter) {
		this.studentFilter = studentFilter;
	}
	public InternshipFilterModel getInternshipFilter() {
		return internshipFilter;
	}
	public void setInternshipFilter(InternshipFilterModel internshipFilter) {
		this.internshipFilter = internshipFilter;
	}
	public JobFilterModel getJobFilter() {
		return jobFilter;
	}
	public void setJobFilter(JobFilterModel jobFilter) {
		this.jobFilter = jobFilter;
	}
	public CompanyFilterModel getCompanyFilter() {
		return companyFilter;
	}
	public void setCompanyFilter(CompanyFilterModel companyFilter) {
		this.companyFilter = companyFilter;
	}
}

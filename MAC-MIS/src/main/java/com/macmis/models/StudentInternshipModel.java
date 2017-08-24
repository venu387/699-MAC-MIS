/**
 * 
 */
package com.macmis.models;

/**
 * @author Venu S Reddy
 *
 */
public class StudentInternshipModel {
	int sid;
	MemberModel member;
	JobModel job;
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public MemberModel getMember() {
		return member;
	}
	public void setMember(MemberModel member) {
		this.member = member;
	}
	public JobModel getJob() {
		return job;
	}
	public void setJob(JobModel jobId) {
		this.job = jobId;
	}
}

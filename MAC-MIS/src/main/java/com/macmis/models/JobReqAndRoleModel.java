package com.macmis.models;

/**
 * @author Venu S Reddy
 *
 */
public class JobReqAndRoleModel {
	int sid;
	String description;
	int jobId;
	int type; // 1-Requirement 2-Role

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getJobId() {
		return jobId;
	}

	public void setJobId(int jobId) {
		this.jobId = jobId;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
}

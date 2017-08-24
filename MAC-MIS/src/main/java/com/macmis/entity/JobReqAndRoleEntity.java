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
@Table(name="Job_Req_And_Role_Entity")
public class JobReqAndRoleEntity {
	int sid;
	String description;
	int jobId;
	int type; // 1-Requirement 2-Role
	
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
	@Column(name = "description")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Column(name = "Job_Id", columnDefinition="int default 0")
	public int getJobId() {
		return jobId;
	}
	public void setJobId(int jobId) {
		this.jobId = jobId;
	}
	@Column(name = "type", columnDefinition="int default 1")
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
}

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
@Table(name = "StudentInternshipEntity")
public class StudentInternshipEntity {
	int sid;
	int memberId;
	String studentId;
	int jobId;

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
	@Column(name = "memberId", columnDefinition="int default 0")
	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	@Column(name = "studentId")
	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	@Column(name = "jobId", columnDefinition="int default 0")
	public int getJobId() {
		return jobId;
	}

	public void setJobId(int jobId) {
		this.jobId = jobId;
	}

}

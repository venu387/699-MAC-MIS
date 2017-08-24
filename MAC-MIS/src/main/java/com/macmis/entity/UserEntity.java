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
@Table(name = "User")
public class UserEntity {

	int sid;
	String username;
	String password;
	int type;
	
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
	@Column(name = "type")
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
}

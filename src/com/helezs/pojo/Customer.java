package com.helezs.pojo;

import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable
public class Customer {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private String id;
	@Persistent
	private String name;
	@Persistent
	private String adress;
	@Persistent
	private String telephone;
	@Persistent
	private String QQ;
	@Persistent
	private String microLetter;
	@Persistent
	private String mail;
	// 创建时间
	@Persistent
	private long creationTime;
	@Persistent
	private Date creationTimeD;
	//留言
	@Persistent
	private String leaveMessage;
	//空闲时间
	@Persistent
	private String idleTime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getQQ() {
		return QQ;
	}

	public void setQQ(String qQ) {
		this.QQ = qQ;
	}

	public String getMicroLetter() {
		return microLetter;
	}

	public void setMicroLetter(String microLetter) {
		this.microLetter = microLetter;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public long getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(long creationTime) {
		this.creationTime = creationTime;
	}

	public Date getCreationTimeD() {
		return creationTimeD;
	}

	public void setCreationTimeD(Date creationTimeD) {
		this.creationTimeD = creationTimeD;
	}

	public String getLeaveMessage() {
		return leaveMessage;
	}

	public void setLeaveMessage(String leaveMessage) {
		this.leaveMessage = leaveMessage;
	}

	public String getIdleTime() {
		return idleTime;
	}

	public void setIdleTime(String idleTime) {
		this.idleTime = idleTime;
	}

}

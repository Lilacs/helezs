package com.helezs.pojo;

/**
 * 设计师资料
 * 
 * @author zhangPeng
 * 
 */
public class Designer {
	// 姓名
	private String name;
	// 年龄
	private int age;
	// 介绍
	private String introduction;
	// 邮箱
	private String email;
	// 照片(路径)
	private String photo;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

}

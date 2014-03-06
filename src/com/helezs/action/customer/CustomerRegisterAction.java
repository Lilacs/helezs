package com.helezs.action.customer;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.helezs.managePojo.ManageCustomerDAO;
import com.helezs.pojo.Customer;

@Controller
@Scope("prototype")
public class CustomerRegisterAction {
	private Customer customer;
	private String id;
	private String name;
	private String telephone;
	private String idleTime;
	private String qq;
	private String microLetter;
	private String mail;
	private String leaveMessage;
	private List<Customer> customers;
	private boolean flag;
	@Resource
	private ManageCustomerDAO manageCustomerDAO;

	public String viewPage() {
		return "success";
	}

	public String addCustomer() {
		Customer c = new Customer();
		String id = UUID.randomUUID().toString().replace("-", "");
		c.setId(id);
		c.setName(name);
		c.setTelephone(telephone);
		c.setIdleTime(idleTime);
		c.setQQ(qq);
		c.setMicroLetter(microLetter);
		c.setMail(mail);
		c.setLeaveMessage(leaveMessage);
		flag = manageCustomerDAO.addCustomer(c);
		if (flag) {
			return "addCustomer";
		} else {
			return "addFalse";
		}
	}

	public String listCustomers() {
		try {
			customers = manageCustomerDAO.searchCustomers();
			return "listCustomers";
		} catch (Exception e) {
			e.printStackTrace();
			return "queryException";
		}
	}

	public String searchCustomerById() {
		customer = manageCustomerDAO.searchCustomerById(id);
		return "searchCustomerById";
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

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

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getIdleTime() {
		return idleTime;
	}

	public void setIdleTime(String idleTime) {
		this.idleTime = idleTime;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
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

	public String getLeaveMessage() {
		return leaveMessage;
	}

	public void setLeaveMessage(String leaveMessage) {
		this.leaveMessage = leaveMessage;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public List<Customer> getCustomers() {
		return customers;
	}

	public void setCustomers(List<Customer> customers) {
		this.customers = customers;
	}

	public Customer getCustomer() {
		return customer;
	}

}

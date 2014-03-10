package com.helezs.action.customer;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.helezs.managePojo.ManageCustomerDAO;
import com.helezs.pojo.Customer;

@Controller("customerRegisterAction")
@Scope("prototype")
public class CustomerRegisterAction {
	private Customer customer;
	private List<Customer> customers;
	@Resource
	private ManageCustomerDAO manageCustomerDAO;

	@RequestMapping(value = "wantviewPage", method = RequestMethod.GET)
	public String viewPage() {
		return "customer/register";
	}

	@RequestMapping(value = "wantaddCustomer", method = RequestMethod.POST)
	@ResponseBody
	public String addCustomer(@ModelAttribute("customer") Customer customer) {
		Customer c = customer;
		String id = UUID.randomUUID().toString().replace("-", "");
		c.setId(id);
		boolean flag = manageCustomerDAO.addCustomer(c);
		if (flag == true) {
			return "true";
		} else {
			// false
			return "";
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
		customer = manageCustomerDAO.searchCustomerById("");
		return "searchCustomerById";
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
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

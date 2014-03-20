package com.helezs.managePojo;

import java.util.List;

import com.helezs.pojo.Customer;

public interface ManageCustomerDAO {
	// 增
	public boolean addCustomer(Customer customer);

	// 删
	public boolean delCustomer(String id);

	// 查所有
	public List<Customer> searchCustomers();
	
	//根据id查询单个Customer
	public Customer searchCustomerById(String id);
}

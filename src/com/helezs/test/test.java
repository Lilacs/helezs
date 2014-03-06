package com.helezs.test;

import java.util.List;

public class test {
	public void test() {
		Contact c = new Contact();
		c.setId(11111L);
		c.setEmail("1@me.com");
		c.setName("fasd");
		c.setPhone("21323132");
		ContactJdoDAO dao = new ContactJdoDAO();
		dao.addContact(c);
		List<Contact> list = dao.listContacts();
		System.out.println(list.get(0).getEmail());
	}
}

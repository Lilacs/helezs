package com.helezs.test;

import java.util.List;

public interface ContactDAO {
	void addContact(Contact contact);
	void removeContact(Contact contact);
	void updateContact(Contact contact);
	List<Contact> listContacts();
}

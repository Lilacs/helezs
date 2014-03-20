package com.helezs.managePojoimpl;

import java.util.Date;
import java.util.List;

import javax.jdo.PersistenceManager;

import org.springframework.stereotype.Repository;

import com.helezs.managePojo.ManageCustomerDAO;
import com.helezs.pojo.Customer;
import com.helezs.pojo.Writings;
import com.helezs.util.PMF;

@Repository
public class ManageCustomerImpl implements ManageCustomerDAO {

	@Override
	public boolean addCustomer(Customer customer) {
		PersistenceManager pm = PMF.getPersistenceManagerFactory()
				.getPersistenceManager();
		try {
			customer.setCreationTime(new Date().getTime());
			customer.setCreationTimeD(new Date());
			pm.makePersistent(customer);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			pm.close();
		}
	}

	@Override
	public boolean delCustomer(String id) {
		PersistenceManager pm = PMF.getPersistenceManagerFactory()
				.getPersistenceManager();
		try {
			pm.currentTransaction().begin();

			Customer customer = pm.getObjectById(Customer.class, id);
			pm.deletePersistent(customer);

			pm.currentTransaction().commit();
			return true;
		} catch (Exception ex) {
			pm.currentTransaction().rollback();
			ex.printStackTrace();
			return false;
		} finally {
			pm.close();
		}
	}

	@Override
	public List<Customer> searchCustomers() {
		PersistenceManager pm = PMF.getPersistenceManagerFactory()
				.getPersistenceManager();
		String query = "select from " + Customer.class.getName();
		return (List<Customer>) pm.newQuery(query).execute();
	}

	@Override
	public Customer searchCustomerById(String id) {
		PersistenceManager pm = PMF.getPersistenceManagerFactory().getPersistenceManager();
		Customer c,detached;
		try{
			c = pm.getObjectById(Customer.class,id);
			detached = pm.detachCopy(c);
			return detached;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			pm.close();
		}
	}

}

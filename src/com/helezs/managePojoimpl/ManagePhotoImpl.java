package com.helezs.managePojoimpl;

import javax.jdo.PersistenceManager;

import org.springframework.stereotype.Repository;

import com.helezs.managePojo.ManagePhotoDAO;
import com.helezs.pojo.Photo;
import com.helezs.pojo.Writings;
import com.helezs.util.PMF;

@Repository
public class ManagePhotoImpl implements ManagePhotoDAO {

	@Override
	public boolean addPhoto(Photo photo) {
		PersistenceManager pm = PMF.getPersistenceManagerFactory()
				.getPersistenceManager();
		try{
			pm.makePersistent(photo);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}finally{
			pm.close();
		}
	}

	@Override
	public Photo searchById(String id) {
		PersistenceManager pm = PMF.getPersistenceManagerFactory().getPersistenceManager();
		Photo photo,detached;
		try{
			photo = pm.getObjectById(Photo.class,id);
			detached = pm.detachCopy(photo);
			return detached;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			pm.close();
		}
	}

}

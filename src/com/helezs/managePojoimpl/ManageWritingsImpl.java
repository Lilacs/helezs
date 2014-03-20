package com.helezs.managePojoimpl;

import java.util.Date;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

import org.springframework.stereotype.Repository;

import com.helezs.managePojo.ManageWritingsDAO;
import com.helezs.pojo.Writings;
import com.helezs.util.PMF;
@Repository
public class ManageWritingsImpl implements ManageWritingsDAO{
	public static int numberOfShows = 15;
	@Override
	public boolean addWritings(Writings writings) {
		PersistenceManager pm = PMF.getPersistenceManagerFactory()
				.getPersistenceManager();
		try {
			writings.setCreationTime(new Date().getTime());
			writings.setCreationTimeD(new Date());
			pm.makePersistent(writings);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			pm.close();
		}
	}

	@Override
	public boolean delWritings(String id) {
		PersistenceManager pm = PMF.getPersistenceManagerFactory()
				.getPersistenceManager();
		try {
			pm.currentTransaction().begin();

			Writings writings = pm.getObjectById(Writings.class, id);
			pm.deletePersistent(writings);

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
	public boolean updateWritings(Writings writings) {
		PersistenceManager pm = PMF.getPersistenceManagerFactory()
				.getPersistenceManager();
		try {
			pm.currentTransaction().begin();
			Writings _writings = pm.getObjectById(Writings.class, writings.getId());
			_writings.setTitle(writings.getTitle());
			_writings.setAuthor(writings.getAuthor());
			_writings.setContent(writings.getContent());
			_writings.setClassification(writings.getClassification());
			_writings.setTop(writings.isTop());
			_writings.setModifyTime(new Date().getTime());
			_writings.setModifyTimeD(new Date());
			_writings.setCount(writings.getCount());
			pm.currentTransaction().commit();
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			pm.currentTransaction().rollback();
			return false;
		} finally {
			pm.close();
		}
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<Writings> searchWritings() {
		PersistenceManager pm = PMF.getPersistenceManagerFactory()
				.getPersistenceManager();
		String query = "select from " + Writings.class.getName();
		Query q = pm.newQuery(query);
		q.setOrdering("creationTime desc");
		return (List<Writings>) q.execute();
	}
	
	//分类查询(测试可以通过)
	public List<Writings> searchWritingsByClassification(String classification){
		PersistenceManager pm = PMF.getPersistenceManagerFactory().getPersistenceManager();
		Query q = pm.newQuery(Writings.class);
		q.setFilter("classification == searchClassification");
		q.declareParameters("String searchClassification");
		try{
			List<Writings> results =(List<Writings>) q.execute(classification);
			return results;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			pm.close();
		}
	}
	
	@Override
	//通过测试可以使用
	public Writings searchWritingsWithId(String id) {
		PersistenceManager pm = PMF.getPersistenceManagerFactory().getPersistenceManager();
		Writings w,detached;
		try{
			w = pm.getObjectById(Writings.class,id);
			detached = pm.detachCopy(w);
			return detached;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			pm.close();
		}
		
	}

	@Override
	//按照分类查询该分类共有多少条记录,计算出多少页并返回
	public int countByClassification(String classification) {	
		List<Writings> lw = this.searchWritingsByClassification(classification);
		int size = lw.size();
		if(size == 0){
			return 1;
		}
		if(size%numberOfShows > 0){
			return size/numberOfShows + 1;
		}else{
			return size/numberOfShows;
		}
	}

	@Override
	//按照分类分页查询
	public List<Writings> PagingQueryByClassification(int pageNumber,
			String classification) {
		PersistenceManager pm = PMF.getPersistenceManagerFactory().getPersistenceManager();
		Query q = pm.newQuery(Writings.class);
		q.setFilter("classification == searchClassification");
		q.declareParameters("String searchClassification");
		int start = (pageNumber-1)*numberOfShows;
		int end = start+numberOfShows;
		
		try{
			q.setRange(start,end);
			q.setOrdering("creationTime desc");
			List<Writings> results =(List<Writings>) q.execute(classification);
			return results;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			pm.close();
		}
	}
	
}

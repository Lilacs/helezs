package com.helezs.managePojo;

import java.util.List;

import com.helezs.pojo.Writings;


public interface ManageWritingsDAO {
		// 增
		public boolean addWritings(Writings writings);

		// 删
		public boolean delWritings(String id);

		// 改
		public boolean updateWritings(Writings writings);

		// 查所有
		public List<Writings> searchWritings();

		// 按照id查单个
		public Writings searchWritingsWithId(String id);
		
		//按照分类查询
		public List<Writings> searchWritingsByClassification(String classification);
		
		//按照分类查询该分类共有多少条记录
		public int countByClassification(String classification);
		
		//按照分类分页查询
		public List<Writings> PagingQueryByClassification(int pageNumber,String classification);
		
		
		
		
		
}

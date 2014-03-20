package com.helezs.managePojo;

import com.helezs.pojo.Photo;

public interface ManagePhotoDAO {
	//添加
	public boolean addPhoto(Photo photo);
	//查询根据id
	public Photo searchById(String id);
}

package com.helezs.action.manageItem;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.helezs.managePojo.ManageWritingsDAO;
import com.helezs.pojo.Writings;
import com.helezs.util.CommonIdentity;
@Controller
@Scope("prototype")
public class ManageWritingsAction {
	private String id;
	private String title;
	private String content;
	private String classification;
	private boolean top;
	private List<Writings> writingsByClassification;
	private Writings writings;
	private boolean flag;
	@Resource
	private ManageWritingsDAO manageWritings;

	// 添加
	public String addOne() {
		Writings w = new Writings();
		String id = UUID.randomUUID().toString().replace("-", "");
		w.setId(id);
		w.setTitle(title);
		w.setContent(content);
		w.setClassification(classification);
		w.setTop(top);
		try {
			flag = manageWritings.addWritings(w);
			return "doSuccess";
		} catch (Exception e) {
			e.printStackTrace();
			return CommonIdentity.ADD_FALSE;
		}
	}

	// 按分类查询
	public String listByClassification() {
		try {
			writingsByClassification = manageWritings
					.searchWritingsByClassification(classification);
			return "listByClassification";
		} catch (Exception e) {
			e.printStackTrace();
			return CommonIdentity.QUERY_EXCEPTION;
		}
	}

	// 查询单条信息
	public String searchById() {
		try {
			writings = manageWritings.searchWritingsWithId(id);
			return "searchById";
		} catch (Exception e) {
			e.printStackTrace();
			return CommonIdentity.QUERY_EXCEPTION;
		}
	}

	// 删除单条信息
	public String delById() {
		try {
			manageWritings.delWritings(id);
			flag = true;
			return "doSuccess";
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
			return CommonIdentity.QUERY_EXCEPTION;
		}
	}

	//更新一条信息
	public String updateById(){
		try{
			Writings w = new Writings();
			w.setId(id);
			w.setTitle(title);
			w.setContent(content);
			w.setClassification(classification);
			w.setTop(top);
			flag = manageWritings.updateWritings(w);
		}catch(Exception e){
			e.printStackTrace();
			flag = false;
		}
		return "doSuccess";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getClassification() {
		return classification;
	}

	public void setClassification(String classification) {
		this.classification = classification;
	}

	public boolean getTop() {
		return top;
	}

	public void setTop(boolean top) {
		this.top = top;
	}

	public List<Writings> getWritingsByClassification() {
		return writingsByClassification;
	}

	public void setWritingsByClassification(
			List<Writings> writingsByClassification) {
		this.writingsByClassification = writingsByClassification;
	}

	public Writings getWritings() {
		return writings;
	}

	public void setWritings(Writings writings) {
		this.writings = writings;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

}

package com.helezs.action.manageItem;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.appengine.api.datastore.Text;
import com.helezs.managePojo.ManageWritingsDAO;
import com.helezs.pojo.Writings;

@Controller("manageWritingsAction")
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

	@RequestMapping(value = "manageIndex", method = RequestMethod.GET)
	public String manageIndex() {
		return "manageItem/manageItem";
	}

	// 添加
	@RequestMapping(value = "toaddWritings", method = RequestMethod.POST)
	@ResponseBody
	public String toaddWritings(String title, String content,
			String classification, boolean top) {
		Writings w = new Writings();
		String id = UUID.randomUUID().toString().replace("-", "");
		w.setId(id);
		w.setTitle(title);
		Text t = new Text(content);
		w.setContent(t);
		w.setClassification(classification);
		w.setTop(top);
		try {
			flag = manageWritings.addWritings(w);
			if (flag == true) {
				return "true";
			} else {
				return "";// false
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "";// false
		}
	}

	// 按分类查询
	@RequestMapping(value = "tolistByClassification", method = RequestMethod.POST)
	@ResponseBody
	public Map tolistByClassification(String classification) {
		try {
			writingsByClassification = manageWritings
					.searchWritingsByClassification(classification);
			Map map = new HashMap();
			map.put("writings",writingsByClassification);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 查询单条信息
	@RequestMapping(value = "tosearchWritingsById", method = RequestMethod.POST)
	@ResponseBody
	public Map tosearchWritingsById(String id) {
		try {
			writings = manageWritings.searchWritingsWithId(id);
			Map map = new HashMap();
			map.put("writings", writings);
			map.put("content", writings.getContent().getValue());
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 删除单条信息
	@RequestMapping(value = "todelWritingsById", method = RequestMethod.POST)
	@ResponseBody
	public String todelWritingsById(String id) {
		try {
			flag = manageWritings.delWritings(id);
			if (flag == true) {
				return "true";
			} else {
				return "";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	// 更新一条信息
	@RequestMapping(value = "toupdateWritingsById", method = RequestMethod.POST)
	@ResponseBody
	public String toupdateWritingsById(String id, String title, String content,
			String classification, boolean top) {
		try {
			Writings w = new Writings();
			w.setId(id);
			w.setTitle(title);
			w.setContent(new Text(content));
			w.setClassification(classification);
			w.setTop(top);
			flag = manageWritings.updateWritings(w);
			if (flag == true) {
				return "true";
			} else {
				return "";// false
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "";// false
		}
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

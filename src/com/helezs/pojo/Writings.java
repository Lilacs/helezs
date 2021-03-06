package com.helezs.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Text;

@PersistenceCapable
public class Writings implements Serializable {
	// id
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private String id;
	// 作者
	@Persistent
	private String author;
	// 创建时间
	@Persistent
	private long creationTime;
	private Date creationTimeD;
	// 修改时间
	@Persistent
	private long modifyTime;
	private Date modifyTimeD;
	// 标题
	@Persistent
	private String title;
	// 类型(鉴别属于哪一个模块)
	// knowledgeDecoration 装修知识、decorationCase 装修案例、events 活动推广、designTeam
	// 设计团队、contact 联系方式
	@Persistent
	private String classification;
	// 内容
	@Persistent
	private Text content;
	// 是否置顶
	@Persistent
	private boolean isTop;

	// 户型
	@Persistent
	private String apartmentLayout;

	// 面积
	@Persistent
	private String area;

	// 风格
	@Persistent
	private String style;

	// 副标题
	@Persistent
	private String Subtitle;
	
	// 阅读次数
	@Persistent
	private long Count = 0;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public long getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(long creationTime) {
		this.creationTime = creationTime;
	}

	public long getModifyTime() {
		return modifyTime;
	}

	public void setModifyTime(long modifyTime) {
		this.modifyTime = modifyTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getClassification() {
		return classification;
	}

	public void setClassification(String classification) {
		this.classification = classification;
	}

	public Text getContent() {
		return content;
	}

	public void setContent(Text content) {
		this.content = content;
	}

	public boolean isTop() {
		return isTop;
	}

	public void setTop(boolean isTop) {
		this.isTop = isTop;
	}

	public Date getCreationTimeD() {
		return creationTimeD;
	}

	public void setCreationTimeD(Date creationTimeD) {
		this.creationTimeD = creationTimeD;
	}

	public Date getModifyTimeD() {
		return modifyTimeD;
	}

	public void setModifyTimeD(Date modifyTimeD) {
		this.modifyTimeD = modifyTimeD;
	}

	public String getApartmentLayout() {
		return apartmentLayout;
	}

	public void setApartmentLayout(String apartmentLayout) {
		this.apartmentLayout = apartmentLayout;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getSubtitle() {
		return Subtitle;
	}

	public void setSubtitle(String subtitle) {
		Subtitle = subtitle;
	}

	public long getCount() {
		return Count;
	}

	public void setCount(long count) {
		Count = count;
	}

}

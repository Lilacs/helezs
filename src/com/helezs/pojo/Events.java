package com.helezs.pojo;

import java.util.Date;

/**
 * 活动新闻
 * 
 * @author lilacs
 * 
 */
public class Events {
	// 标题
	private String title;
	// 作者
	private String author;
	// 时间
	private Date time;
	// 内容
	private String content;
	// 图片
	private String pic;
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

}

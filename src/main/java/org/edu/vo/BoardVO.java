package org.edu.vo;

import java.util.Date;

public class BoardVO {

	/*@author 신숙정 
	 * 게시판에서 사용되는 데이터 입출력 클래스 */
	
		// 멤버변수 선언
	private	Integer bno; //int null 오류
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date update_Date;
	
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regdate="
				+ regdate + ", update_Date=" + update_Date + ", view_count=" + view_count + ", reply_count="
				+ reply_count + "]";
	}
	
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdate_Date() {
		return update_Date;
	}
	public void setUpdate_Date(Date update_Date) {
		this.update_Date = update_Date;
	}
	public Integer getView_count() {
		return view_count;
	}
	public void setView_count(Integer view_count) {
		this.view_count = view_count;
	}
	public Integer getReply_count() {
		return reply_count;
	}
	public void setReply_count(Integer reply_count) {
		this.reply_count = reply_count;
	}
	private Integer view_count;
	private Integer reply_count;
	

}

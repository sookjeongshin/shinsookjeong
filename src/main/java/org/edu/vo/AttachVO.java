package org.edu.vo;

import java.util.Date;

public class AttachVO {
private String save_file_name;
private String real_file_name;
private Integer bno;
private Date reg_Date;
public String getSave_file_name() {
	return save_file_name;
}
@Override
public String toString() {
	return "AttachVO [save_file_name=" + save_file_name + ", real_file_name=" + real_file_name + ", bno=" + bno
			+ ", reg_Date=" + reg_Date + "]";
}
public void setSave_file_name(String save_file_name) {
	this.save_file_name = save_file_name;
}
public String getReal_file_name() {
	return real_file_name;
}
public void setReal_file_name(String real_file_name) {
	this.real_file_name = real_file_name;
}
public Integer getBno() {
	return bno;
}
public void setBno(Integer bno) {
	this.bno = bno;
}
public Date getReg_Date() {
	return reg_Date;
}
public void setReg_Date(Date reg_Date) {
	this.reg_Date = reg_Date;
}

}

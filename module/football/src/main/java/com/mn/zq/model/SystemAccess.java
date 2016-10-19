package com.mn.zq.model;

import java.util.Date;

public class SystemAccess {

	private String uuid;
	private String ip;
	private String uri;
	private Date accessDateTime;
	
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getUri() {
		return uri;
	}
	public void setUri(String uri) {
		this.uri = uri;
	}
	public Date getAccessDateTime() {
		return accessDateTime;
	}
	public void setAccessDateTime(Date accessDateTime) {
		this.accessDateTime = accessDateTime;
	}
}

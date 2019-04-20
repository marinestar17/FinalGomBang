package com.project.GomBang.VO;

public class CkEditor {
	private String uploaded;
	private String fileName;
	private String url;
	public CkEditor() {
		super();
	}
	public CkEditor(String uploaded, String fileName, String url) {
		super();
		this.uploaded = uploaded;
		this.fileName = fileName;
		this.url = url;
	}
	public String getUploaded() {
		return uploaded;
	}
	public void setUploaded(String uploaded) {
		this.uploaded = uploaded;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "CkEditor [uploaded=" + uploaded + ", fileName=" + fileName + ", url=" + url + "]";
	}
	
	
}

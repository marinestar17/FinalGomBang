package com.project.GomBang.VO;

public class Image {
	private int image_Seq;
	private int forSale_Seq;
	private String originName;
	private String saveName;
	
	
	public Image() {
		super();
	}


	public Image(int image_Seq, int forSale_Seq, String originName, String saveName) {
		super();
		this.image_Seq = image_Seq;
		this.forSale_Seq = forSale_Seq;
		this.originName = originName;
		this.saveName = saveName;
	}


	public int getImage_Seq() {
		return image_Seq;
	}


	public void setImage_Seq(int image_Seq) {
		this.image_Seq = image_Seq;
	}


	public int getForSale_Seq() {
		return forSale_Seq;
	}


	public void setForSale_Seq(int forSale_Seq) {
		this.forSale_Seq = forSale_Seq;
	}


	public String getOriginName() {
		return originName;
	}


	public void setOriginName(String originName) {
		this.originName = originName;
	}


	public String getSaveName() {
		return saveName;
	}


	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}


	@Override
	public String toString() {
		return "Image [image_Seq=" + image_Seq + ", forSale_Seq=" + forSale_Seq + ", originName=" + originName
				+ ", saveName=" + saveName + "]";
	}

	
	
	
	
}

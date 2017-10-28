package com.vo;

import com.page.OrderCondition;


public class Product {
	private int pid;
	private String pname;
	private double price;
	private int pingjiaSum;
	private String dianpuName;
	private String productListLargeImage;
	private String productListSmallImage1;
	private String productListSmallImage2;
	private String productListSmallImage3;
	private String pdesc;
	private int productSum;
	private String detailLargeImg;
	private String detailSmallImg1;
	private String detailSmallImg2;
	private String detailSmallImg3;
	private String detailSmallImg4;
	private String detailSmallImg5;
	private Integer onsale;
	private String shoppingCarImg;
	private Category2 category2;
	
	private OrderCondition orderConditionObj = new OrderCondition();

	public OrderCondition getOrderConditionObj() {
		return orderConditionObj;
	}

	public void setOrderConditionObj(OrderCondition orderConditionObj) {
		this.orderConditionObj = orderConditionObj;
	}
	
	private int shoppingSum;
	
	public int getShoppingSum() {
		return shoppingSum;
	}

	public void setShoppingSum(int shoppingSum) {
		this.shoppingSum = shoppingSum;
	}

	public String getShoppingCarImg() {
		return shoppingCarImg;
	}

	public void setShoppingCarImg(String shoppingCarImg) {
		this.shoppingCarImg = shoppingCarImg;
	}

	public Category2 getCategory2() {
		return category2;
	}

	public void setCategory2(Category2 category2) {
		this.category2 = category2;
	}

	public Integer getOnsale() {
		return onsale;
	}

	public void setOnsale(Integer onsale) {
		this.onsale = onsale;
	}

	private Integer cid;

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getPingjiaSum() {
		return pingjiaSum;
	}

	public void setPingjiaSum(int pingjiaSum) {
		this.pingjiaSum = pingjiaSum;
	}

	public String getDianpuName() {
		return dianpuName;
	}

	public void setDianpuName(String dianpuName) {
		this.dianpuName = dianpuName;
	}

	public String getProductListLargeImage() {
		return productListLargeImage;
	}

	public void setProductListLargeImage(String productListLargeImage) {
		this.productListLargeImage = productListLargeImage;
	}

	public String getProductListSmallImage1() {
		return productListSmallImage1;
	}

	public void setProductListSmallImage1(String productListSmallImage1) {
		this.productListSmallImage1 = productListSmallImage1;
	}

	public String getProductListSmallImage2() {
		return productListSmallImage2;
	}

	public void setProductListSmallImage2(String productListSmallImage2) {
		this.productListSmallImage2 = productListSmallImage2;
	}

	public String getProductListSmallImage3() {
		return productListSmallImage3;
	}

	public void setProductListSmallImage3(String productListSmallImage3) {
		this.productListSmallImage3 = productListSmallImage3;
	}

	public String getPdesc() {
		return pdesc;
	}

	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}

	public int getProductSum() {
		return productSum;
	}

	public void setProductSum(int productSum) {
		this.productSum = productSum;
	}

	public String getDetailLargeImg() {
		return detailLargeImg;
	}

	public void setDetailLargeImg(String detailLargeImg) {
		this.detailLargeImg = detailLargeImg;
	}

	public String getDetailSmallImg1() {
		return detailSmallImg1;
	}

	public void setDetailSmallImg1(String detailSmallImg1) {
		this.detailSmallImg1 = detailSmallImg1;
	}

	public String getDetailSmallImg2() {
		return detailSmallImg2;
	}

	public void setDetailSmallImg2(String detailSmallImg2) {
		this.detailSmallImg2 = detailSmallImg2;
	}

	public String getDetailSmallImg3() {
		return detailSmallImg3;
	}

	public void setDetailSmallImg3(String detailSmallImg3) {
		this.detailSmallImg3 = detailSmallImg3;
	}

	public String getDetailSmallImg4() {
		return detailSmallImg4;
	}

	public void setDetailSmallImg4(String detailSmallImg4) {
		this.detailSmallImg4 = detailSmallImg4;
	}

	public String getDetailSmallImg5() {
		return detailSmallImg5;
	}

	public void setDetailSmallImg5(String detailSmallImg5) {
		this.detailSmallImg5 = detailSmallImg5;
	}


	@Override
	public String toString() {
		return "Product [pid=" + pid + ", pname=" + pname + ", price=" + price
				+ ", pingjiaSum=" + pingjiaSum + ", dianpuName=" + dianpuName
				+ ", pdesc=" + pdesc + ", productSum=" + productSum
				+ ", onsale=" + onsale + ", cid=" + cid + "]";
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	@Override
	public boolean equals(Object obj) {
		if(obj.getClass() == Product.class){//类型相同
			if(((Product)obj).getPid() == this.getPid()){//自定义相等规则，id相同
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}
		
	}

}

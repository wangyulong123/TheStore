package com.util;

//产品的字典类
public class UserDictionary {

	
	public static String onsaleIntToStr(int onsale){
		String strOnsale= "";
		
		if(onsale==0){
			strOnsale = "未锁定";
		}else if(onsale==1){
			strOnsale = "锁定";
		}
		
		return strOnsale;
	}
	
	
	public static Integer onsaleStrToInt(String onsale){
		Integer intOnsale = null;
		
		if("未锁定".equals(onsale)){
			intOnsale = 0;
		}else if("锁定".equals(onsale)){
			intOnsale = 1;
		}
		
		return intOnsale;
	}
}
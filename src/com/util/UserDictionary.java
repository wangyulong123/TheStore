package com.util;

//��Ʒ���ֵ���
public class UserDictionary {

	
	public static String onsaleIntToStr(int onsale){
		String strOnsale= "";
		
		if(onsale==0){
			strOnsale = "δ����";
		}else if(onsale==1){
			strOnsale = "����";
		}
		
		return strOnsale;
	}
	
	
	public static Integer onsaleStrToInt(String onsale){
		Integer intOnsale = null;
		
		if("δ����".equals(onsale)){
			intOnsale = 0;
		}else if("����".equals(onsale)){
			intOnsale = 1;
		}
		
		return intOnsale;
	}
}
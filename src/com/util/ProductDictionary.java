package com.util;

//��Ʒ���ֵ���
public class ProductDictionary {

	/**
	 * 
	 *��˾: ���ű����ѧԺ
	 *����: ������
	 *ʱ��: 2016��8��29������1:43:56
	 *����: onsale ����------>����
	 *@param intOnsale ��Ʒ��״̬  0��ʾ�¼�  1��ʾ�ϼ�
	 *@return onsale״̬��Ӧ�����ĺ���   �����0  �����ַ���"�¼�"  �����1 ���� "�ϼ�"
	 */
	public static String onsaleIntToStr(int onsale){
		String strOnsale= "";
		
		if(onsale==0){
			strOnsale = "�¼�";
		}else if(onsale==1){
			strOnsale = "�ϼ�";
		}
		
		return strOnsale;
	}
	
	/**
	 * 
	 *��˾: ���ű����ѧԺ
	 *����: ������
	 *ʱ��: 2016��8��29������1:43:56
	 *����: onsale ����------>����
	 *@param intOnsale    �����"�¼�"  ����0  �����"�ϼ�" ���� 1
	 *@return ��Ʒ��״̬  0��ʾ�¼�  1��ʾ�ϼ� 
	 */
	public static Integer onsaleStrToInt(String onsale){
		Integer intOnsale = null;
		
		if("�¼�".equals(onsale)){
			intOnsale = 0;
		}else if("�ϼ�".equals(onsale)){
			intOnsale = 1;
		}
		
		return intOnsale;
	}
}

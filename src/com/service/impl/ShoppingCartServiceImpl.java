package com.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.service.inter.ShoppingCartService;
import com.vo.Product;

public class ShoppingCartServiceImpl implements ShoppingCartService{

	@Override
	public void addToCart(HttpSession session,Product product) {
		
		List<Product> list = (List<Product>)session.getAttribute("shoppingCart");
		if(list==null){
			//��һ������
			System.out.println("��һ������");
			list = new ArrayList<Product>();
	
			product.setShoppingCarSum(1);
			list.add(product);//���빺�ﳵ
			
		}else{
			//�ڶ�������
			System.out.println("�ڶ�������");
			int pid = product.getPid();
			
			boolean ifBeforeBuy = false;
			
			//�鿴һ�� ��ǰ �Ƿ� ���
			for(Product oldProduct:list){
				
				if(oldProduct.getPid()==pid){//�����ǰ����������
					//����+1
					System.out.println("����+1");
					
					int shoppingCarSum = oldProduct.getShoppingCarSum();
					oldProduct.setShoppingCarSum(shoppingCarSum + 1);
					
					ifBeforeBuy = true;
					
					break;
					
					
				}
				
			}
			
			if(!ifBeforeBuy){//֮ǰ���û���
				System.out.println("֮ǰû���");
				product.setShoppingCarSum(1);
				list.add(product);//���빺�ﳵ
			}
			
		}
		
		
		session.setAttribute("shoppingCart", list);
		
		
	}

}

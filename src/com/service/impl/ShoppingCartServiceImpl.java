package com.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
			System.out.println("���ﳵ����-----"+product.getShoppingSum());
			list = new ArrayList<Product>();
			if(product.getShoppingSum()==0){
				product.setShoppingSum(1);
				
			}
			
			list.add(product);//���빺�ﳵ
			for (Product product2 : list) {
				System.out.println("list��"+product2.getShoppingSum());
			}
		}else{
			//�ڶ�������
			System.out.println("�ڶ�������");
			int pid = product.getPid();
			
			boolean ifBeforeBuy = false;
			
			//�鿴һ�� ��ǰ �Ƿ� ���
			for(Product oldProduct:list){
				
				if(oldProduct.getPid()==pid){//�����ǰ����������
					//����+������������				
					int shoppingCarSum = oldProduct.getShoppingSum();
					oldProduct.setShoppingSum(shoppingCarSum + product.getShoppingSum());
					
					ifBeforeBuy = true;
					
					break;
					
					
				}
				
			}
			
			if(!ifBeforeBuy){//֮ǰ���û���
				System.out.println("֮ǰû���");
				product.setShoppingSum(1);
				list.add(product);//���빺�ﳵ
			}
			
		}
		session.setAttribute("shoppingCart", list);
	}

	@Override
	public void delete(HttpSession session, Product product) {
		List<Product> list = (List<Product>)session.getAttribute("shoppingCart");
		List<Product> deleteList = new ArrayList<Product>();
		int pid = product.getPid();
		
		for(Product oldProduct:list){
			if(pid==oldProduct.getPid()){
				product.setShoppingSum(0);
				//java.util.ConcurrentModificationException
				//�����ڱ�����ʱ��ɾ��
				deleteList.add(product);
				
				System.out.println("ɾ����"+list.size());
			}
		}
		
		list.remove(product);
		
		session.setAttribute("shoppingCart", list);
	}
	
	

}

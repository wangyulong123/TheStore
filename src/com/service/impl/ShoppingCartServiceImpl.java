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
			//第一次买东西
			System.out.println("第一次买东西");
			System.out.println("购物车数量-----"+product.getShoppingSum());
			list = new ArrayList<Product>();
			if(product.getShoppingSum()==0){
				product.setShoppingSum(1);
				
			}
			
			list.add(product);//加入购物车
			for (Product product2 : list) {
				System.out.println("list中"+product2.getShoppingSum());
			}
		}else{
			//第二次买东西
			System.out.println("第二次买东西");
			int pid = product.getPid();
			
			boolean ifBeforeBuy = false;
			
			//查看一下 以前 是否 买过
			for(Product oldProduct:list){
				
				if(oldProduct.getPid()==pid){//如果以前买过这个东西
					//数量+新增购买数量				
					int shoppingCarSum = oldProduct.getShoppingSum();
					oldProduct.setShoppingSum(shoppingCarSum + product.getShoppingSum());
					
					ifBeforeBuy = true;
					
					break;
					
					
				}
				
			}
			
			if(!ifBeforeBuy){//之前如果没买过
				System.out.println("之前没买过");
				product.setShoppingSum(1);
				list.add(product);//加入购物车
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
				//不能在遍历的时候删除
				deleteList.add(product);
				
				System.out.println("删除后："+list.size());
			}
		}
		
		list.remove(product);
		
		session.setAttribute("shoppingCart", list);
	}
	
	

}

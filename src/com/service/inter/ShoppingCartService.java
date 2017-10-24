package com.service.inter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.vo.Product;

public interface ShoppingCartService {

	//把商品加入购物车
	public void addToCart(HttpSession session,Product product);
	//删除购物车中的商品
	public void delete(HttpSession session,Product product);
}

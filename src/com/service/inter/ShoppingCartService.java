package com.service.inter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.vo.Product;

public interface ShoppingCartService {

	//����Ʒ���빺�ﳵ
	public void addToCart(HttpSession session,Product product);
	//ɾ�����ﳵ�е���Ʒ
	public void delete(HttpSession session,Product product);
}

package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.page.OrderCondition;
import com.page.PageInfo;
import com.service.impl.Category2ServiceImpl;
import com.service.impl.CategoryServiceImpl;
import com.service.impl.ProductServiceImpl;
import com.service.impl.UserProductServiceImpl;
import com.service.inter.Category2Service;
import com.service.inter.CategoryService;
import com.service.inter.ProductService;
import com.vo.Category;
import com.vo.Category2;
import com.vo.Product;

public class PhonesServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");

		String action = request.getParameter("action");
		if ("getProductListByCategory".equals(action)) {
			this.getProductListByCategory(request, response);
		} else if ("getOnePhone".equals(action)) {
			this.getOnePhone(request, response);
		} else if ("getPageByQuery".equals(action)) {
			this.getPageByQuery(request, response);
		} else if ("getProductByPrice".equals(action)) {
			this.getProductByPrice(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

	public void getProductByPrice(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in PhonesServlet--->getPageByPrice");
		// һ.�������
		String low = request.getParameter("low");
		 System.out.println("low=" + low);
		String high = request.getParameter("high");
		// System.out.println(high);
		String target = "";
		String cid = request.getParameter("cid");
		String requestPage = request.getParameter("requestPage");
		System.out.println("requestPage=" + requestPage);
		if (requestPage == null) {
			requestPage = "1";
		}
		String orderCondition = request.getParameter("orderCondition");
		//System.out.println("orderCondition=" + orderCondition);

		String ascOrDesc = request.getParameter("ascOrDesc");
		//System.out.println("ascOrDesc=" + ascOrDesc);
		// ��.����ҵ���߼�
		PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage), 10);

		// ����ѯ������ѯ �����ѯ����ܹ��ж�������¼
		UserProductServiceImpl service1 = new UserProductServiceImpl();

		Product product = new Product();

		OrderCondition orderConditionObj = new OrderCondition();
		// ������������
		if (orderCondition != null && !orderCondition.trim().equals("")) {
			orderConditionObj.setOrderCondition(orderCondition);
			orderConditionObj.setAscOrDesc(ascOrDesc);
			product.setOrderConditionObj(orderConditionObj);
			product.setCid(Integer.parseInt(cid));
		}
		try {
			int totalRecordSum = service1
					.getPhonesSumBySearchCondition(product,low,high);
			pageInfo.setTotalRecordCount(totalRecordSum);

			UserProductServiceImpl service2 = new UserProductServiceImpl();
			List<Product> list = service2.getPhonesPageByQuery(product,low,high, pageInfo);

			// ��.ת����ͼ
			target = "/WEB-INF/jsp/user/phones.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("orderConditionObj", orderConditionObj);
		} catch (Exception e) {
		}

		request.getRequestDispatcher(target).forward(request, response);
	}

	public void getPageByQuery(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in getPageByQuery");
		String cid = request.getParameter("cid");

		System.out.println("cid=" + cid);
		if (cid != null && !cid.trim().equals("")) {
			// ��˵�����Ʒ�����ʱ�� ʹ�����
			System.out.println("��˵�������");
			this.getProductListByCategory(request, response);
		} else {
			// ������ʹ��
			System.out.println("������ʹ��");
			this.getPageByQuery2(request, response);
		}
	}

	public void getProductListByCategory(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out.println("in UsreProductServlet getProductListByCategory!!!");
		String target = "";
		// һ.�������
		String cid = request.getParameter("cid");// 62 ���ֻ�
		System.out.println(cid);

		String requestPage = request.getParameter("requestPage");
		System.out.println(requestPage);

		String orderCondition = request.getParameter("orderCondition");
		String ascOrDesc = request.getParameter("ascOrDesc");

		OrderCondition orderConditionObj = new OrderCondition();

		if (orderCondition != null && !orderCondition.trim().equals("")) {
			orderConditionObj.setOrderCondition(orderCondition);
			orderConditionObj.setAscOrDesc(ascOrDesc);
		}

		// ��.����ҵ���߼�
		PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage), 10);// ÿҳ��ʾ8����¼

		List<Product> list;
		try {
			// ��ѯָ����Ʒ������ �ܹ��ж�������Ʒ��¼
			UserProductServiceImpl service1 = new UserProductServiceImpl();

			int totalRecordSum = service1.getTotalRecordSumByCategory(cid);
			pageInfo.setTotalRecordCount(totalRecordSum);
			// ������Ʒ���� ��ѯ ��Ʒ
			UserProductServiceImpl service = new UserProductServiceImpl();
			list = service.getAllByPageByCategory(pageInfo, cid,
					orderConditionObj);
			// ��.ת����ͼ
			System.out.println(list);
			request.setAttribute("list", list);
			request.setAttribute("cid", cid);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("orderConditionObj", orderConditionObj);
			target = "/WEB-INF/jsp/user/phones.jsp";
		} catch (Exception e) {
			target = "/WEB-INF/msg.jsp";
			e.printStackTrace();
		}

		request.getRequestDispatcher(target).forward(request, response);
	}

	public void getPageByQuery2(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		System.out.println("in UserProductServlet--->getPageByQuery1234");
		String target = "";

		// һ.�������
		String requestPage = request.getParameter("requestPage");

		System.out.println("requestPage=" + requestPage);
		if (requestPage == null) {
			requestPage = "1";
		}

		String searchCondition = request.getParameter("searchCondition");
			System.out.println("searchCondition=" + searchCondition);
			
			String orderCondition = request.getParameter("orderCondition");
			System.out.println("orderCondition=" + orderCondition);
			
			String ascOrDesc = request.getParameter("ascOrDesc");
			System.out.println("ascOrDesc=" + ascOrDesc);
			// ��.����ҵ���߼�
			PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage), 10);

			// ����ѯ������ѯ �����ѯ����ܹ��ж�������¼
			UserProductServiceImpl service1 = new UserProductServiceImpl();

			Product product = new Product();

			// ����ǰ���Ʒ�������Ʋ�ѯ ��Ҫ�Ѵ���������Ʒ��������ת����cid
			Category2Service service = new Category2ServiceImpl();
			
			try {
				Category2 category  = service.getCategoryByName(searchCondition);
				if (searchCondition != null && !searchCondition.trim().equals("")) {
					product.setPname(searchCondition);
					product.setDianpuName(searchCondition);

					if (category != null) {
						product.setCid(category.getCid());
					}
				}

				OrderCondition orderConditionObj = new OrderCondition();
				//������������
				if(orderCondition!=null&&!orderCondition.trim().equals("")){
					orderConditionObj.setOrderCondition(orderCondition);
					orderConditionObj.setAscOrDesc(ascOrDesc);
					product.setOrderConditionObj(orderConditionObj);
				}
				
				int totalRecordSum = service1
						.getTotalRecordSumBySearchCondition(product);
				pageInfo.setTotalRecordCount(totalRecordSum);

				UserProductServiceImpl service2 = new UserProductServiceImpl();
				List<Product> list = service2.getPageByQuery(product, pageInfo);

				// ��.ת����ͼ
				target = "/WEB-INF/jsp/user/phones.jsp";
				request.setAttribute("list", list);
				request.setAttribute("pageInfo", pageInfo);
				request.setAttribute("searchCondition", searchCondition);
				request.setAttribute("orderConditionObj", orderConditionObj);
			} catch (Exception e) {
				request.setAttribute("msg", e.getMessage());
				e.printStackTrace();
				target = "/WEB-INF/msg.jsp";
			}
			request.getRequestDispatcher(target).forward(request, response);	}

	public void getOnePhone(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 1.�������
		String pid = request.getParameter("pid");
		String target = "";
		ProductService service = new ProductServiceImpl();
		try {
			Product product = new Product();
			product = service.getProductById(pid);
			request.setAttribute("product", product);
			target = "/WEB-INF/jsp/user/singlePhone.jsp";
		} catch (Exception e) {
			target = "/WEB-INF/msg.jsp";
			request.setAttribute("msg", "��ѯ��һ�ֻ���Ʒʧ��");
			e.printStackTrace();
		}
		// 3.ת����ͼ
		request.getRequestDispatcher(target).forward(request, response);
	}
}

package model;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustUserDao;
import dto.CustUserDto;
@WebServlet("/custuserdetail")
public class CustUserDetail extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}
	public void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		System.out.println("id:" + id);
		
		CustUserDao dao = CustUserDao.getInstance();
		CustUserDto dto = dao.getDetail(id);
		System.out.println(dto.toString());
		
		req.setAttribute("custdetail", dto); 	//짐싸
		forward("custuserdetail.jsp", req, resp);	// 잘가
	}
	
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(link);
		dispatch.forward(req, resp);
	}
}

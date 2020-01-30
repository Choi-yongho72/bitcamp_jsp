package model;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustUserDao;
import dto.CustUserDto;
@WebServlet("/custusersearch")
public class CustUserSearch extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}
	public void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String selType = req.getParameter("selType");
		String fword = req.getParameter("fword");
		
		CustUserDao dao = CustUserDao.getInstance();
		List<CustUserDto> list =  dao.searchCustUsers(selType, fword);
		
		req.setAttribute("custlist", list); 	//짐싸
		forward("custsearch.jsp", req, resp);	// 잘가
		
	}
	
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(link);
		dispatch.forward(req, resp);
	}
	
}

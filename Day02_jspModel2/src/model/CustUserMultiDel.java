package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustUserDao;
@WebServlet("/muldel")
public class CustUserMultiDel extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}

	public void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String delArr[] = req.getParameterValues("delck");
		
		CustUserDao dao = CustUserDao.getInstance();
		boolean isS = dao.deleteCustUsers(delArr);
		resp.sendRedirect("muldel.jsp?isS="+isS);
	}
}

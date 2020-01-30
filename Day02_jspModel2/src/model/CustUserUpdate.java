package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustUserDao;
import dto.CustUserDto;
@WebServlet("/custuserupdate")
public class CustUserUpdate extends HttpServlet {
	String ex_id;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}
	public void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String command = req.getParameter("command");
		
		if(command.equals("update")) {
			this.ex_id = req.getParameter("id");
			resp.sendRedirect("custupdate.jsp?id="+ex_id);
			
		}else if(command.equals("updateAf")) {
			
			String id = req.getParameter("id");
			String address =req.getParameter("address");
			
			CustUserDao dao = CustUserDao.getInstance();
			boolean isS = dao.updateCustUser(id, address);
			resp.sendRedirect("Ufinding.jsp?isU="+isS+"&exid="+ex_id);
		}
	}
}

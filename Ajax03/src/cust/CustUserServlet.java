package cust;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.CustUserDto;

public class CustUserServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		System.out.println("아이디는 " + id);
		System.out.println("비번은 " + pwd);
		
		// 전송 data
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("title", "사과");
		
		List<CustUserDto> list = new ArrayList<CustUserDto>();
		list.add(new CustUserDto(101, "최용호"));
		list.add(new CustUserDto(102, "정원준"));
		
		map.put("list", list);
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
}

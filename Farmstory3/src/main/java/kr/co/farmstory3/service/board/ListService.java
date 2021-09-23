package kr.co.farmstory3.service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory3.service.CommonService;

public class ListService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		String includeFile = "./_aside"+group+".jsp";
		
		req.setAttribute("includeFile", includeFile);
		req.setAttribute("cate", cate);
		return "/board/list.jsp";
	}

}
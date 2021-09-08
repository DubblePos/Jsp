package service.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import model.CommonService;
import vo.UserVo;

public class ListService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		List<UserVo> users = UserDao.getInstance().selectUsers();
		
		// 컴포넌트간의 데이터 공유(View에서 해당 list를 참조해서 출력해야 하기 때문에)
		req.setAttribute("users", users);
		
		return "/user/list.jsp";
	}

}

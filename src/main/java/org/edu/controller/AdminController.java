package org.edu.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.edu.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
//스프링에서 사용가능한 클래스를 빈(커피bean)라고 하고, @controller클래스를 사용하면 됨.
@Controller
public class AdminController {
	
	@RequestMapping(value="/admin/board/board_list",method=RequestMethod.GET)
	public String board_list()throws Exception {
		return "admin/board/board_list";
	}
	
	@RequestMapping(value="admin/member/member_write",method=RequestMethod.POST)
	public String member_write_do(@RequestParam("user_name") String user_name) throws Exception{
		//아래 GET방식 폼출력화면에서 데이터 전송받은 내용을 처리하는 바인딩.
		//DB베이스 입력/출력/삭제/수정 처리-다음에...
		return "redirect:/admin/member/member_list";//절대경로로 처리 후 이동할 URL주소를 여기에 반환
		
	}
@RequestMapping(value="/admin/member_write", method=RequestMethod.GET)
	public String member_write( ) throws Exception {
	return "admin/member/memeber_write";
}
	@RequestMapping(value="/admin/member/member_view", method=RequestMethod.GET)
public String member_view(@RequestParam("user_id") String user_id, Model model) throws Exception{
	model.addAttribute("user_id2", user_id + "<script>alert('메롱');</script>");
		return "admin/member/member_view";
}

	@RequestMapping(value="/admin/member/member_list", method=RequestMethod.GET)
public String member_list(Model model) throws Exception {
	String[][]members = {
			{"admin","찐관리자","admin@abc.com","2020-12-04","ROLE_ADMIN"},
			{"user","일반사용자","user@abc.com","false","2020-12-04","ROLE_USER"}
	};
	MemberVO members_input = new MemberVO();
	
	members_input.setUser_id("admin");
	members_input.setUser_name("찐관리자");
	members_input.setEmail("admin@abc.com");
	members_input.setEnabled(true);
	Date toDay = new Date();
	members_input.setReg_date(toDay);
	members_input.setLevels("ROLE_ADMIN");
	members_input.setPoint(10);
	MemberVO[] members_array = new MemberVO[2];
	members_array[0] = members_input;
	members_array[1] = members_input;
//--------------------------------------------------
	List<MemberVO> member_list = Arrays.asList(members_array);
	model.addAttribute("members", members);
	return "admin/member/member_list";//member_list.jsp에 members변수명으로 데이터를 전송
}

//bind 묶는다 admin요청경로 url과 admin/home jsp묶기
	
	@RequestMapping(value="/admin",method=RequestMethod.GET)
	public String admin() throws Exception {
		return "admin/home";
		
		
	}
	
	
}

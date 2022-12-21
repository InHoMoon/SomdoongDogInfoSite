package somdoong.admin.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import somdoong.admin.dto.Admin;
import somdoong.admin.service.face.AdminService;
	 
@RequestMapping("/admin")
@Controller //관리자 관련 컨트롤러 빈 선언
public class AdminController { 
	
	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//서비스 객체
	@Autowired private AdminService adminService;
	
	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/login")
	public String loginProcess(Admin admin, HttpSession session) {
		logger.info("{}", admin);
		
		boolean loginResult = adminService.login(admin);
		logger.info("loginResult : {}", loginResult);
		
		if( loginResult ) {
			logger.info("로그인 성공");
			
			session.setAttribute("adminlogin", loginResult);
			session.setAttribute("adminid", admin.getAdminid());

			return "redirect:/admin/adminpage";
			
		} else {
			logger.info("로그인 실패");
			
			session.invalidate();
			
			return "redirect:/admin/login";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/admin/login";
	}
	
	@RequestMapping("/adminpage")
	public void main() {}
	
}

package somdoong.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import somdoong.member.dto.Sommember;
import somdoong.member.service.face.SommemberService;

@Controller
public class SommemberController {
	
	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//서비스 객체
	@Autowired private SommemberService smemberService;
	
	@RequestMapping("/member/main")
	public void main() {}
	
	@GetMapping("/member/login")
	public void login() {}
	
	@PostMapping("/member/login")
	public String loginProcess(Sommember smember, HttpSession session) {
		logger.info("{}", smember);
		
		boolean loginResult = smemberService.login(smember);
		logger.info("loginResult : {}", loginResult);
		
		if( loginResult ) {
			logger.info("로그인 성공");
			
			session.setAttribute("login", loginResult);
			session.setAttribute("userid", smember.getUserid());
			session.setAttribute("userno", smemberService.getUserno(smember));
			
			logger.info("userno : {}", session.getAttribute("userno"));
			
			return "redirect:/member/main";
			
		} else {
			logger.info("로그인 실패");
			
			session.invalidate();
			
			return "redirect:/member/login";
		}
		
	}

	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/member/main";
	}
	

}

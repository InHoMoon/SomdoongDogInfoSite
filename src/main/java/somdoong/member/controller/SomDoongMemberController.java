package somdoong.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import somdoong.member.dto.SomDoongMember;
import somdoong.member.service.face.SomDoongMemberService;

@Controller
@RequestMapping("/member")

public class SomDoongMemberController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SomDoongMemberService somDoongMemberService;

	@RequestMapping("/agree")
	public void agree() {
		logger.info("/member/agree 요청완료!");
		
	}
	
	@GetMapping("join")
	public void join() {
		logger.info("/member/join get 요청완료!");
	}
	
	
	@PostMapping("join")
	public String joinProcess(SomDoongMember joinproc) {
		
		logger.info("/member/join [POST] 요청완료!");
		logger.info("전달 파라미터{}",joinproc);
		
		
		somDoongMemberService.join(joinproc);
		
		return "redirect:/member/login";
	}
	
	@RequestMapping("joinsuc")
	public void joinsuc() {
		logger.info("/member/joinsuc 요청완료!");
	}
	
	@GetMapping("login")
	public void login() {
		
	}
	
	@PostMapping("login")
	public String loginProcess(SomDoongMember member, HttpSession session) {
		logger.info("{}", member);
		
		boolean loginResult = somDoongMemberService.login(member);
		logger.info("loginResult{}", loginResult);
		
		if(loginResult) {
			logger.info("로그인 성공");
			
			session.setAttribute("login", loginResult);
			session.setAttribute("userid", member.getUserid());
			session.setAttribute("username",somDoongMemberService.getUsername(member));
			
			return "redirect:/member/loginsuc";
			
		}else {
			logger.info("로그인 실패");
			
			session.invalidate();
			
			return"redirect:/member/login";
			
		}
		
		
	}
	
	@RequestMapping("loginsuc")
	public void loginsuc() {
		logger.info("/member/loginsuc 요청완료!");
	}
	
	
	//로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		logger.info("/login/logout");
		
		session.invalidate();
		
		return "redirect:/member/login";
	}

	
	@GetMapping("idfind")
	public void idfind() {
		
	}
	
	
	@GetMapping("pwfind")
	public void pwfind() {
		
	}
}
	
	
	


	

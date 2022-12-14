package somdoong.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import somdoong.member.dto.SomMember;
import somdoong.member.service.face.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MemberService memberService;
	
	@GetMapping("/login")
	public void login() {
		logger.info("/login [GET]");
	}
	
	@PostMapping("/login")
	public String loginProc(SomMember member, HttpSession session) {
		logger.info("/login [POST]");
		logger.info("{}", member);
		
		boolean login = memberService.login(member);
		logger.info("{}", login);
		
		if(login) {
			session.setAttribute("login", login);
			session.setAttribute("userid", member.getUserid());
		} else {
			session.invalidate();
			return "redirect:member/login";
		}
		
		return "redirect:/community/showlist";
	}

}

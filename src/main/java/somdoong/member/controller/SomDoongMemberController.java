package somdoong.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import somdoong.member.dto.SomDoongMember;
import somdoong.member.service.face.SomDoongMemberService;

@Controller
@RequestMapping("/member")

public class SomDoongMemberController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SomDoongMemberService somDoongMemberService;

	@RequestMapping("/agree")
	public void agree() {
		logger.info("/member/agree [GET] 요청완료!");
		
	}
	
	@GetMapping("join")
	public void join() {
		logger.info("/member/join [GET] 요청완료!");
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
		logger.info("login [GET] 요청완료!");
		
	}
	
	@PostMapping("login")
	public String loginProcess(SomDoongMember member, HttpSession session, HttpServletRequest request, HttpServletResponse response ) throws IOException {
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
			
			
				response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('아이디와 비밀번호를 확인해 주세요!'); history.go(-1);</script>");
	            out.flush(); 

	    	return null;
			
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

	
	@RequestMapping("idfind")
	public void idfind() {
		
	}
	
	@RequestMapping("idfindresult")
	public String idfindresult(HttpServletRequest request, Model model,
		    @RequestParam(required = true, value = "username") String username, 
		    @RequestParam(required = true, value = "userphone") int userphone,
		    SomDoongMember searchMember) {
		
		try {
		    
			searchMember.setUsername(username);
			searchMember.setUserphone(userphone);
			SomDoongMember memberSearch = somDoongMemberService.memberIdSearch(searchMember);
		    
		    model.addAttribute("searchMember", memberSearch);
		 
		} catch (Exception e) {
		    System.out.println(e.toString());
		}
		 
		return "/member/idfindresult";	
	}
	
	
	@RequestMapping("pwfind")
	public void pwfind() {
		
	}
	
	@RequestMapping("pwfindresult")
	public String pwfindresult(HttpServletRequest request, Model model,
		    @RequestParam(required = true, value = "userid") String userid, 
		    @RequestParam(required = true, value = "email") String email,    
		    SomDoongMember searchMember) {
		
		try {
		    
			searchMember.setUserid(userid);
			searchMember.setEmail(email);
			SomDoongMember memberSearch = somDoongMemberService.memberPwdCheck(searchMember);
		    
			
			model.addAttribute("searchMember", memberSearch);
		   		 
		} catch (Exception e) {
		    System.out.println(e.toString());	    
		}
		 
		 
		return "/member/pwfindresult";
		}

	
	@ResponseBody
	@GetMapping("idcheck")
	public int idcheck(SomDoongMember member) {
		logger.info("idcheck [GET] 요청완료!");
		int result = somDoongMemberService.idcheck(member);
		
		return result;
	}
}
	
	
	


	

package somdoong.mypage.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import somdoong.member.dto.SomDoongMember;
import somdoong.mypage.service.face.UpdateService;

@Controller
@RequestMapping("/mypage/update")
public class UpdateController {

	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired UpdateService updateService;
	
	@RequestMapping(value="/memberUpdateView", method = RequestMethod.GET)
	public String updateView(SomDoongMember member, HttpSession session,Model model){
	
		member= updateService.getid(member);
		logger.info("{}",member);
		model.addAttribute("member",member);
		
	
		return "/mypage/update/memberUpdateView";
	}

	@RequestMapping(value="/memberUpdate", method = RequestMethod.POST)
	public String registerUpdate(SomDoongMember member, HttpSession session) throws Exception{
		
		updateService.memberUpdate(member);
		
		session.invalidate();
		
		return "redirect:/mypage/list";
	}
	
	
	
	@RequestMapping(value="/memberDeleteView", method = RequestMethod.GET)
	public String memberDeleteView(SomDoongMember member,Model model){
		
		member= updateService.getdeleteid(member);
		logger.info("{}" , member);
		model.addAttribute("member",member);
		

		return "/mypage/update/memberDeleteView";
	}
	
	// 회원 탈퇴 post
	@RequestMapping(value="/memberDelete", method = RequestMethod.POST)
	public String memberDelete(SomDoongMember member, HttpSession session){
		
		
		updateService.memberDelete(member);
	
		session.invalidate();
		return "redirect:/mypage/list";
	}
	
	
	
	
	
	
	
	
}

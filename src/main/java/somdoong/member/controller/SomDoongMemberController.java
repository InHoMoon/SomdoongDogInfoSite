package somdoong.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value="join", method=RequestMethod.GET)
	public void join() {
		logger.info("/member/join get 요청완료!");
	}
	
	
	@RequestMapping(value="join" , method=RequestMethod.POST)
	public String joinproc(SomDoongMember joinproc) {
		logger.info("/member/join [POST] 요청완료!");
		logger.info("전달 파라미터{}",joinproc);
		
		
		somDoongMemberService.join(joinproc);
		
		return "redirect:/member/loginsuc";
	}
	
	@RequestMapping("loginsuc")
	public void loginsuc() {
		logger.info("/member/loginsuc 요청완료!");
	}
	
	
	
	

	
}

	

package somdoong.community.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import somdoong.community.dto.FboardComment;
import somdoong.community.service.face.FboardCommentService;

@RestController
//@Controller
public class FboardCommentController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired FboardCommentService commService;
	
	@ResponseBody
	@PostMapping("/community/free/writeC")
	public String writeC(FboardComment fcomm, HttpSession session) {
		logger.info("writeC 실행");
		
		//로그인한 사용자 정보 적용
		fcomm.setUserno((int)session.getAttribute("userno"));
		fcomm.setUserid((String)session.getAttribute("userid"));
		
		logger.info("writeC {}", fcomm);
		
		commService.writeC(fcomm);
		
		return "success";
	}
	
//	@PostMapping("/community/free/writeC")
//	public String writeC(FboardComment fcomm, HttpSession session) {
//		fcomm.setUserno((int)session.getAttribute("userno"));
//		fcomm.setUserid((String)session.getAttribute("userid"));
//		
//		logger.info("writeC {}", fcomm);
//		
//		if(session.getAttribute("login") == null) {
//			return "fail";
//		} else {
//			commService.writeC(fcomm);
//			return "success";
//		}
//	}
	
	
	
	
}

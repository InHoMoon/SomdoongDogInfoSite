package somdoong.community.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import somdoong.community.dto.SboardComm;
import somdoong.community.service.face.ScommService;

@Controller
@RequestMapping("/community")
public class ScommController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired ScommService scommService;
	
	// 댓글 작성
	@RequestMapping(value = "/scomm", method = RequestMethod.POST)
	public String postwrite(SboardComm comm) throws Exception {
		
		scommService.write(comm);
		
		return "redirect:/community/showview?sno=" + comm.getSno();
	}
	
	// 댓글 단일 조회 (수정 페이지)
	@RequestMapping(value = "/scommModify", method = RequestMethod.GET)
	public void getMofidy(@RequestParam("sno") int sno, @RequestParam("s_commno") int s_commno, Model model) throws Exception {
		
		SboardComm comm = new SboardComm();
		comm.setSno(sno);
		comm.setS_commno(s_commno);
		
		SboardComm reply = scommService.replySelect(comm);
			 
		model.addAttribute("reply", reply);
	}
}

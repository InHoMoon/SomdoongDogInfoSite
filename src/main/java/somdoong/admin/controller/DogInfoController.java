package somdoong.admin.controller;

import java.util.List;

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
import org.springframework.web.multipart.MultipartFile;

import somdoong.admin.dto.DogInfo;
import somdoong.admin.dto.DogInfoFile;
import somdoong.admin.service.face.DogInfoService;
import somdoong.util.AdminPaging;

@Controller
@RequestMapping("/admin/doginfo")
public class DogInfoController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired DogInfoService doginfoService;
	
	@RequestMapping("/list")
	public void list(
			@RequestParam(defaultValue = "0") int curPage
			, Model model) {
		
		AdminPaging paging = doginfoService.getPaging(curPage);
		logger.debug("{}", paging);
		model.addAttribute("paging", paging);
		
		List<DogInfo> list = doginfoService.list(paging);
		for( DogInfo d : list ) logger.debug("{}", d);
		model.addAttribute("list", list);
		
	}
	
	@RequestMapping("/view")
	public String view(DogInfo viewDogInfo, Model model) {
		logger.debug("{}", viewDogInfo);
		
		//잘못된 게시글 번호 처리
		if( viewDogInfo.getDno() < 0 ) {
			return "redirect:/admin/doginfo/list";
		}
		
		//게시글 조회
		viewDogInfo = doginfoService.view(viewDogInfo);
		logger.debug("조회된 게시글 {}", viewDogInfo);
		
		//모델값 전달
		model.addAttribute("viewDogInfo", viewDogInfo);
		
		
		//첨부파일 모델값 전달
		DogInfoFile doginfoFile = doginfoService.getAttachFile(viewDogInfo);
		model.addAttribute("doginfoFile", doginfoFile);
		
		
		return "/admin/doginfo/view";
	}
	
	@GetMapping("/write")
	public void write() {}
	
	@PostMapping("/write")
	public String writeProcess(DogInfo doginfo,Model model ,MultipartFile file, HttpSession session) {
		logger.debug("{}", doginfo);
		logger.debug("{}", file);
		
		//작성자 정보 추가
		doginfo.setAdminid( (String) session.getAttribute("adminid") );
		logger.debug(" 유저세션 아이디{}", doginfo);
		model.addAttribute("doginfo",doginfo);
		//게시글, 첨부파일 처리
		doginfoService.write(doginfo, file);
		
		return "redirect:/admin/doginfo/list";
	}
	
	
	@GetMapping("/update")
	public String update(DogInfo doginfo, Model model) {
		logger.debug("{}", doginfo);
		
		//잘못된 게시글 번호 처리
		if( doginfo.getDno() < 0 ) {
			return "redirect:/admin/doginfo/list";
		}
		
		//게시글 조회
		doginfo = doginfoService.view(doginfo);
		logger.debug("조회된 게시글 {}", doginfo);
		
		//모델값 전달
		model.addAttribute("updateDogInfo", doginfo);
		
		
		//첨부파일 모델값 전달
		DogInfoFile doginfoFile = doginfoService.getAttachFile(doginfo);
		model.addAttribute("doginfoFile", doginfoFile);
		
		
		return "/admin/doginfo/update";

	}
	
	@PostMapping("/update")
	public String updateProcess(DogInfo doginfo, MultipartFile file) {
		logger.debug("{}", doginfo);
		
		doginfoService.update(doginfo, file);
		
		return "redirect:/admin/doginfo/view?dno=" + doginfo.getDno();
	}
	
	@RequestMapping("/delete")
	public String delete(DogInfo doginfo) {
		
		doginfoService.delete(doginfo);
		
		return "redirect:/admin/doginfo/list";
	}
	
	

}

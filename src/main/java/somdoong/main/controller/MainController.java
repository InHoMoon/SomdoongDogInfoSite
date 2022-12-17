package somdoong.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import somdoong.admin.dto.DogInfo;
import somdoong.community.dto.Showboard;
import somdoong.main.service.face.MainService;
import somdoong.notice.dto.Notice;

@RequestMapping("/main")
@Controller
public class MainController {
	
	@Autowired MainService mainService;
	
	@RequestMapping("/main")
	public void main(Showboard sboard, Model model) {
		
		List<HashMap<String, Object>> list = mainService.list();
		model.addAttribute("list", list);
		
		List<Notice> nList = mainService.noticeList();
		model.addAttribute("nList", nList);
		
		List<DogInfo> dList = mainService.doginfoList();
		model.addAttribute("dList", dList);
		
	}
	
//	@GetMapping("/search")
//	public ModelAndView search(@RequestParam Map<String, Object> map)  {
//		
//		
//	}

}

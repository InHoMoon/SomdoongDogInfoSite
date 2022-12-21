package somdoong.main.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import somdoong.community.dto.Showboard;
import somdoong.main.service.face.MainService;

@RequestMapping("/main")
@Controller
public class MainController {
	
	@Autowired MainService mainService;
	
	@RequestMapping("/main")
	public void main(Showboard sboard, Model model) {
		
		List<HashMap<String, Object>> list = mainService.list();
		model.addAttribute("list", list);
	}

}

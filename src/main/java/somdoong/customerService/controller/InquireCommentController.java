package somdoong.customerService.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import somdoong.customerService.dto.InComm;
import somdoong.customerService.service.face.InCommService;

@Controller
@RequestMapping("/customerService")
public class InquireCommentController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired InCommService inCommService;
	
	//댓글 등록
	//url : /customerService
	@PostMapping({"/Cwrite"})
	public ResponseEntity<String> insert(InComm inComm) {
		logger.info("댓글 등록 실행");
		ResponseEntity<String> entity = null;
		
		try {
				inCommService.insertCmt(inComm);
				
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("failed", HttpStatus.BAD_REQUEST);	
		}
		
		return entity;
	}
		
		//댓글 목록 조회
		// http method: get
		// url : /board
		@GetMapping({"/Clist"})
		@ResponseBody
		public Map<String, Object> cmtList(@RequestParam int inum) {
			Map<String, Object> resultMap = new HashMap<>();
				
			try {
				List<InComm> list = inCommService.getList(inum);
				resultMap.put("list", list);
				resultMap.put("result", true);
			
			}catch(Exception e) {
				e.printStackTrace();
				resultMap.put("result", false);
			}
			
			return resultMap;
		}
		
		//댓글 수정
		@PostMapping("/Cupdate")
		public ResponseEntity<String> update(InComm inComm) {
			System.out.println("inComm : "+ inComm);
			
			ResponseEntity<String> entity = null;
		
			try {
				logger.info("댓글 수정 실행");
				
				inCommService.updateCmt(inComm);
				
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
			}catch(Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>("failed", HttpStatus.BAD_REQUEST);
			}
			
			return entity;
		}
		
		//댓글 삭제
		@GetMapping("/Cdelete")
		public ResponseEntity<String> delete(@RequestParam int inum) {
			
			ResponseEntity<String> entity = null;
			
			try {
				logger.info("댓글 수정 실행");
					
				inCommService.deleteCmt(inum);
					
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
				
			}catch(Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>("failed", HttpStatus.BAD_REQUEST);
			}
				
				return entity;
			}	
		
	}

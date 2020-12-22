package org.edu.controller;


import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**	
 * ReplyController.java 클래스
 * 댓글 구현 REST-API 컨트롤러
 * @author 신숙정
 * 
 * 
 * 
 * **/
@RestController
public class ReplyController {

		@RequestMapping(value= "/reply/reply_write", method=RequestMethod.POST)
	public ResponseEntity<String> reply_write() {
			ResponseEntity<String> responseEntity =
					new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			//ResponseEntity는 json텍스트를 반환하는데, 전송상태-HttpStatus.OK(200):"OK"
			//text-body:e.getMessage()실패메시지값, 전손상태-HttpStatus.BAD_REQUEST(400)
 			return responseEntity ;
		}
	//기존@Controller 이 메서드 반환값은 파일위치,
	//대신에 @RestController에 메서드의 반환값은json텍스트로서  Ajax로 호출한 jsp로 리턴보내게 됩니다.
	}



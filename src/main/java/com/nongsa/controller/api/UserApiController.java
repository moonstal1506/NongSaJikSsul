package com.nongsa.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.nongsa.dto.ResponseDto;
import com.nongsa.model.User;
import com.nongsa.service.UserService;

@RestController
public class UserApiController {
	
	@Autowired
	private UserService userService;
	
	@PostMapping("/auth/joinProc")
	public ResponseDto<Integer> save(@RequestBody User user) {
		
		userService.회원가입(user);

		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	
	@PutMapping("/user")
	public ResponseDto<Integer> update(@RequestBody User user){ // key=value, x-www-form-urlencoded
		userService.회원수정(user);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
	

}

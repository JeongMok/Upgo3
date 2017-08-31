package com.example.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.repackaged.org.apache.commons.codec.binary.StringUtils;
import com.example.dto.Member;
import com.example.service.OracleMemberService;

@Controller
public class MemberController {
	/**
	 * 날짜를 Binding해주는 메서드 요청 데이터와 컨트롤러 메서드의 전달인자 매핑을 위한 초기화 개별 컨트롤러에서
	 * InitBinder를 함 => 일반적인 컨버팅이 아니라 개별적인 컨버팅 하는 곳
	 * 
	 * @param binder
	 */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		binder.registerCustomEditor(Date.class, new CustomDateEditor(format, false));
	}

	@Autowired
	@Qualifier("bcryptPasswordEncoder")
	BCryptPasswordEncoder passwdEncoder;

	@Autowired
	@Qualifier("memberService")
	OracleMemberService memberService;	
	
	/**
	 * 회원가입 폼으로 이동
	 * 
	 * @return
	 */
	@RequestMapping(value = "signup", method = RequestMethod.GET)
	public ModelAndView registerForm() {
		ModelAndView mav = new ModelAndView();
		Member member = new Member();
		mav.addObject("member", member);
		mav.setViewName("member/registerform");
		return mav;
	}

	/**
	 * 사용자가 입력한 form의 데이터를 DB에 등록하는 Controller (회원가입)
	 * 
	 * @param member
	 *            넘어온 form데이터 (아이디, 비밀번호 이메일 ...)
	 * @param result
	 *            유효성 검사
	 * @return
	 */
	@RequestMapping(value = "signup", method = RequestMethod.POST)
	public ModelAndView register(@Valid Member member, BindingResult result) {
		ModelAndView mav = new ModelAndView();
		if (result.hasErrors()) {
			mav.setViewName("/member/registerform");
			return mav;
		} else {

			// 비밀번호 암호화 처리
			String passwd = passwdEncoder.encode(member.getMbrPasswd());
			member.setMbrPasswd(passwd);
			memberService.register(member);
			mav.setViewName("home");
			return mav;
		}
	}

	/**
	 * 로그인 폼으로 이동
	 * 
	 * @return
	 */
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public ModelAndView loginform() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login");
		Member member = new Member();
		mav.addObject("member", member);
		return mav;
	}

	
	/**
	 * 사용자가 입력한 아이디와 비밀번호를 가지고 로그인 처리를 하는 Controller
	 * 
	 * @param member
	 *            사용자가 입력한 아이디와 비밀번호
	 * @param session
	 *            로그인에 성공하면 세션에 등록
	 * @return
	 */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public ModelAndView login(Member member, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String rawPassword = member.getMbrPasswd();
		String encodedPassword = member.getMbrPasswd();
		if(passwdEncoder.matches(rawPassword, encodedPassword)) {
			member = memberService.authenticate(member);	
		} else {
			System.out.println("정보 불일치");
		}
				
		
		
		if (member == null) {
			mav.setViewName("redirect:loginerror.action");
			return mav;
		}
		
		session.setAttribute("loginmember", member);
		mav.setViewName("redirect:/");

		return mav;
	}
	
	@RequestMapping(value="loginerror.action",method=RequestMethod.GET)
	@ResponseBody
	public String loginerror(Member member){
		
		return "error";
	}

	/**
	 * 세션을 만료시켜 로그아웃을 시킨다.
	 * 
	 * @param session
	 *            세션
	 * @return
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		System.out.println('f');
		session.invalidate();
		return "redirect:/home";
	}
	
	/**
	 * 로그인유저의 이름을 가져와 메시지를 조회하고 메시지의 결과를 보여주는 컨트롤러
	 * @param session
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "newbell", method = RequestMethod.GET)
	@ResponseBody
	public List<String> receiveMessage(HttpSession session) throws IOException {
		
		Member member = (Member) session.getAttribute("loginmember");
		List<String> messages = memberService.receiveMessage(member.getMbrId());
		return messages;
	}
	/**
	 * 메세지의 갯수를 세서 보여주는 컨트롤러
	 * @param session
	 * @return
	 */
	@RequestMapping(value="countbell", method=RequestMethod.GET)
	@ResponseBody
	public Integer countMessage(HttpSession session){
		
		Member member = (Member) session.getAttribute("loginmember");
		if(member != null){
			int counts = memberService.countMessages(member.getMbrId());
			return counts;
		}
		
		return 0;
		
	}
	
	/**
	 * 지도보여쥬기
	 * @param session
	 * @return
	 */
	@RequestMapping(value="map", method=RequestMethod.GET)
	public String map(HttpSession session){
		
		return "board/map";
	}
	
	@RequestMapping(value="googlelogin.action", method=RequestMethod.POST)
	public String googleLogin(HttpSession session,@RequestParam(value="idtoken") String idTokenString) throws GeneralSecurityException, IOException{
		
		HttpTransport transport = new NetHttpTransport();
		JsonFactory jsonFactory = new JacksonFactory();
		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
			    .setAudience(Collections.singletonList("93374727909-aob5oi922l48hrnkv9pl01tv0jp5rk6h.apps.googleusercontent.com"))
			    // Or, if multiple clients access the backend:
			    //.setAudience(Arrays.asList(CLIENT_ID_1, CLIENT_ID_2, CLIENT_ID_3))
			    .build();
		 	
			// (Receive idTokenString by HTTPS POST)
			GoogleIdToken idToken = verifier.verify(idTokenString);
			if (idToken != null) {
			  Payload payload = idToken.getPayload();
			  // Print user identifier
			  String userId = payload.getSubject();
			  System.out.println("User ID: " + userId);
			  // Get profile information from payload
			  String email = payload.getEmail();
			  boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
			  String name = (String) payload.get("name");
			  String pictureUrl = (String) payload.get("picture");
			  String locale = (String) payload.get("locale");
			  String familyName = (String) payload.get("family_name");
			  String givenName = (String) payload.get("given_name");
			  // Use or store profile information
			  // ...
			  
			  
			  
			  Member member = new Member();
			  member.setMbrId(name);
			  member.setMbrPasswd(userId);
			  member.setMbrEmail(email);
			  // 기존에 사용자가 있는지 확인.
			  Member compareId = memberService.authenticate(member);
			  
			  if(compareId == null){//없으면 등록, 세션 후 이동
				  memberService.register(member);
				  session.setAttribute("loginmember", compareId);
				  return "redirect:/home.action";
			  }else{//있으면 세션 후 이동
				  session.setAttribute("loginmember", compareId);
				  return "redirect:/home.action";
			  }
			  
			} else {
			  System.out.println("Invalid ID token.");
			  return "board/list";
			}
	}
}
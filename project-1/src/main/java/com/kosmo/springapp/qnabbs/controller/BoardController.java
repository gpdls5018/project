package com.kosmo.springapp.qnabbs.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.springapp.qnabbs.service.DaoService;
import com.kosmo.springapp.qnabbs.service.ListPagingData;
import com.kosmo.springapp.qnabbs.service.PagingUtil;
import com.kosmo.springapp.qnabbs.service.impl.board.AnswerServiceImpl;
import com.kosmo.springapp.service.JWTokensService;
import com.kosmo.springapp.service.impl.LoginServiceImpl;




@Controller
@RequestMapping("/board")
public class BoardController {
	//토큰용 아래 3개 주입
	@Autowired
	private JWTokensService jwTokensService;
	@Value("${secret-key}")
	private String secretKey;
	@Value("${token-name}")
	private String tokenName;
	//service주입
	@Autowired
	private DaoService board;
	//loginserviceimpl주입
	@Autowired
	private LoginServiceImpl loginService;
	
	@Autowired
	private AnswerServiceImpl answerservice;
	
	//post로 write.do를 요청받음, 뷰페이지에서 
	@RequestMapping(value="/List.do",method = {RequestMethod.GET,RequestMethod.POST})
	public String list(
			@RequestParam Map map,
			@RequestParam(required = false,defaultValue = "1",value = PagingUtil.NOWPAGE) int nowPage,
			HttpServletRequest req,
			Model model) {
		
		String token= jwTokensService.getToken(req, tokenName);//token을 가져옴
		Map payload = jwTokensService.getTokenPayloads(token, secretKey);//payload로 만듬
		if(payload.get("sub") != null) {//payload는 map형태의 많은 데이터(이건 TRUE)하지만 .get("sub")를 통해 아이디가 있는지 판별(있으면 null이 아님)
			String id=payload.get("sub").toString();//가져온 id를 String id에 저장(현재 로그인한 아이디)
			model.addAttribute("id", id);//모델에 id란 이름으로 id 저장
		}
		ListPagingData listPagingData= board.selectList(map, req, nowPage);
		//데이타 저장
		model.addAttribute("listPagingData", listPagingData);	
		//
		return "board/List";
	
	}/////////////////////
	//글쓰기 폼으로 이동
	@GetMapping("/Write.do")
	public String write() {
		return "board/Write";
	}/////////////////
	
	//글작성후 list.do로 이동(목록으로 이동)
	@PostMapping("/Write.do")
	public String writeProcess(HttpServletRequest req,@RequestParam Map map,Model model) {
		
		//id란 이름으로 token의 id를 저장
		String id = jwTokensService.getTokenPayloads(jwTokensService.getToken(req, tokenName), secretKey).get("sub").toString();
		//map타입으로 id란 이름으로 id저장
		map.put("id", id);
		
		//affect에 글작성이 성공하였다면 (int) 1,실패면 0으로 저장
		int affected = board.insert(map);
		//map에 1명의 글 저장 
		map = board.selectOne(map);
		//글 입력 실패시
		if(affected==0) {
			//model.addAttribute("InputError","다시 작성해주세요");//아직안함
			return "board/View";
		}
		//작성하고 난 뒤 목록페이지로 이동
		return "forward:/board/List.do"; 
	}////////////////////
	
	//상세보기
	@RequestMapping(value="/View.do",method = {RequestMethod.GET,RequestMethod.POST})
	public String view(HttpServletRequest req,@RequestParam Map map,Model model) { 
		
		//id란 이름으로 token의 id를 저장
		String id = jwTokensService.getTokenPayloads(jwTokensService.getToken(req, tokenName), secretKey).get("sub").toString();
		//id로 회원 정보 가져와서 active 정보 가져옴
		String active=loginService.selectOne(id).getActive();
		System.out.println("active:"+active);
		model.addAttribute("active", active);
		
		//답변글 용 Map생성
		Map paramMap =new HashMap<>();
		
		System.out.println("체크용1");
		//질문글 하나 불러와서 map에 저장
		System.out.println("map에 무엇이 있나? "+map);
		map=board.selectOne(map);
		System.out.println("체크용2");
		//record란 이름으로 질문글 하나
		model.addAttribute("record", map);
		System.out.println("체크용3");
		//System.out.println(model);//콘솔 체크용
		System.out.println("map의 값 체크"+map);
		
		System.out.println("여기서 아래 에러 발생함!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		if (map.get("NO") != null) {
			System.out.println("map의 NO:"+map.get("NO"));
			System.out.println("여기로 들어오는가?");
			System.out.println("성공");
			//질문글의 no로 답변글을 불러와서 paramMap에 저장
			paramMap=answerservice.answerselectOne(map);
		}
		System.out.println("체크용4");
		//paramMap이란 이름으로 map을 저장
		model.addAttribute("paramMap", paramMap);
		//paramMap을 출력
		System.out.println("paramMap(답변이 없으면 null):"+paramMap);
		System.out.println("체크용5");
		System.out.println("여기출력까지 성공함");
		
		
		return "board/View";
	}///////////////
	
	@GetMapping("/Edit.do")
	public String edit(HttpServletRequest req,@RequestParam Map map,Model model) {
		//String id = jwTokensService.getTokenPayloads(jwTokensService.getToken(req, tokenName), secretKey).get("sub").toString();
		//map.put("id", id);
		map= board.selectOne(map);
		System.out.println(map);
		model.addAttribute("record", map);
		System.out.println("record값확인"+model);
		return "board/Edit";
	}/////////////
	
	@PostMapping("/EditProcess.do")
	public String editProcess(HttpServletRequest req,@RequestParam Map map,Model model) {
		//map.put("id", "petrus11");
		//String id = jwTokensService.getTokenPayloads(jwTokensService.getToken(req, tokenName), secretKey).get("sub").toString();
		//map.put("id", id);
		System.out.println("여기부터...");
		int affected = board.update(map);
	    if (affected == 0) {
	        model.addAttribute("inputError", "입력 오류입니다. 다시 입력해주세요");
	        model.addAttribute("record", map);
	        return "board/Edit";
	    } 
	    return "forward:/board/View.do";
	}//////////////////
	
	@GetMapping("/Delete.do")
	public String delete(HttpServletRequest req,@RequestParam Map map,Model model) {
		
		//String id = jwTokensService.getTokenPayloads(jwTokensService.getToken(req, tokenName), secretKey).get("sub").toString();
		//map.put("id", id);
		//서비스 호출
		int deleteCount = board.delete(map);
	    System.out.println("여기 delete후 "+deleteCount);
		if (deleteCount == -1) {
	        model.addAttribute("FAILURE", "삭제할 수 없어요");
	        System.out.println("delete에 에러 발생");
	        return "forward:/board/View.do";
	    }
	    System.out.println("삭제된 답글 수: " + deleteCount);
	    // 뷰정보 반환 - 목록을 처리하는 컨트롤러로 이동
	    return "forward:/board/List.do"; 
	}
	
	
}

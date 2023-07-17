package com.kosmo.springapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.springapp.model.AvgStarScoreCountDTO;
import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.service.MainPageService;
import com.kosmo.springapp.service.impl.SelectFoodServiceImpl;

@Controller
public class SelectFoodRankListController {

	@Autowired
	SelectFoodServiceImpl selectfoodservice;
	
	@GetMapping("/ranking/selectfoodcompany.do")
	public String foodcompany(Model model) {
		List<String> RankingKeyWord = selectfoodservice.RankingKeyWord();
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFoodScore();
		model.addAttribute("RankingKeyWord", RankingKeyWord);
		model.addAttribute("listData", listData);
		model.addAttribute("casesel",3);
		return "ranking/FoodRank";
	}
	
	@GetMapping("/ranking/selectfoodnutrient.do")
	public String foodnutrient(Model model) {
		List<String> RankingKeyWord = selectfoodservice.RankingKeyWord();
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFoodScore();
		model.addAttribute("RankingKeyWord", RankingKeyWord);
		model.addAttribute("listData", listData);
		model.addAttribute("casesel",2);
		return "ranking/FoodRank";
	}
	
	@GetMapping("/ranking/selectfood.do")
	public String foodrank(Model model) {
		List<String> RankingKeyWord = selectfoodservice.RankingKeyWord();
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFoodScore();
		model.addAttribute("RankingKeyWord", RankingKeyWord);
		model.addAttribute("listData", listData);
		model.addAttribute("casesel",1);
		
		return "ranking/FoodRank";
	}
	////////////////////////////////////////////////////////////////////////
	@GetMapping("/functionfood/select.do")
	public String selectfood(@RequestParam String foodname,Model model) {
		if(selectfoodservice.checkWord(foodname).size() == 0) {
			selectfoodservice.newWord(foodname);
		}
		selectfoodservice.selectKeyWord(foodname);
		List<String> RankingKeyWord = selectfoodservice.RankingKeyWord();
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFromNameScore(foodname);
		List<FunctionalFoodListDTO> listData2 = selectfoodservice.selectFoodListFromName(foodname);
		
		model.addAttribute("RankingKeyWord", RankingKeyWord);
		model.addAttribute("listData", listData);
		model.addAttribute("listData2", listData2);
		model.addAttribute("foodname", foodname);
		model.addAttribute("casesel", 1);
		return "ranking/FoodRank";
	}
	
	@GetMapping("/functionfood/selectnutrient.do")
	public String selectfoodnutrient(@RequestParam String foodname,Model model) {
		if(selectfoodservice.checkWord(foodname).size() == 0) {
			selectfoodservice.newWord(foodname);
		}
		selectfoodservice.selectKeyWord(foodname);
		List<String> RankingKeyWord = selectfoodservice.RankingKeyWord();
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFromNutrientNameScore(foodname);
		List<FunctionalFoodListDTO> listData2 = selectfoodservice.selectFoodListFromName(foodname);
		
		model.addAttribute("RankingKeyWord", RankingKeyWord);
		model.addAttribute("listData", listData);
		model.addAttribute("listData2", listData2);
		model.addAttribute("foodname", foodname);
		model.addAttribute("casesel", 2);
		return "ranking/FoodRank";
	}
	
	@GetMapping("/functionfood/selectcompany.do")
	public String selectfoodcompany(@RequestParam String foodname,Model model) {
		if(selectfoodservice.checkWord(foodname).size() == 0) {
			selectfoodservice.newWord(foodname);
		}
		selectfoodservice.selectKeyWord(foodname);
		List<String> RankingKeyWord = selectfoodservice.RankingKeyWord();
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFromCompanyNameScore(foodname);
		List<FunctionalFoodListDTO> listData2 = selectfoodservice.selectFoodListFromName(foodname);
		
		model.addAttribute("RankingKeyWord", RankingKeyWord);
		model.addAttribute("listData", listData);
		model.addAttribute("listData2", listData2);
		model.addAttribute("foodname", foodname);
		model.addAttribute("casesel", 3);
		return "ranking/FoodRank";
	}
}

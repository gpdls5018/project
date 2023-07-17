package com.kosmo.springapp.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosmo.springapp.model.AvgStarScoreCountDTO;
import com.kosmo.springapp.model.CheckWordDTO;
import com.kosmo.springapp.model.FunctionalFoodListDTO;

@Mapper
public interface SelectFoodMapper {
	List<AvgStarScoreCountDTO> selectFoodListFromNameScore(String foodname);
	List<AvgStarScoreCountDTO> selectFoodListFromNutrientNameScore(String foodname);
	List<AvgStarScoreCountDTO> selectFoodListFromCompanyNameScore(String foodname);
	List<FunctionalFoodListDTO> selectFoodListFromName(String foodname);
	List<AvgStarScoreCountDTO> selectFoodListFoodScore();
	List<String> RankingKeyWord();
	List<CheckWordDTO> checkWord(String foodname);
	void newWord(String foodname);
	void selectKeyWord(String foodname);
}

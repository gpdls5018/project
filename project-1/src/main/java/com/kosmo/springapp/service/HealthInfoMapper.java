package com.kosmo.springapp.service;

import org.apache.ibatis.annotations.Mapper;

import com.kosmo.springapp.model.HealthInfoDTO;

@Mapper
public interface HealthInfoMapper {

	int saveHealthInfo(HealthInfoDTO healthInfoDto);
	int updateHealthInfo(HealthInfoDTO healthInfoDto);

	HealthInfoDTO selectHealthInfoByUserId(String userId);


}
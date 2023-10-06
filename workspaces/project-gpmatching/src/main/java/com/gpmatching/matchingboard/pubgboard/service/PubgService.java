package com.gpmatching.matchingboard.pubgboard.service;

import com.gpmatching.matchingboard.dto.PubgDto;

public interface PubgService {

	void write(PubgDto pubgDto, int boardNo);

	void edit(PubgDto pubgDto);

}
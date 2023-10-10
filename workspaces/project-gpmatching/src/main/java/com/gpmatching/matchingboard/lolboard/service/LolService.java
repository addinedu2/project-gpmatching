package com.gpmatching.matchingboard.lolboard.service;

import com.gpmatching.matchingboard.dto.LolDto;

public interface LolService {

	void write(LolDto lolDto, int boardNo);

	void edit(LolDto lolDto);

}

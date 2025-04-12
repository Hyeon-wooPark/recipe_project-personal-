package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.Criteria;
import kr.ac.kopo.model.QueryBoard;

public interface QueryBoardService {
	public List<QueryBoard> list(Criteria cri);
	
	public int totalCount(Criteria cri);
}

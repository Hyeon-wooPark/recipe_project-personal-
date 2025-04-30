package kr.ac.kopo.service;

import java.util.List;
import java.util.Map;

import kr.ac.kopo.model.Criteria;
import kr.ac.kopo.model.QueryBoard;

public interface QueryBoardService {
	public List<QueryBoard> list(Criteria cri);
	
	public int totalCount(Criteria cri);
	
	public void insert(QueryBoard vo);
	
	public Map<String, Object> getQuery(int queryId);
}

package kr.ac.kopo.mapper;

import java.util.List;

import kr.ac.kopo.model.Criteria;
import kr.ac.kopo.model.QueryBoard;

public interface QueryBoardMapper {
	
	public List<QueryBoard> list(Criteria cri);
	
	public int totalCount(Criteria cri);
	
	public void insert(QueryBoard vo);
	
	public String getQuery(int queryId);
}

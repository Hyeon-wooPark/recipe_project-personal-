package kr.ac.kopo.mapper;

import java.util.List;

import kr.ac.kopo.model.Criteria;
import kr.ac.kopo.model.QueryBoard;

public interface QueryBoardMapper {
	
	public List<QueryBoard> list(Criteria cri);
	
	public int totalCount(Criteria cri);
	
	public void insert(QueryBoard vo);
	
	public QueryBoard getQuery(int queryId);
	
	public void countUp(int queryId);
	
	public void update(QueryBoard vo);
	
	public void delete(int queryId);
}

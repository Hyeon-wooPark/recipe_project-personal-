package kr.ac.kopo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.mapper.QueryBoardMapper;
import kr.ac.kopo.model.Criteria;
import kr.ac.kopo.model.QueryBoard;

@Service
public class QueryBoardServiceImpl implements QueryBoardService {

	@Autowired
	private QueryBoardMapper boardMapper;
	
	@Override
	public List<QueryBoard> list(Criteria cri) {
		return boardMapper.list(cri);
	}

	@Override
	public int totalCount(Criteria cri) {
		return boardMapper.totalCount(cri);
	}

	@Override
	public void insert(QueryBoard vo) {
		boardMapper.insert(vo);
	}

	@Override
	public Map<String, Object> getQuery(int queryId) {
		boardMapper.countUp(queryId);
		String content = boardMapper.getQuery(queryId).getContent();
		int count = boardMapper.getQuery(queryId).getCount();
		
		Map<String, Object> result = new HashMap<>();
		result.put("content", content);
		result.put("count", count);
		return result;
	}

	@Override
	public void update(QueryBoard vo) {
		boardMapper.update(vo);
	}

	@Override
	public void delete(int queryId) {
		boardMapper.delete(queryId);
	}

}

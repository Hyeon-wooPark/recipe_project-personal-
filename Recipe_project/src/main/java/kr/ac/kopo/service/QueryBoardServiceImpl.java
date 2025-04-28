package kr.ac.kopo.service;

import java.util.List;

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

}

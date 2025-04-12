package kr.ac.kopo.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.mapper.RecipeBoardMapper;
import kr.ac.kopo.model.Criteria;
import kr.ac.kopo.model.RecipeBoard;

@Service
public class RecipeBoardServiceImpl implements RecipeBoardService {

	@Autowired
	private RecipeBoardMapper boardMapper;
	
	@Override
	public List<RecipeBoard> list(Criteria cri) {
		return boardMapper.list(cri);
	}

	@Override
	public void register(RecipeBoard vo) {
		boardMapper.insert(vo);
	}

	@Override
	public int totalCount(Criteria cri) {
		return boardMapper.totalCount(cri);
	}

	@Override
	public RecipeBoard getBoard(int recipeId) {
		boardMapper.countUp(recipeId);
		return boardMapper.getBoard(recipeId);
	}

	@Override
	public void modify(RecipeBoard vo) {
		vo.setUpdateDate(LocalDate.now());
		boardMapper.modify(vo);
	}

	@Override
	public void remove(int recipeId) {
		boardMapper.remove(recipeId);
	}

}

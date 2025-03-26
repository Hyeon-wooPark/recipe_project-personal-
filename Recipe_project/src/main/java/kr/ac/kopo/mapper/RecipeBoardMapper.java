package kr.ac.kopo.mapper;

import java.util.List;

import kr.ac.kopo.model.Criteria;
import kr.ac.kopo.model.RecipeBoard;

public interface RecipeBoardMapper {
	
	public List<RecipeBoard> list(Criteria cri);
	
	public void insert(RecipeBoard vo);

	public int totalCount(Criteria cri);
	
	public RecipeBoard getBoard(int recipeId);
	
	public void countUp(int recipeId);
	
	public void modify(RecipeBoard vo);
	
	public void remove(int recipeId);
}

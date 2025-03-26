package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.Criteria;
import kr.ac.kopo.model.RecipeBoard;

public interface RecipeBoardService {

	public List<RecipeBoard> list(Criteria cri);
	
	public void register(RecipeBoard vo);
	
	public int totalCount(Criteria cri);
	
	public RecipeBoard getBoard(int recipeId);
	
	public void modify(RecipeBoard vo);
	
	public void remove(int recipeId);
}

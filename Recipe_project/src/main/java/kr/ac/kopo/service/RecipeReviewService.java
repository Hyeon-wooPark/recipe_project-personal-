package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.RecipeReview;
import kr.ac.kopo.model.ReviewCriteria;

public interface RecipeReviewService {
	
	public void insert(RecipeReview vo);
	
	public List<RecipeReview> list(int recipeId, ReviewCriteria rcri);
	
	public int totalCount(int recipeId, ReviewCriteria rcri);
	
	public void update(RecipeReview vo);
}

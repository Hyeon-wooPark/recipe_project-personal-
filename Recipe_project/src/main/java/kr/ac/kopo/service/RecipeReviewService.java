package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.RecipeReview;
import kr.ac.kopo.model.ReviewCriteria;

public interface RecipeReviewService {
	
	public void insert(RecipeReview vo);
	
	public List<RecipeReview> list(int recipeId, ReviewCriteria rcri);
	
	public int totalGroup(int recipeId, ReviewCriteria rcri);
	
	public void update(RecipeReview vo);
	
	public void delete(int reviewId);
	
	public int totalReview(int recipeId);
}

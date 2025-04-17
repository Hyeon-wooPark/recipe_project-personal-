package kr.ac.kopo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ac.kopo.model.RecipeReview;
import kr.ac.kopo.model.ReviewCriteria;

public interface RecipeReviewMapper {

	public void insert(RecipeReview vo);
	
	public List<RecipeReview> list(@Param("recipeId") int recipeId, @Param("rcri") ReviewCriteria rcri);
	
	public int totalGroup(@Param("recipeId") int recipeId, @Param("rcri") ReviewCriteria rcri);
	
	public void update(RecipeReview vo);
	
	public void delete(int reviewId);

	public RecipeReview read(int parentId);
	
	public void updateGroupId(RecipeReview vo);
	
	public void seqUpdate(RecipeReview vo);
	
	public int totalReview(int recipeId);
	
}

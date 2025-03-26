package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.mapper.RecipeReviewMapper;
import kr.ac.kopo.model.RecipeReview;
import kr.ac.kopo.model.ReviewCriteria;

@Service
public class RecipeReviewServiceImpl implements RecipeReviewService {

	@Autowired
	private RecipeReviewMapper reviewMapper;
	
	@Override
	public void insert(RecipeReview vo) {
		reviewMapper.insert(vo);
	}

	@Override
	public List<RecipeReview> list(int recipeId, ReviewCriteria rcri) {
		return reviewMapper.list(recipeId, rcri);
	}

	@Override
	public int totalCount(int recipeId, ReviewCriteria rcri) {
		return reviewMapper.totalCount(recipeId, rcri);
	}

}

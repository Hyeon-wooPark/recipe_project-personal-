package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.mapper.RecipeReviewMapper;
import kr.ac.kopo.model.RecipeReview;
import kr.ac.kopo.model.ReviewCriteria;

@Service
public class RecipeReviewServiceImpl implements RecipeReviewService {

	@Autowired
	private RecipeReviewMapper reviewMapper;
	
	@Override
	@Transactional
	public void insert(RecipeReview vo) {
		if(vo.getReviewId() == 0) {
			reviewMapper.insert(vo);
			vo.setGroupId(vo.getReviewId());
			reviewMapper.updateGroupId(vo);
		} else {
			RecipeReview parent = reviewMapper.read(vo.getReviewId());
			vo.setGroupId(parent.getGroupId());
			vo.setReviewSequence(parent.getReviewSequence() + 1);
			vo.setBoardLevel(parent.getBoardLevel() + 1);
			reviewMapper.seqUpdate(vo);
			reviewMapper.insert(vo);
		}
	}

	@Override
	public List<RecipeReview> list(int recipeId, ReviewCriteria rcri) {
		return reviewMapper.list(recipeId, rcri);
	}

	@Override
	public int totalCount(int recipeId, ReviewCriteria rcri) {
		return reviewMapper.totalCount(recipeId, rcri);
	}

	@Override
	public void update(RecipeReview vo) {
		reviewMapper.update(vo);
	}

	@Override
	public void delete(int reviewId) {
		reviewMapper.delete(reviewId);
	}
}

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
		// 부모 댓글
		if (vo.getReviewId() == 0) {
	        reviewMapper.insert(vo);
	        vo.setGroupId(vo.getReviewId());
	        reviewMapper.updateGroupId(vo);
	    // 대댓글
	    } else {
	        RecipeReview parent = reviewMapper.read(vo.getReviewId());
	        vo.setGroupId(parent.getGroupId());
	        vo.setBoardLevel(parent.getBoardLevel() + 1);
	        
	        int max = reviewMapper.getMaxSeq(vo.getGroupId());
	        vo.setReviewSequence(max + 1);
	        if (reviewMapper.existSeq(vo)) {
				reviewMapper.reSeq(vo);
			}
	        reviewMapper.insert(vo);
	        
	    }
	}

	@Override
	public List<RecipeReview> list(int recipeId, ReviewCriteria rcri) {
		List<RecipeReview> list = reviewMapper.list(recipeId, rcri);
		for (int i = 0; i < list.size() - 1; i++) {
			RecipeReview current = list.get(i);
			RecipeReview next = list.get(i + 1);
			
			if (current.getGroupId() == next.getGroupId()) {
				current.setNextReviewId(next.getReviewId());
			}
		} 
		return list;
	}

	@Override
	public int totalGroup(int recipeId, ReviewCriteria rcri) {
		return reviewMapper.totalGroup(recipeId, rcri);
	}

	@Override
	public void update(RecipeReview vo) {
		reviewMapper.update(vo);
	}

	@Override
	public void delete(int reviewId) {
		reviewMapper.delete(reviewId);
	}

	@Override
	public int totalReview(int recipeId) {
		return reviewMapper.totalReview(recipeId);
	}
}

package kr.ac.kopo.model;

import java.time.LocalDate;

public class RecipeReview {

	private int reviewId;
	
	private int recipeId;
	
	private String comment;
	
	private String viewWriter;
	
	private LocalDate createComment;
	
	private LocalDate updateComment;
	
	private int viewAvailable;
	
	private int groupId;
	
	private int reviewSequence;
	
	private int boardLevel;
	
	private String profile;
	
	private Integer nextReviewId;
	
	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public int getRecipeId() {
		return recipeId;
	}

	public void setRecipeId(int recipeId) {
		this.recipeId = recipeId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getViewWriter() {
		return viewWriter;
	}

	public void setViewWriter(String viewWriter) {
		this.viewWriter = viewWriter;
	}

	public LocalDate getCreateComment() {
		return createComment;
	}

	public void setCreateComment(LocalDate createComment) {
		this.createComment = createComment;
	}

	public LocalDate getUpdateComment() {
		return updateComment;
	}

	public void setUpdateComment(LocalDate updateComment) {
		this.updateComment = updateComment;
	}

	public int getViewAvailable() {
		return viewAvailable;
	}

	public void setViewAvailable(int viewAvailable) {
		this.viewAvailable = viewAvailable;
	}

	public int getGroupId() {
		return groupId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	public int getReviewSequence() {
		return reviewSequence;
	}

	public void setReviewSequence(int reviewSequence) {
		this.reviewSequence = reviewSequence;
	}

	public int getBoardLevel() {
		return boardLevel;
	}

	public void setBoardLevel(int boardLevel) {
		this.boardLevel = boardLevel;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public Integer getNextReviewId() {
		return nextReviewId;
	}

	public void setNextReviewId(Integer nextReviewId) {
		this.nextReviewId = nextReviewId;
	}

}

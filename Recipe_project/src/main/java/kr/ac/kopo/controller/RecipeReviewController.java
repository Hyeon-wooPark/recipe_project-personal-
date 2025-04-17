package kr.ac.kopo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.kopo.model.Criteria;
import kr.ac.kopo.model.RecipeReview;
import kr.ac.kopo.model.ReviewCriteria;
import kr.ac.kopo.service.RecipeReviewService;

@Controller
@RequestMapping("/review/*")
public class RecipeReviewController {
	
	@Autowired
	private RecipeReviewService reviewService;
	
	@RequestMapping("/insert")
	public String insert(RecipeReview review, @ModelAttribute("cri") Criteria cri, @ModelAttribute("rcri") ReviewCriteria rcri, RedirectAttributes rttr) {
		reviewService.insert(review);
		rttr.addAttribute("recipeId" ,review.getRecipeId());
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/getBoard";
	}
	
	@PostMapping("/update")
	public String update(RecipeReview review, @ModelAttribute("cri") Criteria cri, @ModelAttribute("rcri") ReviewCriteria rcri, RedirectAttributes rttr) {
		System.out.println(review.getReviewId());
		System.out.println(review.getComment());
		reviewService.update(review);
		rttr.addAttribute("recipeId" ,review.getRecipeId());
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/getBoard";
	}
	
	@PostMapping("/delete")
	public String delete(RecipeReview review, @ModelAttribute("cri") Criteria cri, @ModelAttribute("rcri") ReviewCriteria rcri, RedirectAttributes rttr) {
		reviewService.delete(review.getReviewId());
		rttr.addAttribute("recipeId" ,review.getRecipeId());
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/getBoard";
	}
}

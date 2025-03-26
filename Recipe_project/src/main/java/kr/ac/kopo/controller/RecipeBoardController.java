package kr.ac.kopo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.kopo.model.Criteria;
import kr.ac.kopo.model.PageMaker;
import kr.ac.kopo.model.RecipeBoard;
import kr.ac.kopo.model.RecipeReview;
import kr.ac.kopo.model.ReviewCriteria;
import kr.ac.kopo.model.ReviewPageMaker;
import kr.ac.kopo.service.RecipeBoardService;
import kr.ac.kopo.service.RecipeReviewService;

@Controller
@RequestMapping("/board/*")
public class RecipeBoardController {

	@Autowired
	private RecipeBoardService boardService;
	
	@Autowired
	private RecipeReviewService reviewService;
	
	@RequestMapping("/list")
	public String list(Criteria cri, Model model) {
		
		List<RecipeBoard> list = boardService.list(cri);
		model.addAttribute("list", list);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardService.totalCount(cri));
		model.addAttribute("pageMaker", pageMaker);
		return "board/list";
	}
	
	@GetMapping("/insert")
	public String insert() {
		return "board/insert";
	}
	
	@PostMapping("/insert")
	public String insert(RecipeBoard board) {
		boardService.register(board);
		return "redirect:/board/list";
	}
	
	@RequestMapping("/getBoard")
	public String getBoard(int recipeId, Model model, @ModelAttribute("rcri") ReviewCriteria rcri, @ModelAttribute("cri") Criteria cri) {
		RecipeBoard vo = boardService.getBoard(recipeId);
		model.addAttribute("vo", vo);
		List<RecipeReview> list = reviewService.list(recipeId, rcri);
		model.addAttribute("list", list);
		ReviewPageMaker rpageMaker = new ReviewPageMaker();
		rpageMaker.setRcri(rcri);
		rpageMaker.setTotalCount(reviewService.totalCount(recipeId, rcri));
		model.addAttribute("rpageMaker", rpageMaker);
		return "board/get";
	}
	
	@GetMapping("/modify")
	public String modify(int recipeId, Model model, @ModelAttribute("cri") Criteria cri) {
		RecipeBoard vo = boardService.getBoard(recipeId);
		model.addAttribute("vo", vo);
		return "board/modify";
	}
	
	@PostMapping("/modify")
	public String modify(RecipeBoard vo, Criteria cri, RedirectAttributes rttr) {
		boardService.modify(vo);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list";
	}
	
	@GetMapping("/remove")
	public String remove(int recipeId, Criteria cri, RedirectAttributes rttr) {
		boardService.remove(recipeId);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list";
	}
}

package kr.ac.kopo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.model.Criteria;
import kr.ac.kopo.model.PageMaker;
import kr.ac.kopo.model.QueryBoard;
import kr.ac.kopo.service.QueryBoardService;

@Controller
@RequestMapping("/query/*")
public class QueryBoardController {

	@Autowired
	private QueryBoardService boardService;
	
	@RequestMapping("/list")
	public String list(Criteria cri, Model model) {
		List<QueryBoard> list = boardService.list(cri);
		model.addAttribute("list", list);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardService.totalCount(cri));
		model.addAttribute("pageMaker", pageMaker);
		return "query/list";
	}
	
	@GetMapping("/insert")
	public String insert() {
		return "query/insert";
	}
	
	@PostMapping("/insert")
	public String insert(QueryBoard vo) {
		boardService.insert(vo);
		return "redirect:/query/list";
	}
	
	@GetMapping(value = "/getQuery", produces = "application/json; charset=UTF-8")
	public @ResponseBody Map<String, Object> getQuery(int queryId) {
		return boardService.getQuery(queryId);
	}
	
	@PostMapping("/update")
	public @ResponseBody String update(QueryBoard vo) {
		boardService.update(vo);
		return "success";
	}
	
	@PostMapping("/delete")
	public @ResponseBody String delete(int queryId) {
		boardService.delete(queryId);
		return "success";
	}
}

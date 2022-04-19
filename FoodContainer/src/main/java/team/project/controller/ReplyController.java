package team.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.project.service.ReplyService;
import team.project.vo.MemberVO;
import team.project.vo.RecipeVO;
import team.project.vo.ReplyVO;

@Controller
public class ReplyController {
	@Autowired
	private ReplyService replyService;
	
	
	
	
	
	@RequestMapping(value = "/wirteReply",method = RequestMethod.POST)
	public String wirteReply(ReplyVO vo,RedirectAttributes rttr,HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		//회원
		MemberVO member = (MemberVO)session.getAttribute("member");
		vo.setMember_index(member.getMember_index());
		
		
		
		System.out.println("==============================");
		System.out.println(vo.getRecipe_index());
		
//		rttr.addAttribute("recipe_index",vo.getRecipe_index());
//		rttr.addAttribute("member_index",vo.getMember_index());
//		rttr.addAttribute("contents", vo.getContents());
		replyService.writeReply(vo);
		return "redirect:recipeview.do?recipe_index="+vo.getRecipe_index();
	}
	
	
}

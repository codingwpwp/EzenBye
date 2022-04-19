package team.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.project.service.ReplyService;
import team.project.vo.MemberVO;
import team.project.vo.ReplyVO;

@Controller
public class ReplyController {
	@Autowired
	private ReplyService replyService;
	
	
	
	
	//댓글 작성
	@RequestMapping(value = "/wirteReply",method = RequestMethod.POST)
	public String wirteReply(ReplyVO vo,RedirectAttributes rttr,HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		//회원
		MemberVO member = (MemberVO)session.getAttribute("member");
		vo.setMember_index(member.getMember_index());
		replyService.writeReply(vo);
		return "redirect:recipeview.do?recipe_index="+vo.getRecipe_index();
	}
	
	//댓글 수정 GET
//		@RequestMapping(value="/recipeview_reply_modify.do", method = RequestMethod.GET)
//		public String replyUpdateView(ReplyVO vo, Model model) throws Exception {
//			
//			
//			model.addAttribute("updateReply",vo);
//			
//			
//			return "board/updateReply";
//		}
		
		//댓글 수정 POST
		@RequestMapping(value="/updateReply", method = RequestMethod.POST)
		public String updateReply(ReplyVO vo, HttpServletRequest request) throws Exception {
			
			HttpSession session = request.getSession();
			MemberVO member = (MemberVO)session.getAttribute("member");
			
			vo.setReply_index(vo.getReply_index());
			vo.setRecipe_index(vo.getRecipe_index());
			vo.setMember_index(member.getMember_index());
			vo.setContents(vo.getContents());
			replyService.updateReply(vo);
			
			
			
			return "redirect:/board/readView";
		}
	
	
	
}

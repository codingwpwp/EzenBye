package team.project.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.project.service.ReplyService;
import team.project.vo.MemberVO;
import team.project.vo.RecipeVO;
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
	
	//댓글 수정 POST
	@RequestMapping(value="/updateReply.do", method = RequestMethod.POST)
	@ResponseBody
	public ReplyVO replyUpdate(ReplyVO vo) throws Exception {
		replyService.updateReply(vo);  
		
		ReplyVO updateVO = replyService.selectReply(vo.getReply_index());
		
		return updateVO;
	}
	//댓글 삭제
	@ResponseBody
	@RequestMapping(value="/deleteReply.do",method=RequestMethod.POST)
	public String replyDelete(ReplyVO vo,@RequestParam(value="reply_index")int reply_index,RecipeVO reicpevo,HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		//회원
		MemberVO member = (MemberVO)session.getAttribute("member");
		vo.setMember_index(member.getMember_index());
		replyService.deleteReply(reply_index);
		
		return "redirect:recipeview.do?recipe_index="+vo.getRecipe_index();
		
	
		
	}
	
	
	
}

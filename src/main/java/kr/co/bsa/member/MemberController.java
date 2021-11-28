package kr.co.bsa.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;

    //forward /WEB-INF/jsp/member/add.jsp
    @GetMapping("/members/form")
    public ModelAndView enrollMember() {
        ModelAndView mav = new ModelAndView("member/add");
        return mav;
    }

    //redirect /bsa/silages
    @PostMapping("members")
    public ModelAndView enrollMember(Member member) {
        ModelAndView mav = new ModelAndView(new RedirectView("/bsa/silages"));
        memberService.insertMember(member);
        return mav;
    }

    //forward /WEB-INF/jsp/member/view.jsp
    @GetMapping("members/{memberCode}")
    public ModelAndView searchMember(Member member) {
        ModelAndView mav = new ModelAndView("member/view");
        member = memberService.selectMember(member);
        mav.addObject("member", member);
        return mav;
    }

    //forward /WEB-INF/jsp/member/edit.jsp
    @GetMapping("/members/{memberCode}/form")
    public ModelAndView editMemberForm(Member member, @PathVariable int no) {
        ModelAndView mav = new ModelAndView("/member/edit.jsp");
        member.setMemberCode(no);
        memberService.selectMember(member);
        mav.addObject("member", member);
        return mav;
    }

    //redirect /bsa/member/{memberCode}
    @PutMapping("/members")
    public ModelAndView editMember(Member member) {
        ModelAndView mav = new ModelAndView(new RedirectView("/bsa/member/{" + member.getMemberCode() + "}"));
        memberService.updateMember(member);
        mav.addObject("member", member);
        return mav;
    }

    //redirect /bsa/silage
    @DeleteMapping("members")
    public ModelAndView removeMember(Member member) {
        ModelAndView mav = new ModelAndView(new RedirectView("/bsa/silage"));
        memberService.deleteMember(member);
        return mav;
    }
}

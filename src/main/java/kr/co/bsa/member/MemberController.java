package kr.co.bsa.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

    //forward /WEB-INF/jsp/member/add.jsp
    @GetMapping("/member/form")
    public ModelAndView enrollMember() {
        return null;
    }

    //redirect /bsa/silages
    @PostMapping("members")
    public ModelAndView enrollMember(Member member) {
        return null;
    }

    //forward /WEB-INF/jsp/member/view.jsp
    @GetMapping("members/{memberCode}")
    public ModelAndView searchMember(Member member) {
        return null;
    }

    //forward /WEB-INF/jsp/member/edit.jsp
    @GetMapping("/members/{memberCode}/form")
    public ModelAndView editMemberForm(Member member) {
        return null;
    }

    //redirect /bsa/member/{memberCode}
    @PutMapping("/members")
    public ModelAndView editMember(Member member) {
        return null;
    }

    //redirect /bsa/silage
    @DeleteMapping("members")
    public ModelAndView removeMember(Member member) {
        return null;
    }
}

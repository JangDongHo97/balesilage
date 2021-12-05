package kr.co.bsa.common;

import kr.co.bsa.member.Member;
import kr.co.bsa.member.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/bsa")
public class CommonController {
    @Autowired
    private LoginService loginService;
    @Autowired
    private MemberService memberService;

    //forward /WEB-INF/jsp/common/login.jsp
    @GetMapping("/login")
    public ModelAndView login() {
        ModelAndView mav = new ModelAndView("common/login");
        return mav;
    }

    //redirect /bsa/silages
    @PostMapping("/login")
    public ModelAndView login(@Valid Member member, BindingResult bindingResult, HttpSession session) {
        ModelAndView mav = null;
        Member afterMember = loginService.login(member);
        try {
            //회원일 시
            if (afterMember.getMemberStatus() == 'Y') {
                mav = new ModelAndView(new RedirectView("/bsa/silages"));
                session.setAttribute("memberCode", afterMember.getMemberCode());

                //관리자일 시
            } else if(afterMember.getMemberStatus() == 'A') {
                mav = new ModelAndView(new RedirectView("/bsa/silages"));
                session.setAttribute("memberCode", 1);

                //탈퇴회원, 비회원일 시
            } else {
                session.setAttribute("loginErrorMsg", "등록된 회원 정보가 없습니다.");
                mav = new ModelAndView(new RedirectView("/bsa/login"));
            }
        } catch (NullPointerException e) {
            session.setAttribute("loginErrorMsg", "등록된 회원 정보가 없습니다.");
            mav = new ModelAndView(new RedirectView("/bsa/login"));
        }
        return mav;
    }

    //redirect /bsa/silages
    @GetMapping("/logout")
    public ModelAndView logout(HttpSession session){
        ModelAndView mav = new ModelAndView(new RedirectView("/bsa/silages"));
        session.invalidate();
        return mav;
    }

    //forward /WEB-INF/jsp/common/auth.jsp
    @GetMapping("/auth")
    public ModelAndView checkAuth() {
        ModelAndView mav = new ModelAndView("common/auth");
        return mav;
    }

    //redirect /bsa/member/{memberCode}/form
    @PostMapping("/auth")
    public ModelAndView checkAuth(Member member, HttpSession session) {
        member.setMemberCode((int) session.getAttribute("memberCode"));
        if(loginService.auth(member)) {
            ModelAndView mav = new ModelAndView(new RedirectView("/bsa/members/" + member.getMemberCode()));
            return mav;
        }
        ModelAndView mav = new ModelAndView("common/auth");
        return mav;
    }
}

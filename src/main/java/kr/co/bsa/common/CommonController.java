package kr.co.bsa.common;

import kr.co.bsa.member.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class CommonController {
    @Autowired
    private LoginService loginService;

    //forward /WEB-INF/jsp/common/login.jsp
    @GetMapping("/login")
    public ModelAndView login(HttpServletResponse response) {
        ModelAndView mav = new ModelAndView("common/login");
        return mav;
    }

    //redirect /bsa/silages
    @PostMapping("/login")
    public ModelAndView login(@Valid Member member, BindingResult bindingResult, HttpSession session) {
        ModelAndView mav = null;
        Member afterMember = loginService.login(member);
        //null값 검증
        if(bindingResult.hasErrors()) {
            mav = new ModelAndView(new RedirectView("/login"));
            session.setAttribute("loginErrorMsg", "회원정보를 입력해주세요");
            return mav;
        }
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
                    mav = new ModelAndView(new RedirectView("/login"));
                }
            } catch (NullPointerException e) {
                mav = new ModelAndView(new RedirectView("/login"));
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

    //forward /WEB-INF/jsp/common/error404.jsp
    @GetMapping("/error404")
    public ModelAndView view404Error() {
        ModelAndView mav = new ModelAndView(new RedirectView("/common/error404"));
        return mav;
    }

    //forward /WEB-INF/jsp/common/error500.jsp
    @GetMapping("/error500")
    public ModelAndView view500Error() {
        ModelAndView mav = new ModelAndView(new RedirectView("/common/error500"));
        return mav;
    }

    //forward /WEB-INF/jsp/common/auth.jsp
    @GetMapping("/bsa/auth")
    public ModelAndView checkAuth() {
        ModelAndView mav = new ModelAndView("common/auth");
        return mav;
    }

    //redirect /bsa/member/{memberCode}/form
    @PostMapping("/bsa/auth")
    public ModelAndView checkAuth(Member member, HttpSession session) {
        member.setMemberCode((int) session.getAttribute("memberCode"));
        if(loginService.auth(member)) {
            ModelAndView mav = new ModelAndView(new RedirectView("/members/" + member.getMemberCode()));
            return mav;
        }
        ModelAndView mav = new ModelAndView("common/auth");
        return mav;
    }
}

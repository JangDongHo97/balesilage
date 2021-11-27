package kr.co.bsa.common;

import kr.co.bsa.member.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;

@Controller
public class CommonController {
    @Autowired
    private LoginService loginService;

    //forward /WEB-INF/jsp/common/login.jsp
    @GetMapping("/login")
    public ModelAndView login() {
        ModelAndView mav = new ModelAndView("common/login");
        return mav;
    }

    //redirect /bsa/silages
    @PostMapping("/login")
    public ModelAndView login(Member member, HttpSession session) {
        ModelAndView mav = null;
        char memberStatus = loginService.login(member);
        //회원일 시
        if (memberStatus == 'Y') {
            mav = new ModelAndView(new RedirectView("/bsa/silages"));
            session.setAttribute("id", member.getMemberCode());
        //관리자일 시
        } else if(memberStatus == 'A') {
            mav = new ModelAndView(new RedirectView("/bsa/silages"));
            session.setAttribute("id", "admin");
        //탈퇴회원, 비회원일 시
        } else {
            mav = new ModelAndView(new RedirectView("/login"));
        }
        return mav;
    }

    //redirect /bsa/silages
    @GetMapping("logout")
    public ModelAndView logout(HttpSession session){
        ModelAndView mav = new ModelAndView(new RedirectView("/bsa/silages"));
        session.invalidate();
        return mav;
    }

    //forward /WEB-INF/jsp/common/error404.jsp
    @GetMapping("/error404")
    public ModelAndView view404Error() {
        return null;
    }

    //forward /WEB-INF/jsp/common/error500.jsp
    @GetMapping("/error500")
    public ModelAndView view500Error() {
        return null;
    }

    //forward /WEB-INF/jsp/common/auth.jsp
    @GetMapping("/auth")
    public ModelAndView checkAuth() {
        return null;
    }

    //redirect /bsa/member/{memberCode}/form
    @PostMapping("/auth")
    public ModelAndView checkAuth(Member member) {
        return null;
    }
}

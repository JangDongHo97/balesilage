package kr.co.bsa.common;

import kr.co.bsa.member.Member;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class CommonController {
    @Autowired
    private LoginService loginService;

    private Logger logger = LogManager.getLogger(CommonController.class);

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
            logger.debug("@@@@@@@@@@@@@@@@@에러 탔음");
            mav = new ModelAndView(new RedirectView("/login"));
            session.setAttribute("loginErrorMsg", "회원정보가 일치하지 않습니다");
            return mav;
        }
            try {
                //회원일 시
                if (afterMember.getMemberStatus() == 'Y') {
                    mav = new ModelAndView(new RedirectView("/bsa/silages"));
                    logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@회원처리");
                    logger.debug(afterMember);
                    session.setAttribute("memberCode", afterMember.getMemberCode());

                    //관리자일 시
                } else if(afterMember.getMemberStatus() == 'A') {
                    mav = new ModelAndView(new RedirectView("/bsa/silages"));
                    logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@관리자처리");
                    logger.debug(afterMember);
                    session.setAttribute("memberCode", 1);

                    //탈퇴회원, 비회원일 시
                } else {
                    mav = new ModelAndView(new RedirectView("/login"));
                    logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@비회원처리");
                    logger.debug(afterMember);
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
            ModelAndView mav = new ModelAndView(new RedirectView("/members/form/" + member.getMemberCode()));
            return mav;
        }
        ModelAndView mav = new ModelAndView("common/auth");
        return mav;
    }
}

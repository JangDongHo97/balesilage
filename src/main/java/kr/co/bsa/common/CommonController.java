package kr.co.bsa.common;

import kr.co.bsa.member.Member;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

public class CommonController {

    //forward /WEB-INF/jsp/common/login.jsp
    @GetMapping("/login")
    public ModelAndView login() {
        return null;
    }

    //redirect /bsa/silages
    @PostMapping("/login")
    public ModelAndView login(Member member) {
        return null;
    }

    //redirect /bsa/silages
    @GetMapping("logout")
    public ModelAndView logout(HttpSession session){
        return null;
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

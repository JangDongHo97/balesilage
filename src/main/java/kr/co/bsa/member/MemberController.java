package kr.co.bsa.member;

import kr.co.bsa.account.Account;
import kr.co.bsa.account.AccountService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;

    @Autowired
    private AccountService accountService;

    private Logger logger = LogManager.getLogger(MemberController.class);

    //forward /WEB-INF/jsp/member/add.jsp
    @GetMapping("/members/form")
    public ModelAndView enrollMember() {
        ModelAndView mav = new ModelAndView("member/add");
        return mav;
    }

    //redirect /bsa/silages
    @PostMapping("/members")
    public ModelAndView enrollMember(@Valid Member member, Account account,
                                     BindingResult bindingResult, HttpSession session) {
        ModelAndView mav = null;

        logger.debug(member);
        logger.debug(account);

        try {
            mav = new ModelAndView(new RedirectView("/bsa/silages"));
            memberService.insertMember(member);
            member = memberService.selectMember(member);
            account.setMemberCode(member.getMemberCode());
            accountService.insertAccount(account);
        } catch (DuplicateKeyException e) {
            mav = new ModelAndView(new RedirectView("/members/form"));
            session.setAttribute("enrollErrorMsg", "아이디가 중복입니다.");
        }
        return mav;
    }

    //forward /WEB-INF/jsp/member/view.jsp
    @GetMapping("/members/{memberCode}")
    public ModelAndView searchMember(Member member) {
        ModelAndView mav = new ModelAndView("/member/view");
        member = memberService.selectMember(member);
        Account account = accountService.selectAccount(member);
        mav.addObject("member", member);
        mav.addObject("account", account);
        return mav;
    }

    //forward /WEB-INF/jsp/member/edit.jsp
    @GetMapping("/members/{memberCode}/form")
    public ModelAndView editMemberForm(Member member, @PathVariable int no) {
        ModelAndView mav = new ModelAndView("/member/edit");
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
    @DeleteMapping("/members")
    public ModelAndView removeMember(Member member) {
        ModelAndView mav = new ModelAndView(new RedirectView("/bsa/silage"));
        memberService.deleteMember(member);
        return mav;
    }
}

package kr.co.bsa.member;

import kr.co.bsa.account.Account;
import kr.co.bsa.account.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/bsa")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @Autowired
    private AccountService accountService;

    @GetMapping("/members/form")
    public ModelAndView enrollMember() {
        ModelAndView mav = new ModelAndView("member/add");

        return mav;
    }

    @PostMapping("/members")
    public ModelAndView enrollMember(@Valid Member member, Account account, HttpSession session) {
        ModelAndView mav = null;
        try {
            Member afteMmember = memberService.selectMember(member);
            if (afteMmember == null) {
                mav = new ModelAndView(new RedirectView("/bsa/silages"));
                memberService.insertMember(member);
                if (account.getAccountNo() != null) {
                    account.setMemberCode(member.getMemberCode());
                    accountService.insertAccount(account);
                }

                return mav;
            }
            mav = new ModelAndView(new RedirectView("/bsa/members/form"));
            session.setAttribute("enrollErrorMsg", "이미 사용 중인 아이디입니다");

            return mav;

        } catch (DuplicateKeyException e) {
            mav = new ModelAndView(new RedirectView("/bsa/members/form"));
            session.setAttribute("enrollErrorMsg", "이미 사용 중인 아이디입니다");

            return mav;
        }
    }

    @GetMapping("/members/{memberCode}")
    public ModelAndView searchMember(Member member) {
        member = memberService.selectMember(member);
        Account account = accountService.selectAccount(member);

        ModelAndView mav = new ModelAndView("member/view");
        mav.addObject("member", member);
        mav.addObject("account", account);

        return mav;
    }

    @GetMapping("/members/form/{memberCode}")
    public ModelAndView editMemberForm(Member member, @PathVariable int memberCode) {
        ModelAndView mav = new ModelAndView("member/edit");
        member.setMemberCode(memberCode);
        member = memberService.selectMember(member);

        Account account = accountService.selectAccount(member);
        mav.addObject("member", member);
        mav.addObject("account", account);

        return mav;
    }

    @PutMapping("/members/{memberCode}")
    public ModelAndView editMember(Member member, @PathVariable int memberCode, Account account) {
        ModelAndView mav = new ModelAndView(new RedirectView("/bsa/members/" + member.getMemberCode()));

        member.setMemberCode(memberCode);
        memberService.updateMember(member);

        Account afterAccount = accountService.selectAccount(member);
        if (afterAccount == null) {
            accountService.insertAccount(account);
        }

        try {
            accountService.selectAccount(member).getAccountCode();
            accountService.updateAccount(account);
        } catch (NullPointerException e) {
            accountService.insertAccount(account);
        }
        mav.addObject("member", member);

        return mav;
    }

    @DeleteMapping("/members")
    public ModelAndView removeMember(Member member) {
        memberService.deleteMember(member);

        ModelAndView mav = new ModelAndView("/bsa/logout");
        return mav;
    }
}

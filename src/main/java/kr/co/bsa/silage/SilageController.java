package kr.co.bsa.silage;

import kr.co.bsa.account.Account;
import kr.co.bsa.account.AccountService;
import kr.co.bsa.common.DateCommand;
import kr.co.bsa.member.Member;
import kr.co.bsa.member.MemberService;
import kr.co.bsa.transaction.Transaction;
import kr.co.bsa.transaction.TransactionService;
import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/bsa")
public class SilageController {
    @Autowired
    private SilageService silageService;
    @Autowired
    private MemberService memberService;
    @Autowired
    private TransactionService transactionService;
    @Autowired
    private AccountService accountService;

    //forward /WEB-INF/jsp/silage/add.jsp
    @GetMapping("/silages/form")
    public ModelAndView enrollSilage(HttpSession session) {
        ModelAndView mav = new ModelAndView();

        int memberCode = (Integer)session.getAttribute("memberCode");
        Member member = new Member();
        member.setMemberCode(memberCode);

        Account account = accountService.selectAccount(member);

        try {
            if(!account.getBankName().trim().equals("") && !account.getAccountNo().trim().equals("")) {
                mav.setViewName("silage/add");
            }
        } catch (NullPointerException e) {
            mav.setViewName("redirect:/bsa/silages");
            session.setAttribute("accountErrorMsg", "곤포 사일리지를 등록하시려면 계좌 정보를 등록해주세요");
        }
        return mav;
    }

    //redirect /bsa/silages
    @PostMapping("/silages")
    public ModelAndView enrollSilage(Silage silage, HttpSession session) {
        silageService.insertSilage(silage, (Integer)session.getAttribute("memberCode"));

        return new ModelAndView(new RedirectView("/bsa/silages"));
    }

    //forward /WEB-INF/jsp/silage/mySilage.jsp
    @GetMapping("/silages/mine")
    public ModelAndView searchMySilage(DateCommand dateCommand,HttpSession session) {
        List<Silage> silages = silageService.selectSilageList(dateCommand);
        List<Silage> afterSilages = new ArrayList<Silage>();

        Iterator<Silage> silageIterator = silages.iterator();
        while (silageIterator.hasNext()) {
            Silage iter = silageIterator.next();
            if(iter.getSellerCode() == (Integer)session.getAttribute("memberCode")) {
                afterSilages.add(iter);
            }
        }

        ModelAndView mav = new ModelAndView();
        mav.addObject("silages",afterSilages);
        mav.addObject("memberCode",(Integer)session.getAttribute("memberCode"));
        mav.setViewName("silage/mySilage");

        return mav;
    }

    //forward /WEB-INF/jsp/silage/main.jsp
    @GetMapping("/silages")
    public ModelAndView searchSilageList(DateCommand dateCommand, HttpSession session) {
        List<Silage> silages = silageService.selectSilageList(dateCommand);
        ModelAndView mav = new ModelAndView();

        try{
            int memberCode = (Integer)session.getAttribute("memberCode");
            Member member = new Member();
            member.setMemberCode(memberCode);
            member = memberService.selectMember(member);

            mav.addObject("member", member);
        } catch (NullPointerException e) {
            mav.addObject("silages",silages);
            mav.setViewName("silage/main");

            return mav;
        }

        mav.addObject("silages",silages);
        mav.setViewName("silage/main");

        return mav;
    }

    //forward /WEB-INF/jsp/silage/view.jsp
    @GetMapping("/silages/{silageCode}")
    public ModelAndView searchSilage(Silage silage, HttpSession session) {
        List<Silage> afterSilages = silageService.selectSilage(silage);
        int silageCode = silage.getSilageCode();

        Transaction transaction = new Transaction();
        transaction.setSilageCode(silageCode);
        transaction = transactionService.selectTransaction(transaction);

        ModelAndView mav = new ModelAndView();
        mav.addObject("silage", afterSilages.get(0));
        mav.addObject("transaction", transaction);
        mav.addObject("auth",session.getAttribute("memberCode"));
        mav.setViewName("silage/view");

        return mav;
    }

    //forward /WEB-INF/jsp/silage/edit.jsp
    @GetMapping("/silages/form/{silageCode}")
    public ModelAndView editSilageForm(Silage silage) {
        silage = silageService.selectSilage(silage).get(0);

        ModelAndView mav = null;
        if(silage.getTransactionStatus() == 'Y'){
            mav = new ModelAndView();
            mav.addObject("silage", silage);
            mav.setViewName("silage/edit");
        } else {
            mav = new ModelAndView(new RedirectView("/bsa/silages/" + silage.getSilageCode()));
        }

        return mav;
    }

    //redirect /bsa/silages
    @PutMapping("/silages")
    public ModelAndView editSilage(Silage silage) {
        ModelAndView mav = new ModelAndView("redirect: /bsa/silages");
        silageService.updateSilage(silage);
        return mav;
    }

    //redirect /bsa/silages
    @DeleteMapping("/silages")
    public ModelAndView removeSilage(Silage silage) {
        ModelAndView mav = new ModelAndView("redirect: /bsa/silages");
        silageService.deleteSilage(silage);
        return mav;
    }

    @PostMapping(value = "/silages/place", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Member searchSilagePlace(@RequestBody(required = false) Member member) {
        return memberService.selectMember(member);
    }

    @PostMapping(value = "/silages", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public List<Silage> searchSilageScope(@RequestBody(required = false) DateCommand dateCommand
            , HttpSession session) {
        int presentMember = (Integer) session.getAttribute("memberCode");
        List<Silage> silages = silageService.selectSilageList(dateCommand);
        List<Silage> afterSilages = new ArrayList<Silage>();

        Iterator<Silage> iterator = silages.iterator();
        while (iterator.hasNext()) {
            Silage iterSilage = iterator.next();
            if(iterSilage.getSellerCode() == presentMember) {
                afterSilages.add(iterSilage);
            }
        }
        return afterSilages;
    }

    @PostMapping(value = "/silages/status", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public List<Silage> searchSilageStatus(@RequestBody(required = false) Silage silage
            , HttpSession session) {
        char status = silage.getTransactionStatus();
        int presentMember = (Integer) session.getAttribute("memberCode");
        List<Silage> silages = silageService.selectSilageList(new DateCommand());

        System.out.println("@@@@@@@@@" + status);

        List<Silage> afterSilages = new ArrayList<Silage>();
        Iterator<Silage> iterator = silages.iterator();
        while (iterator.hasNext()) {
            Silage iterSilage = iterator.next();
            if(status == 0) {
                if(iterSilage.getSellerCode() == presentMember) {
                    afterSilages.add(iterSilage);
                }
            } else {
                if(iterSilage.getTransactionStatus() == status
                        && iterSilage.getSellerCode() == presentMember) {
                    afterSilages.add(iterSilage);
                }
            }
        }
        return afterSilages;
    }

    @PostMapping(value = "/silages/order", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public List<Silage> searchSilageOrderBy(@RequestBody(required = false)Map<String, String> orderMap) {
        int orderCode;
        String orderStandard = orderMap.get("orderStandard");
        Silage silage = new Silage();

        if(orderStandard.equals("unitP1")) {
            orderCode = 1;
            silage.setUnitPrice(orderCode);
        } else if(orderStandard.equals("unitP2")){
            orderCode = 2;
            silage.setUnitPrice(orderCode);
        } else if(orderStandard.equals("count1")){
            orderCode = 1;
            silage.setCount(orderCode);
        } else if(orderStandard.equals("count2")){
            orderCode = 2;
            silage.setCount(orderCode);
        }

        List<Silage> silages = silageService.selectSilage(silage);

        return silages;
    }
}

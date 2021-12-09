package kr.co.bsa.silage;

import kr.co.bsa.account.Account;
import kr.co.bsa.account.AccountService;
import kr.co.bsa.common.DateCommand;
import kr.co.bsa.common.Navigator;
import kr.co.bsa.member.Member;
import kr.co.bsa.member.MemberService;
import kr.co.bsa.transaction.Transaction;
import kr.co.bsa.transaction.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;
import java.util.*;

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
    @Autowired
    private Navigator navigator;

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
            if (memberCode != 1) {
                session.setAttribute("accountErrorMsg", "곤포 사일리지를 등록하시려면 계좌 정보를 등록해주세요");
            }
            mav.setViewName("redirect:/bsa/silages");
        }
        return mav;
    }

    //redirect /bsa/silages
    @PostMapping("/silages")
    public ModelAndView enrollSilage(Silage silage, HttpSession session) {
        silageService.insertSilage(silage, (Integer)session.getAttribute("memberCode"));

        return new ModelAndView(new RedirectView("/bsa/silages"));
    }

    @GetMapping("/silages/mine")
    public ModelAndView mySilageForm() {
        return new ModelAndView("silage/mySilage");
    }

    //forward /WEB-INF/jsp/silage/mySilage.jsp
    @PostMapping(value = "/silages/mine", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Map<String, Object> searchMySilage(@RequestBody(required = false) DateCommand dateCommand,HttpSession session) {
        int silageCount;
        Map<String, Object> result = new HashMap<>();

        DateCommand initCommand = new DateCommand();
        initCommand.setPageNo(-1);
        initCommand.setStartDate(dateCommand.getStartDate().trim());
        initCommand.setEndDate(dateCommand.getEndDate().trim());
        initCommand.setTransactionStatus(dateCommand.getTransactionStatus());
        initCommand.setSellerCode((Integer)session.getAttribute("memberCode"));

        silageCount = silageService.selectSilageList(initCommand).size();

        String navigatorHtml = navigator.getNavigator(silageCount, dateCommand.getPageNo());

        dateCommand.setPageNo((dateCommand.getPageNo() * 10));
        dateCommand.setSellerCode((Integer)session.getAttribute("memberCode"));

        List<Silage> silages = silageService.selectSilageList(dateCommand);

        result.put("navigator", navigatorHtml);
        result.put("silages", silages);

        return result;












//        List<Silage> silages = silageService.selectSilageList(dateCommand);
//        List<Silage> afterSilages = new ArrayList<Silage>();
//
//        Iterator<Silage> silageIterator = silages.iterator();
//        while (silageIterator.hasNext()) {
//            Silage iter = silageIterator.next();
//            if(iter.getSellerCode() == (Integer)session.getAttribute("memberCode")) {
//                afterSilages.add(iter);
//            }
//        }
//
//        ModelAndView mav = new ModelAndView();
//        mav.addObject("silages",afterSilages);
//        mav.addObject("memberCode",(Integer)session.getAttribute("memberCode"));
//        mav.setViewName("silage/mySilage");
//
    }

    //forward /WEB-INF/jsp/silage/main.jsp
    @GetMapping("/silages")
    public ModelAndView mainForm() {
        return new ModelAndView("silage/main");
    }

    @PostMapping(value = "/silages/list", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    //메인 폼을 보여주는 요청
    public Map<String, Object> searchSilageList(@RequestBody(required = false) DateCommand dateCommand, HttpSession session) {
        int silageCount;
        Map<String, Object> result = new HashMap<>();

        DateCommand initCommand = new DateCommand();
        initCommand.setPageNo(-1);
        initCommand.setOrderStandard(dateCommand.getOrderStandard().trim());
        initCommand.setTransactionStatus('Y');

        silageCount = silageService.selectSilageList(initCommand).size();

        String navigatorHtml = navigator.getNavigator(silageCount, dateCommand.getPageNo());
        result.put("navigator", navigatorHtml);

        // 화면에 뿌려줄 데이터
        dateCommand.setPageNo((dateCommand.getPageNo() * 10));
        dateCommand.setTransactionStatus('Y');
        List<Silage> silages = silageService.selectSilageList(dateCommand);
        result.put("silages", silages);

//        try{
//            int memberCode = (Integer)session.getAttribute("memberCode");
//            Member member = new Member();
//            member.setMemberCode(memberCode);
//            member = memberService.selectMember(member);
//
//            result.put("member", member);
//        } catch (NullPointerException e) {
//            return result;
//        }

        return result;
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

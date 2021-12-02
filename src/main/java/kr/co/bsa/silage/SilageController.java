package kr.co.bsa.silage;

import kr.co.bsa.common.DateCommand;
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
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Controller
@RequestMapping("/bsa")
public class SilageController {
    @Autowired
    private SilageService silageService;
    @Autowired
    private MemberService memberService;
    @Autowired
    private TransactionService transactionService;

    //forward /WEB-INF/jsp/silage/add.jsp
    @GetMapping("/silages/form")
    public ModelAndView enrollSilage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("silage/add");

        return mav;
    }

    //redirect /bsa/silages
    @PostMapping("/silages")
    public ModelAndView enrollSilage(Silage silage, HttpSession session) {
//        int memberCode = Integer.valueOf(
//                                    String.valueOf(session.getAttribute("memberCode"))
//                        );
        silageService.insertSilage(silage, (Integer)session.getAttribute("memberCode"));

        return new ModelAndView(new RedirectView("/bsa/silages"));
    }

    //forward /WEB-INF/jsp/silage/mySilage.jsp
    @GetMapping("/silages/mine")
    public ModelAndView searchMySilage(DateCommand dateCommand,HttpSession session) {
        List<Silage> silages = silageService.selectSilageList(dateCommand);
        List<Transaction> transactions = transactionService.selectTransactionList(dateCommand);

        ModelAndView mav = new ModelAndView();
        mav.addObject("silages",silages);
        mav.addObject("transactions",transactions);
        mav.addObject("memberCode",(Integer)session.getAttribute("memberCode"));
        mav.setViewName("silage/mySilage");

        return mav;
    }

    //forward /WEB-INF/jsp/silage/main.jsp
    @GetMapping("/silages")
    public ModelAndView searchSilageList(DateCommand dateCommand) {
        List<Silage> silages = silageService.selectSilageList(dateCommand);
        List<String> addressList = new ArrayList<String>();

        Iterator<Silage> iter = silages.iterator();
        while(iter.hasNext()) {
            Silage silageIter = iter.next();
            addressList.add(silageIter.getAddress());
        }

        ModelAndView mav = new ModelAndView();
        mav.addObject("silages",silages);
        mav.addObject("addresses", addressList);
        mav.setViewName("silage/main");

        return mav;
    }

    @PostMapping(value = "/silages", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public List<Silage> searchSilageScope(@RequestBody(required = false) DateCommand dateCommand) {
        System.out.println(dateCommand.getStartDate() + "~" + dateCommand.getEndDate());

        return silageService.selectSilageList(dateCommand);
    }

    @PostMapping(value = "/silages/place", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Member searchSilagePlace(@RequestBody(required = false) Member member) {
        System.out.println(member.getId());

        return memberService.selectMember(member);
    }

    //forward /WEB-INF/jsp/silage/view.jsp
    @GetMapping("/silages/{silageCode}")
    public ModelAndView searchSilage(Silage silage, HttpSession session) {
        Silage afterSilage = silageService.selectSilage(silage);

        ModelAndView mav = new ModelAndView();
        mav.addObject("silage", afterSilage);
        mav.addObject("auth",session.getAttribute("memberCode"));
        mav.setViewName("silage/view");

        return mav;
    }

    //forward /WEB-INF/jsp/silage/edit.jsp
    @GetMapping("/silages/form/{silageCode}")
    public ModelAndView editSilageForm(Silage silage) {
        silage = silageService.selectSilage(silage);

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
}

package kr.co.bsa.transaction;

import kr.co.bsa.account.Account;
import kr.co.bsa.account.AccountService;
import kr.co.bsa.member.Member;
import kr.co.bsa.common.DateCommand;
import kr.co.bsa.silage.Silage;
import kr.co.bsa.silage.SilageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/bsa")
public class TransactionController {
    @Autowired
    private TransactionServiceImpl transactionService;
    @Autowired
    private SilageService silageService;
    @Autowired
    private AccountService accountService;

    //forward /WEB-INF/jsp/transaction/notice.jsp
    @GetMapping("/purchases/notice/{silageCode}")
    public ModelAndView alertPurchase(Transaction transaction, @PathVariable int silageCode, HttpSession session) {
        ModelAndView mav = new ModelAndView("transaction/notice");

        //구매하려는 silage 조회
        Silage silage = new Silage();
        silage.setSilageCode(silageCode);
        silage = silageService.selectSilage(silage);

        //판매자 계좌정보 조회
        Member seller = new Member();
        seller.setMemberCode(silage.getSellerCode());
        Account sellerAccount = accountService.selectAccount(seller);

        transaction.setSilageCode(silage.getSilageCode());
        transaction.setSellerCode(silage.getSellerCode());
        transaction.setBuyerCode((Integer) session.getAttribute("memberCode"));
        transaction.setBankName(sellerAccount.getBankName());
        transaction.setAccountNo(sellerAccount.getAccountNo());
        transaction.setTotalPrice(silage.getUnitPrice() * silage.getCount());

        mav.addObject("transaction", transaction);

        return mav;
    }

    //forward /WEB-INF/jsp/transaction/purchaseList.jsp
    @GetMapping("/purchases")
    public ModelAndView searchPurchaseList(Transaction transaction, DateCommand dateCommand) {
        ModelAndView mav = new ModelAndView("/transactino/purchaseList");
        List<Transaction> transactions = transactionService.selectTransactionList(dateCommand);
        mav.addObject("transactions", transactions);

        return mav;
    }

    //forward /WEB-INF/jsp/transaction/purchaseView.jsp
    @GetMapping("/purchases/{transactionCode}")
    public ModelAndView searchPurchase(Transaction transaction) {
        ModelAndView mav = new ModelAndView("transaction/purchaseView");
        transactionService.selectTransaction(transaction);
        mav.addObject("transaction", transaction);

        return mav;
    }

    //redirect /bsa/silages
    @PostMapping("/transactions")
    public ModelAndView enrollTransaction(Transaction transaction) {
        ModelAndView mav = new ModelAndView(new RedirectView("/bsa/silages"));
        transactionService.insertTransaction(transaction);

        return mav;
    }

    //forward /WEB-INF/jsp/transaction/list.jsp
    @GetMapping("/transactions")
    public ModelAndView searchTransactionList(DateCommand dateCommand) {
        ModelAndView mav = new ModelAndView("/transactino/list");
        List<Transaction> transactions = transactionService.selectTransactionList(dateCommand);
        mav.addObject("transactions", transactions);

        return mav;
    }

    //forward /WEB-INF/jsp/transaction/view.jsp
    @GetMapping("/transactions/{transactionCode}")
    public ModelAndView searchTransaction(Transaction transaction) {
        ModelAndView mav = new ModelAndView("/transaction/view");
        transaction = transactionService.selectTransaction(transaction);
        mav.addObject("transaction", transaction);

        return mav;
    }

    //-
    @PutMapping("/transactions/deposit")
    public ModelAndView editDeposit(Transaction transaction) {
        ModelAndView mav = new ModelAndView("/transactions");
        if(transaction.isDepositStatus()) {
            transaction.setDepositStatus(false);
        } else if(!transaction.isDepositStatus()) {
            transaction.setDepositStatus(true);
        }
        mav.addObject("transaction", transaction);

        return mav;
    }

    //-
    @PutMapping("/transactions/remit")
    public ModelAndView editRemit(Transaction transaction) {
        ModelAndView mav = new ModelAndView("/transactions");
        if(transaction.isRemitStatus()) {
            transaction.setRemitStatus(false);
        } else if(!transaction.isRemitStatus()) {
            transaction.setRemitStatus(true);
        }
        mav.addObject("transaction", transaction);

        return mav;
    }

    //redirect /bsa/silages
    @DeleteMapping("/transactions")
    public ModelAndView removeTransaction(Transaction transaction) {
        ModelAndView mav = new ModelAndView("/bsa/transaction");

        //silage 객체에 거래 상태 Y로 변경
        Silage silage = new Silage();
        silage.setSilageCode(transaction.getSilageCode());
        silage = silageService.selectSilage(silage);
        silage.setTransactionStatus('Y');
        silageService.updateSilage(silage);

        transactionService.deleteTransaction(transaction);

        return mav;
    }
}

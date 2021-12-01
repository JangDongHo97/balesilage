package kr.co.bsa.transaction;

import kr.co.bsa.common.DateCommand;
import kr.co.bsa.silage.Silage;
import kr.co.bsa.silage.SilageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/bsa")
public class TransactionController {
    @Autowired
    private TransactionServiceImpl transactionService;
    @Autowired
    private SilageService silageService;

    //forward /WEB-INF/jsp/transaction/notice.jsp
    @GetMapping("/purchases/notice")
    public ModelAndView alertPurchase(Transaction transaction) {
        ModelAndView mav = new ModelAndView("transaction/notice");

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
    @PostMapping("/transactions/{silageCode}")
    public ModelAndView enrollTransaction(Transaction transaction, @PathVariable int silageCode, HttpSession session) {
        ModelAndView mav = new ModelAndView("bsa/silages");

        //transaction 객체에 사일리지 코드 삽입
        transaction.setSilageCode(silageCode);

        //transaction 객체에 구매자 삽입
        transaction.setBuyerCode((Integer) session.getAttribute("memberCode"));

        //transaction 객체에 판매자 삽입
        Silage silage = new Silage();
        silage.setSilageCode(silageCode);
        silage = silageService.selectSilage(silage);
        transaction.setSellerCode(silage.getSellerCode());

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

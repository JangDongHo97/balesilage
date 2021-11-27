package kr.co.bsa.transaction;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TransactionController {

    //forward /WEB-INF/jsp/transaction/notice.jsp
    @GetMapping("/purchases/notice")
    public ModelAndView alertPurchase() {
        return null;
    }

    //forward /WEB-INF/jsp/transaction/purchaseList.jsp
    @GetMapping("/purchases")
    public ModelAndView searchPurchaseList(Transaction transaction) {
        return null;
    }

    //forward /WEB-INF/jsp/transaction/purchaseView.jsp
    @GetMapping("/purchases/{transactionCode}")
    public ModelAndView searchPurchase(Transaction transaction) {
        return null;
    }

    //redirect /bsa/silages
    @PostMapping("/transactions")
    public ModelAndView enrollTransaction(Transaction transaction) {
        return null;
    }

    //forward /WEB-INF/jsp/transaction/list.jsp
    @GetMapping("/transactions")
    public ModelAndView searchTransactionList() {
        return null;
    }

    //forward /WEB-INF/jsp/transaction/view.jsp
    @GetMapping("/transactions/{transactionCode}")
    public ModelAndView searchTransaction(Transaction transaction) {
        return null;
    }

    //-
    @PutMapping("/transactions")
    public void editTransaction(Transaction transaction) {

    }

    //redirect /bsa/silages
    @DeleteMapping("/bsa/transactions")
    public ModelAndView removeTransaction(Transaction transaction) {
        return null;
    }
}

package kr.co.bsa.transaction;

import kr.co.bsa.account.Account;
import kr.co.bsa.account.AccountService;
import kr.co.bsa.member.Member;
import kr.co.bsa.common.DateCommand;
import kr.co.bsa.member.MemberService;
import kr.co.bsa.silage.Silage;
import kr.co.bsa.silage.SilageService;
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
public class TransactionController {
    @Autowired
    private TransactionServiceImpl transactionService;
    @Autowired
    private SilageService silageService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private MemberService memberService;

    //forward /WEB-INF/jsp/transaction/notice.jsp
    @GetMapping("/purchases/notice/{silageCode}")
    public ModelAndView alertPurchase(Transaction transaction
                                    , @PathVariable int silageCode
                                    , HttpSession session) {
        Silage silage = new Silage();
        silage.setSilageCode(silageCode);
        silage = silageService.selectSilage(silage);

        Member seller = new Member();
        seller.setMemberCode(silage.getSellerCode());
        Account sellerAccount = accountService.selectAccount(seller);

        transaction.setSilageCode(silage.getSilageCode());
        transaction.setSellerCode(silage.getSellerCode());
        transaction.setBuyerCode((Integer) session.getAttribute("memberCode"));
        transaction.setBankName(sellerAccount.getBankName());
        transaction.setAccountNo(sellerAccount.getAccountNo());
        transaction.setTotalPrice(silage.getUnitPrice() * silage.getCount());

        ModelAndView mav = new ModelAndView("transaction/notice");
        mav.addObject("transaction", transaction);

        return mav;
    }

    //forward /WEB-INF/jsp/transaction/purchaseList.jsp
    @GetMapping("/purchases")
    public ModelAndView searchPurchaseList(DateCommand dateCommand, HttpSession session) {
        List<Transaction> transactions = transactionService.selectTransactionList(dateCommand);

        ModelAndView mav = new ModelAndView();
        mav.addObject("memberCode",(Integer)session.getAttribute("memberCode"));
        mav.addObject("transactions", transactions);
        mav.setViewName("/transaction/purchaseList");

        return mav;
    }

    @PostMapping(value = "/purchases", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public List<Transaction> searchTransactionScope(@RequestBody(required = false) DateCommand dateCommand) {
        return transactionService.selectTransactionList(dateCommand);
    }

    @PostMapping(value = "/purchases/member", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public List<Transaction> searchTransactionMember(@RequestBody(required = false) Member member) {
        List<Transaction> transactions = transactionService.selectTransactionList(new DateCommand());
        List<Transaction> afterTransactions = new ArrayList<Transaction>();

        Iterator<Transaction> transactionIterator = transactions.iterator();
        if(member.getId() != null) {
            while(transactionIterator.hasNext()) {
                Transaction iter = transactionIterator.next();
                if(iter.getSellerId() == member.getId()){
                    afterTransactions.add(iter);
                }
            }
            return afterTransactions;
        }
        return transactions;
    }

    //forward /WEB-INF/jsp/transaction/purchaseView.jsp
    @GetMapping("/purchases/{transactionCode}")
    public ModelAndView searchPurchase(Transaction transaction) {
        transaction = transactionService.selectTransaction(transaction);

        int sellerCode = transaction.getSellerCode();
        Member member = new Member();
        member.setMemberCode(sellerCode);
        member = memberService.selectMember(member);

        int silageCode = transaction.getSilageCode();
        Silage silage = new Silage();
        silage.setSilageCode(silageCode);
        silage = silageService.selectSilage(silage);

        ModelAndView mav = new ModelAndView();
        mav.addObject("transaction", transaction);
        mav.addObject("member", member);
        mav.addObject("silage", silage);
        mav.setViewName("transaction/purchaseView");

        return mav;
    }

    //redirect /bsa/silages
    @PostMapping("/transactions")
    public ModelAndView enrollTransaction(Transaction transaction) {
        ModelAndView mav = new ModelAndView(new RedirectView("/bsa/silages"));
        transactionService.insertTransaction(transaction);

        Silage silage = new Silage();
        silage.setSilageCode(transaction.getSilageCode());
        silage.setTransactionStatus('N');

        silageService.updateSilage(silage);

        return mav;
    }

    //forward /WEB-INF/jsp/transaction/list.jsp
    @GetMapping("/transactions")
    public ModelAndView searchTransactionList(DateCommand dateCommand) {
        ModelAndView mav = new ModelAndView("/transaction/list");
        List<Transaction> transactions = transactionService.selectTransactionList(dateCommand);
        mav.addObject("transactions", transactions);

        return mav;
    }
    //-
    @PutMapping("/transactions/deposit")
    @ResponseBody
    public Transaction editDeposit(@RequestBody Transaction transaction) {
        Transaction afterTransaction = transactionService.selectTransaction(transaction);
        if(transaction.isDepositStatus()) {
            afterTransaction.setDepositStatus(false);

            transactionService.updateTransaction(afterTransaction);
        } else {
            afterTransaction.setDepositStatus(true);

            transactionService.updateTransaction(afterTransaction);
        }

        return afterTransaction;
    }

    //-
    @PutMapping("/transactions/remit")
    @ResponseBody
    public Transaction editRemit(@RequestBody Transaction transaction) {
        Transaction afterTransaction = transactionService.selectTransaction(transaction);
        if(afterTransaction.isDepositStatus()) {
            if(transaction.isRemitStatus()) {
                afterTransaction.setRemitStatus(false);

                transactionService.updateTransaction(afterTransaction);
            } else {
                afterTransaction.setRemitStatus(true);

                transactionService.updateTransaction(afterTransaction);
            }
        }

        return afterTransaction;
    }

    //redirect /bsa/silages
    @DeleteMapping("/transactions")
    public ModelAndView removeTransaction(Transaction transaction) {
        //silage 객체에 거래 상태 Y로 변경
        transaction = transactionService.selectTransaction(transaction);

        Silage silage = new Silage();
        silage.setSilageCode(transaction.getSilageCode());
        silage.setTransactionStatus('Y');
        silageService.updateSilage(silage);

        transactionService.deleteTransaction(transaction);

        ModelAndView mav = new ModelAndView(new RedirectView("/bsa/purchases"));

        return mav;
    }

    @DeleteMapping(value="/transactions", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody()
    public List<Transaction> removeAdminTransaction(@RequestBody Transaction transaction) {
        //silage 객체에 거래 상태 Y로 변경
        transaction = transactionService.selectTransaction(transaction);


        List pages = new ArrayList();
        int page[] = new int[5];
        pages.add(page);

        Silage silage = new Silage();
        silage.setSilageCode(transaction.getSilageCode());
        silage.setTransactionStatus('Y');
        silageService.updateSilage(silage);

        transactionService.deleteTransaction(transaction);

        return transactionService.selectTransactionList(new DateCommand());
    }
}

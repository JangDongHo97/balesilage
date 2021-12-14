package kr.co.bsa.transaction;

import kr.co.bsa.account.Account;
import kr.co.bsa.account.AccountService;
import kr.co.bsa.common.Navigator;
import kr.co.bsa.member.Member;
import kr.co.bsa.common.Condition;
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
import java.util.*;

@Controller
@RequestMapping("/bsa")
public class TransactionController {
    @Autowired
    private TransactionService transactionService;
    @Autowired
    private SilageService silageService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private MemberService memberService;
    @Autowired
    private Navigator navigator;

    @GetMapping("/purchases/notice/{silageCode}")
    public ModelAndView alertPurchase(Transaction transaction, @PathVariable int silageCode, HttpSession session) {
        Silage silage = new Silage();
        silage.setSilageCode(silageCode);
        List<Silage> silages = silageService.selectSilage(silage);
        silage = silages.get(0);

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

    @GetMapping(value = "/purchases")
    public ModelAndView purchasesListForm() {
        return new ModelAndView("/transaction/purchaseList");
    }

    @ResponseBody
    @PostMapping(value = "/purchases/list")
    public Map<String, Object> searchPurchaseList(@RequestBody(required = false) Condition condition
                                                   , HttpSession session) {
        int silageCount;
        Map<String, Object> result = new HashMap<>();
        Member member = new Member();
        Condition initCommand = new Condition();

        if (condition.getId() != null && !condition.getId().equals("")) {
            member.setId(condition.getId());
            member = memberService.selectMember(member);

            initCommand.setSellerCode(member.getMemberCode());
            condition.setSellerCode(member.getMemberCode());
        }
        initCommand.setPageNo(-1);
        initCommand.setStartDate(condition.getStartDate().trim());
        initCommand.setEndDate(condition.getEndDate().trim());
        initCommand.setBuyerCode((Integer) session.getAttribute("memberCode"));

        silageCount = transactionService.selectTransactionList(initCommand).size();

        String navigatorHtml = navigator.getNavigator(silageCount, condition.getPageNo());

        condition.setPageNo((condition.getPageNo() * 10));
        condition.setBuyerCode((Integer) session.getAttribute("memberCode"));

        List<Transaction> transactions = transactionService.selectTransactionList(condition);

        result.put("navigator", navigatorHtml);
        result.put("silages", transactions);

        return result;
    }

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
        silage = silageService.selectSilage(silage).get(0);

        ModelAndView mav = new ModelAndView();
        mav.addObject("transaction", transaction);
        mav.addObject("member", member);
        mav.addObject("silage", silage);
        mav.setViewName("transaction/purchaseView");

        return mav;
    }

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

    @GetMapping("/transactions")
    public ModelAndView transactionListForm(Condition condition) {
        ModelAndView mav = new ModelAndView("/transaction/list");

        return mav;
    }

    @PostMapping(value = "/transactions/list", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Map<String, Object> searchTransactionList(@RequestBody(required = false) Condition condition) {
        int silageCount;
        Map<String, Object> result = new HashMap<>();
        Member member = new Member();
        Condition initCommand = new Condition();


        if (condition.getId() != null && !condition.getId().equals("")) {
            member.setId(condition.getId());
            member = memberService.selectMember(member);

            initCommand.setSellerCode(member.getMemberCode());
            initCommand.setBuyerCode(member.getMemberCode());
            condition.setSellerCode(member.getMemberCode());
            condition.setBuyerCode(member.getMemberCode());
        }
        initCommand.setPageNo(-1);
        initCommand.setStartDate(condition.getStartDate().trim());
        initCommand.setEndDate(condition.getEndDate().trim());

        silageCount = transactionService.selectTransactionList(initCommand).size();

        String navigatorHtml = navigator.getNavigator(silageCount, condition.getPageNo());

        condition.setPageNo((condition.getPageNo() * 10));

        List<Transaction> transactions = transactionService.selectTransactionList(condition);

        result.put("navigator", navigatorHtml);
        result.put("silages", transactions);

        return result;
    }

    @DeleteMapping("/transactions")
    public ModelAndView removeTransaction(Transaction transaction) {
        transaction = transactionService.selectTransaction(transaction);

        Silage silage = new Silage();
        silage.setSilageCode(transaction.getSilageCode());
        silage.setTransactionStatus('Y');
        silageService.updateSilage(silage);

        transactionService.deleteTransaction(transaction);

        ModelAndView mav = new ModelAndView(new RedirectView("/bsa/purchases"));

        return mav;
    }

    @PutMapping(value = "/transactions/deposit", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Transaction editDeposit(@RequestBody Transaction transaction) {
        Transaction afterTransaction = transactionService.selectTransaction(transaction);
        if (transaction.isDepositStatus()) {
            afterTransaction.setDepositStatus(false);

            transactionService.updateTransaction(afterTransaction);
        } else {
            afterTransaction.setDepositStatus(true);

            transactionService.updateTransaction(afterTransaction);
        }

        return afterTransaction;
    }

    @PutMapping(value = "/transactions/remit", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Transaction editRemit(@RequestBody Transaction transaction) {
        Transaction afterTransaction = transactionService.selectTransaction(transaction);
        if (afterTransaction.isDepositStatus()) {
            if (transaction.isRemitStatus()) {
                afterTransaction.setRemitStatus(false);

                transactionService.updateTransaction(afterTransaction);
            } else {
                afterTransaction.setRemitStatus(true);

                transactionService.updateTransaction(afterTransaction);
            }
        }

        return afterTransaction;
    }

    @DeleteMapping(value = "/transactions", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public List<Transaction> removeAdminTransaction(@RequestBody Transaction transaction) {
        transaction = transactionService.selectTransaction(transaction);

        List pages = new ArrayList();
        int page[] = new int[5];
        pages.add(page);

        Silage silage = new Silage();
        silage.setSilageCode(transaction.getSilageCode());
        silage.setTransactionStatus('Y');
        silageService.updateSilage(silage);

        transactionService.deleteTransaction(transaction);

        return transactionService.selectTransactionList(new Condition());
    }

    @PostMapping(value = "/purchases", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public List<Transaction> searchTransactionScope(@RequestBody(required = false) Condition condition
                                                    , HttpSession session) {
        List<Transaction> transactions = transactionService.selectTransactionList(condition);
        List<Transaction> afterTransactions = new ArrayList<Transaction>();

        Iterator<Transaction> transactionIterator = transactions.iterator();
        while (transactionIterator.hasNext()) {
            Transaction iter = transactionIterator.next();

            if (iter.getBuyerCode() == (Integer) session.getAttribute("memberCode")) {
                afterTransactions.add(iter);
            }
        }

        return afterTransactions;
    }

    @PostMapping(value = "/purchases/member", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public List<Transaction> searchPurchaseMember(@RequestBody(required = false) Member member
                                                  , HttpSession session) {
        int presentMember = (Integer) session.getAttribute("memberCode");

        List<Transaction> transactions = transactionService.selectTransactionList(new Condition());
        List<Transaction> afterTransactions = new ArrayList<Transaction>();

        Iterator<Transaction> transactionIterator = transactions.iterator();
        if (member.getId() != null && !member.getId().equals("")) {
            while (transactionIterator.hasNext()) {
                Transaction iter = transactionIterator.next();
                if (iter.getSellerId().equals(member.getId())
                        && iter.getBuyerCode() == presentMember) {
                    afterTransactions.add(iter);
                }
            }

            return afterTransactions;
        } else {
            while (transactionIterator.hasNext()) {
                Transaction iter = transactionIterator.next();
                if (iter.getBuyerCode() == (Integer) session.getAttribute("memberCode")) {
                    afterTransactions.add(iter);
                }
            }

            return afterTransactions;
        }
    }

    @PostMapping(value = "/transactions/member", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public List<Transaction> searchTransactionMember(@RequestBody(required = false) Member member) {
        List<Transaction> transactions = transactionService.selectTransactionList(new Condition());
        List<Transaction> afterTransactions = new ArrayList<Transaction>();

        Iterator<Transaction> transactionIterator = transactions.iterator();
        if (member.getId() != null) {
            while (transactionIterator.hasNext()) {
                Transaction iter = transactionIterator.next();
                if (iter.getSellerId().equals(member.getId())
                        || iter.getId().equals(member.getId())) {
                    afterTransactions.add(iter);
                }
            }

            return afterTransactions;
        }

        return transactions;
    }
}

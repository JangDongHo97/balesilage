package kr.co.bsa.transaction;

import kr.co.bsa.common.Condition;

import java.util.List;

public interface TransactionService {
    public void insertTransaction (Transaction transaction);
    public List<Transaction> selectTransactionList(Condition condition);
    public Transaction selectTransaction(Transaction transaction);
    public void updateTransaction(Transaction transaction);
    public void deleteTransaction(Transaction transaction);
}

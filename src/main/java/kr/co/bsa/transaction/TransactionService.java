package kr.co.bsa.transaction;

import kr.co.bsa.common.DateCommand;

import java.util.List;

public interface TransactionService {
    public void insertTransaction (Transaction transaction);
    public List<Transaction> selectTransactionList(DateCommand dateCommand);
    public Transaction selectTransaction(Transaction transaction);
    public void updateTransaction(Transaction transaction);
    public void deleteTransaction(Transaction transaction);
}

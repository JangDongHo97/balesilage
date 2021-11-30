package kr.co.bsa.transaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TransactionServiceImpl implements TransactionService{
    @Autowired
    TransactionMapper transactionMapper;

    @Override
    public void insertTransaction(Transaction transaction) {
        transactionMapper.insert(transaction);
    }

    @Override
    public List<Transaction> selectTransactionList() {
        List<Transaction> transactions = transactionMapper.selectAll();
        return transactions;
    }

    @Override
    public Transaction selectTransaction(Transaction transaction) {
        Transaction afterTransaction = transactionMapper.select(transaction);
        return afterTransaction;
    }

    @Override
    public void updateTransaction(Transaction transaction) {
        transactionMapper.update(transaction);
    }

    @Override
    public void deleteTransaction(Transaction transaction) {
        transactionMapper.delete(transaction);
    }
}

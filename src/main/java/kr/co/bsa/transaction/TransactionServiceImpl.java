package kr.co.bsa.transaction;

import kr.co.bsa.common.Condition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TransactionServiceImpl implements TransactionService{
    @Autowired
    TransactionMapper transactionMapper;

    @Override
    @Transactional
    public void insertTransaction(Transaction transaction) {
        transactionMapper.insert(transaction);
    }

    @Override
    @Transactional
    public List<Transaction> selectTransactionList(Condition condition) {
        List<Transaction> transactions = transactionMapper.selectAll(condition);

        return transactions;
    }

    @Override
    @Transactional
    public Transaction selectTransaction(Transaction transaction) {
        transaction = transactionMapper.select(transaction);

        return transaction;
    }

    @Override
    @Transactional
    public void updateTransaction(Transaction transaction) {
        transactionMapper.update(transaction);
    }

    @Override
    @Transactional
    public void deleteTransaction(Transaction transaction) {
        transactionMapper.delete(transaction);
    }
}

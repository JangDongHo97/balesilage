package kr.co.bsa.transaction;

import java.util.List;

public interface TransactionMapper {
    public void insert(Transaction transaction);
    public List<Transaction> selectAll();
    public Transaction select(Transaction transaction);
    public void update(Transaction transaction);
    public void delete(Transaction transaction);
}

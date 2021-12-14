package kr.co.bsa.transaction;

import kr.co.bsa.common.Condition;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TransactionMapper {
    public void insert(Transaction transaction);
    public List<Transaction> selectAll(Condition condition);
    public Transaction select(Transaction transaction);
    public void update(Transaction transaction);
    public void delete(Transaction transaction);
}

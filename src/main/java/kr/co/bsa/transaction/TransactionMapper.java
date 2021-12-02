package kr.co.bsa.transaction;

import kr.co.bsa.common.DateCommand;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TransactionMapper {
    public void insert(Transaction transaction);
    public List<Transaction> selectAll(DateCommand dateCommand);
    public Transaction select(Transaction transaction);
    public void update(Transaction transaction);
    public void delete(Transaction transaction);
}

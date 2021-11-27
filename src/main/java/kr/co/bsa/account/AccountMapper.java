package kr.co.bsa.account;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AccountMapper {
    public void insert(Account account);
    public Account select(Account account);
    public void update(Account account);
}

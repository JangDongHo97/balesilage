package kr.co.bsa.account;

import kr.co.bsa.member.Member;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AccountMapper {
    public void insert(Account account);
    public Account select(Member member);
    public void update(Account account);
}

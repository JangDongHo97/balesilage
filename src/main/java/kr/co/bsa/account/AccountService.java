package kr.co.bsa.account;

import kr.co.bsa.member.Member;

public interface AccountService {
    public void insertAccount(Account account);
    public Account selectAccount(Member member);
    public void update(Account account);
}

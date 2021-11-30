package kr.co.bsa.account;

import kr.co.bsa.member.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountServiceImpl implements AccountService{
    @Autowired
    private AccountMapper accountMapper;

    @Override
    public void insertAccount(Account account) {
        accountMapper.insert(account);
    }

    @Override
    public Account selectAccount(Member member) {
        Account account = accountMapper.select(member);
        return account;
    }

    @Override
    public void update(Account account) {
        accountMapper.update(account);
    }
}

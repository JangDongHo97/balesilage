package kr.co.bsa.account;

import kr.co.bsa.member.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AccountServiceImpl implements AccountService{
    @Autowired
    private AccountMapper accountMapper;

    @Override
    @Transactional
    public void insertAccount(Account account) {
        accountMapper.insert(account);
    }

    @Override
    @Transactional
    public Account selectAccount(Member member) {
        Account account = accountMapper.select(member);

        return account;
    }

    @Override
    @Transactional
    public void updateAccount(Account account) {
        accountMapper.update(account);
    }
}

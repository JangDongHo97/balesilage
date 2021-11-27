package kr.co.bsa.account;

import org.springframework.stereotype.Service;

public interface AccountService {
    public void insertAccount(Account account);
    public Account selectAccount(Account account);
    public void update(Account account);
}

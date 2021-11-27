package kr.co.bsa.account;

public interface AccountService {
    public void insertAccount(Account account);
    public Account selectAccount(Account account);
    public void update(Account account);
}

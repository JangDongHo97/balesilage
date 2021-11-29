package kr.co.bsa.account;

import java.io.Serializable;

public class Account implements Serializable {
    private String accountCode;
    private int memberCode;
    private String bankName;
    private String AccountNo;

    public Account() {
    }

    public String getAccountCode() {
        return accountCode;
    }

    public void setAccountCode(String accountCode) {
        this.accountCode = accountCode;
    }

    public int getMemberCode() {
        return memberCode;
    }

    public void setMemberCode(int memberCode) {
        this.memberCode = memberCode;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getAccountNo() {
        return AccountNo;
    }

    public void setAccountNo(String accountNo) {
        AccountNo = accountNo;
    }

    @Override
    public String toString() {
        return "Account{" +
                "accountCode='" + accountCode + '\'' +
                ", memberCode='" + memberCode + '\'' +
                ", bankName='" + bankName + '\'' +
                ", AccountNo='" + AccountNo + '\'' +
                '}';
    }
}

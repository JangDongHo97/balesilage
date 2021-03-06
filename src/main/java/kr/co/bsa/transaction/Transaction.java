package kr.co.bsa.transaction;

import java.io.Serializable;

public class Transaction implements Serializable {
    private int transactionCode;
    private int silageCode;
    private int sellerCode;
    private int buyerCode;
    private String id;
    private String sellerId;
    private String bankName;
    private String accountNo;
    private int totalPrice;
    private String transactionDateTime;
    private boolean depositStatus;
    private boolean remitStatus;

    public Transaction() {
    }

    public int getTransactionCode() {
        return transactionCode;
    }

    public void setTransactionCode(int transactionCode) {
        this.transactionCode = transactionCode;
    }

    public int getSilageCode() {
        return silageCode;
    }

    public void setSilageCode(int silageCode) {
        this.silageCode = silageCode;
    }

    public int getSellerCode() {
        return sellerCode;
    }

    public void setSellerCode(int sellerCode) {
        this.sellerCode = sellerCode;
    }

    public int getBuyerCode() {
        return buyerCode;
    }

    public void setBuyerCode(int buyerCode) {
        this.buyerCode = buyerCode;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSellerId() {
        return sellerId;
    }

    public void setSellerId(String sellerId) {
        this.sellerId = sellerId;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getAccountNo() {
        return accountNo;
    }

    public void setAccountNo(String accountNo) {
        this.accountNo = accountNo;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getTransactionDateTime() {
        return transactionDateTime;
    }

    public void setTransactionDateTime(String transactionDateTime) {
        this.transactionDateTime = transactionDateTime;
    }

    public boolean isDepositStatus() {
        return depositStatus;
    }

    public void setDepositStatus(boolean depositStatus) {
        this.depositStatus = depositStatus;
    }

    public boolean isRemitStatus() {
        return remitStatus;
    }

    public void setRemitStatus(boolean remitStatus) {
        this.remitStatus = remitStatus;
    }

    @Override
    public String toString() {
        return "Transaction{" +
                "transactionCode=" + transactionCode +
                ", silageCode=" + silageCode +
                ", sellerCode=" + sellerCode +
                ", buyerCode=" + buyerCode +
                ", id='" + id + '\'' +
                ", sellerId='" + sellerId + '\'' +
                ", bankName='" + bankName + '\'' +
                ", accountNo='" + accountNo + '\'' +
                ", totalPrice=" + totalPrice +
                ", transactionDateTime='" + transactionDateTime + '\'' +
                ", depositStatus=" + depositStatus +
                ", remitStatus=" + remitStatus +
                '}';
    }
}

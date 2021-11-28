package kr.co.bsa.silage;

import java.io.Serializable;

public class Silage implements Serializable {
    private int silageCode;
    private int sellerCode;
    private String enrollDateTime;
    private int unitPrice;
    private int count;
    private int weight;
    private String productionDate;
    private char TransactionStatus;

    public Silage() {
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

    public String getEnrollDateTime() {
        return enrollDateTime;
    }

    public void setEnrollDateTime(String enrollDateTime) {
        this.enrollDateTime = enrollDateTime;
    }

    public int getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(int unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public String getProductionDate() {
        return productionDate;
    }

    public void setProductionDate(String productionDate) {
        this.productionDate = productionDate;
    }

    public char getTransactionStatus() {
        return TransactionStatus;
    }

    public void setTransactionStatus(char transactionStatus) {
        TransactionStatus = transactionStatus;
    }

    @Override
    public String toString() {
        return "Silage{" +
                "silageCode='" + silageCode + '\'' +
                ", sellerCode='" + sellerCode + '\'' +
                ", enrollDateTime='" + enrollDateTime + '\'' +
                ", unitPrice=" + unitPrice +
                ", count=" + count +
                ", weight=" + weight +
                ", productionDate='" + productionDate + '\'' +
                ", TransactionStatus=" + TransactionStatus +
                '}';
    }
}

package kr.co.bsa.silage;

import java.io.Serializable;

public class Silage implements Serializable {
    private int silageCode;
    private int sellerCode;
    private String id;
    private String address;
    private String enrollDateTime;
    private int unitPrice;
    private int count;
    private int weight;
    private String productionDate;
    private char transactionStatus;

    public Silage() {
    }

    public int getSilageCode() {
        return silageCode;
    }

    public int getSellerCode() {
        return sellerCode;
    }

    public void setSellerCode(int sellerCode) {
        this.sellerCode = sellerCode;
    }

    public void setSilageCode(int silageCode) {
        this.silageCode = silageCode;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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
        return transactionStatus;
    }

    public void setTransactionStatus(char transactionStatus) {
        this.transactionStatus = transactionStatus;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Silage{" +
                "silageCode=" + silageCode +
                ", sellerCode=" + sellerCode +
                ", id='" + id + '\'' +
                ", address='" + address + '\'' +
                ", enrollDateTime='" + enrollDateTime + '\'' +
                ", unitPrice=" + unitPrice +
                ", count=" + count +
                ", weight=" + weight +
                ", productionDate='" + productionDate + '\'' +
                ", transactionStatus=" + transactionStatus +
                '}';
    }
}

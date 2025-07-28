package model;

import java.util.ArrayList;
import java.util.List;

public class Order {
    private int id;
    private double amount;
    private Account user;
    private String address;
    private String createdAt;
    private List<OrderDetail> listOrderDetail = new ArrayList<>();
    private String name; 
    private String note;
    private String phone;
    private String paymentMethod;

    public Order() {
    }

    public Order(int id, double amount, Account user, String address, String createdAt, String name, String note, String phone, String paymentMethod) {
        this.id = id;
        this.amount = amount;
        this.user = user;
        this.address = address;
        this.createdAt = createdAt;
        this.name = name;
        this.note = note;
        this.phone = phone;
        this.paymentMethod = paymentMethod;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Account getUser() {
        return user;
    }

    public void setUser(Account user) {
        this.user = user;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public List<OrderDetail> getListOrderDetail() {
        return listOrderDetail;
    }

    public void setListOrderDetail(List<OrderDetail> listOrderDetail) {
        this.listOrderDetail = listOrderDetail;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", amount=" + amount + ", user=" + user + ", address=" + address + ", createdAt=" + createdAt + ", listOrderDetail=" + listOrderDetail + ", name=" + name + ", note=" + note + ", phone=" + phone + ", paymentMethod=" + paymentMethod + '}';
    }   
}

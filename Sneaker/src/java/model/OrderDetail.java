package model;

public class OrderDetail {
    private int quantity;
    private int orderId;
    private Product product;
    private String size;
    private String color;

    public OrderDetail() {
    }

    public OrderDetail(int quantity, int orderId, Product product, String size, String color) {
        this.quantity = quantity;
        this.orderId = orderId;
        this.product = product;
        this.size = size;
        this.color = color;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "quantity=" + quantity + ", orderId=" + orderId + ", product=" + product + ", size=" + size + ", color=" + color + '}';
    }
}

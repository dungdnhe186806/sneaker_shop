package model;

import dal.ProductDAO;
import java.util.List;

public class Item {

    private Product product;
    private int quantity;
    private String size;
    private String color;

    public Item() {
    }

    public Item(Product product, int quantity, String size, String color) {
        this.product = product;
        this.quantity = quantity;
        this.size = size;
        this.color = color;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
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
    
    public List<Size> getAllSize(){
        ProductDAO dao = new ProductDAO();
        return dao.getSizeByID(product.getProductID());
    }
    public List<Color> getAllColor(){
        ProductDAO dao = new ProductDAO();
        return dao.getColorByID(product.getProductID());
    }

    @Override
    public String toString() {
        return "Item{" + "product=" + product + ", quantity=" + quantity + ", size=" + size + ", color=" + color + '}';
    }
}

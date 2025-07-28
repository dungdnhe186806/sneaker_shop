package model;

import java.util.ArrayList;
import java.util.List;

public class Product {
    private int productID ;
    private String productName;
    private String productImg;
    private int productQuantity;
    private float productPrice;
    private String productDescription;
    private Category cate;
    private List<Size> size = new ArrayList<>();
    private List<Color> color = new ArrayList<>();

    public Product() {
    }

    public Product(int productID, String productName, String productImg, int productQuantity, float productPrice, String productDescription, Category cate) {
        this.productID = productID;
        this.productName = productName;
        this.productImg = productImg;
        this.productQuantity = productQuantity;
        this.productPrice = productPrice;
        this.productDescription = productDescription;
        this.cate = cate;
    }

    public Product(int productID, String productName, String productImg, int productQuantity, float productPrice, String productDescription) {
        this.productID = productID;
        this.productName = productName;
        this.productImg = productImg;
        this.productQuantity = productQuantity;
        this.productPrice = productPrice;
        this.productDescription = productDescription;
    }

    public Product(int productID, String productName, int productQuantity, float productPrice) {
        this.productID = productID;
        this.productName = productName;
        this.productQuantity = productQuantity;
        this.productPrice = productPrice;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public String getProductPrice() {
        return String.format("$%.2f", productPrice);
    }
    public String getProductPricePreSale() {
        return String.format("$%.2f", productPrice+ productPrice*3/10);
    }
    
    public float getProductPriceFloat() {
        return productPrice;
    }

    public void setProductPrice(float productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public Category getCate() {
        return cate;
    }

    public void setCate(Category cate) {
        this.cate = cate;
    }

    public List<Size> getSize() {
        return size;
    }

    public void setSize(List<Size> size) {
        this.size = size;
    }

    public List<Color> getColor() {
        return color;
    }

    public void setColor(List<Color> color) {
        this.color = color;
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", productName=" + productName + ", productImg=" + productImg + ", productQuantity=" + productQuantity + ", productPrice=" + productPrice + ", productDescription=" + productDescription + ", cate=" + cate + ", size=" + size + ", color=" + color + '}';
    }
}

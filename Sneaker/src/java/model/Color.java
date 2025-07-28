package model;

public class Color {

    private int productID;
    private String color;

    public Color() {
    }

    public Color(int productID, String color) {
        this.productID = productID;
        this.color = color;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getColor() {
        return color.trim();
    }

    public void setColor(String color) {
        this.color = color;
    }

    @Override
    public String toString() {
        return "Color{" + "productID=" + productID + ", color=" + color + '}';
    }  
}

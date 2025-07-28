package model;

public class Size {
    private int productID;
    private String size;

    public Size() {
    }

    public Size(int productID, String size) {
        this.productID = productID;
        this.size = size;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    @Override
    public String toString() {
        return "Size{" + "productID=" + productID + ", size=" + size + '}';
    } 
}

package model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

    List<Item> items;

    public Cart() {

    }

    public Cart(String txt, List<Product> list) {
        items = new ArrayList<>();
        try {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split("\\|");
                for (String s1 : s) {
                    String[] p = s1.split(":");
                    int id = Integer.parseInt(p[0]);
                    int quantity = Integer.parseInt(p[1]);
                    String size = p[2];
                    String color = p[3];
                    Product temp = getProductById(id, list);
                    if (temp != null) {
                        items.add(new Item(temp, quantity, size, color));
                    }
                }
            }
        } catch (NumberFormatException e) {
        }
    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    private Product getProductById(int id, List<Product> list) {
        for (Product p : list) {
            if (p.getProductID() == id) {
                return p;
            }
        }
        return null;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public int getQuantityById(int id) {
        return getItemById(id).getProduct().getProductQuantity();
    }

    private Item getItemById(int id) {
        for (Item i : items) {
            if (i.getProduct().getProductID() == id) {
                return i;
            }
        }
        return null;
    }

    public Item getItemInCart(int id, String size, String color) {
        for (Item i : items) {
            if (i.getProduct().getProductID() == id && i.getColor().equals(color) && i.getSize().equals(size)) {
                return i;
            }
        }
        return null;
    }

    private Item CheckItem(int id, String size, String color) {
        for (Item i : items) {
            if (i.getProduct().getProductID() == id && size.equals(i.getSize()) && color.equals(i.getColor())) {
                return i;
            }
        }
        return null;
    }

    public void addItem(Item t) {
        if (getItemById(t.getProduct().getProductID()) != null && CheckItem(t.getProduct().getProductID(), t.getSize(), t.getColor()) != null) {
            Item m = getItemById(t.getProduct().getProductID());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    public void UpdateItem(int id, int quantity, String Size, String color, String oldColor, String oldSize) {
        Item temp = getItemInCart(id, oldSize, oldColor);
        if (temp != null) {
            temp.setQuantity(quantity);
            temp.setSize(Size);
            temp.setColor(color);
        }
    }

    public double getTotalMoney() {
        double t = 0;
        for (Item i : items) {
            t += (i.getQuantity() * i.getProduct().getProductPriceFloat());
        }
        return t;
    }

    public String getCookieForm() {
        String txt = "";
        if (items != null && !items.isEmpty()) {
            Item fistItem = items.get(0);
            txt += fistItem.getProduct().getProductID() + ":" + fistItem.getQuantity() + ":" + fistItem.getSize() + ":" + fistItem.getColor();
            for (int i = 1; i < items.size(); i++) {
                Item temp = items.get(i);
                txt += "|" + temp.getProduct().getProductID() + ":" + temp.getQuantity() + ":" + temp.getSize() + ":" + temp.getColor();
            }
        }
        return txt;
    }
}

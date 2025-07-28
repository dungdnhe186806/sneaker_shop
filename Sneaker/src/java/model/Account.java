package model;

public class Account {
    private int user_id;
    private String user_name;
    private String user_email;
    private String user_pass;
    private boolean isAdmin;
    private String address;
    private String phone;

    public Account() {
    }

    public Account(int user_id, String user_name, String user_email, String user_pass, boolean isAdmin, String address, String phone) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.user_email = user_email;
        this.user_pass = user_pass;
        this.isAdmin = isAdmin;
        this.address = address;
        this.phone = phone;
    }



    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_pass() {
        return user_pass;
    }

    public void setUser_pass(String user_pass) {
        this.user_pass = user_pass;
    }

    public boolean isIsAdmin() {
        return isAdmin;
    }
    public String getRole() {
        return isAdmin?"Admin":"Customer";
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Account{" + "user_id=" + user_id + ", user_name=" + user_name + ", user_email=" + user_email + ", user_pass=" + user_pass + ", isAdmin=" + isAdmin + ", address=" + address + ", phone=" + phone + '}';
    }
    
    
}

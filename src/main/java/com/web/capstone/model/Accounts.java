package com.web.capstone.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name="account")
public class Accounts {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String fName;
    private String lName;
    private String email;
    private String password;
    @Transient
    private String password2;
    private String image;
    private String role;

    @OneToOne(mappedBy = "accounts", cascade = CascadeType.ALL)
    private Addresses address;

    @OneToMany(mappedBy = "accounts", cascade = CascadeType.ALL)
    private List<PaymentMethod> paymentMethod;

    @ManyToMany(cascade = CascadeType.DETACH)
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles = new HashSet<Role>();

    @OneToMany(mappedBy = "users_id", cascade = CascadeType.ALL)
    private List<Products> products;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getlName() {
        return lName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword2() {
        return password2;
    }

    public void setPassword2(String password2) {
        this.password2 = password2;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Addresses getAddress() {
        return address;
    }

    public void setAddress(Addresses address) {
        this.address = address;
    }

    public List<PaymentMethod> getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(List<PaymentMethod> paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public List<Products> getProducts() {
        return products;
    }

    public void setProducts(List<Products> products) {
        this.products = products;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Accounts{" +
                "id=" + id +
                ", fName='" + fName + '\'' +
                ", lName='" + lName + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", password2='" + password2 + '\'' +
                ", role='" + role + '\'' +
                '}';
    }
}


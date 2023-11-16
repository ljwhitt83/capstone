package com.web.capstone.model;

import javax.persistence.*;

@Entity
@Table(name="creditcards")
public class PaymentMethod {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String expiry;
    private String cardno;
    private String secode;
    private String type;

    @ManyToOne(cascade = CascadeType.DETACH)
    @JoinColumn(name="accounts_id")
    private Accounts accounts;

    public PaymentMethod(){
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getExpiry() {
        return expiry;
    }

    public void setExpiry(String expiry) {
        this.expiry = expiry;
    }

    public String getCardno() {
        return cardno;
    }

    public void setCardno(String cardno) {
        this.cardno = cardno;
    }

    public String getSecode() {
        return secode;
    }

    public void setSecode(String secode) {
        this.secode = secode;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Accounts getAccounts() {
        return accounts;
    }

    public void setAccounts(Accounts accounts) {
        this.accounts = accounts;
    }
}

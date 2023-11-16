package com.web.capstone.model;

import javax.persistence.*;

@Entity
@Table(name="images")
public class ImageFiles {

    public ImageFiles(){

    }

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;

    private String image;
    private String ext;
    private long size;
    @Column(name="stockId")
    private Long stockId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getExt() {
        return ext;
    }

    public void setExt(String ext) {
        this.ext = ext;
    }

    public long getSize() {
        return size;
    }

    public void setSize(long size) {
        this.size = size;
    }

    public Long getStockId() {
        return stockId;
    }

    public void setStockId(Long stockId) {
        this.stockId = stockId;
    }

    @Override
    public String toString() {
        return "ImageFiles{" +
                "id=" + id +
                ", image='" + image + '\'' +
                ", ext='" + ext + '\'' +
                ", size=" + size +
                ", stockId=" + stockId +
                '}';
    }
}

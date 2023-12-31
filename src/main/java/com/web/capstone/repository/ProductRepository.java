package com.web.capstone.repository;

import com.web.capstone.model.Products;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface ProductRepository extends JpaRepository<Products, Long> {

    String search="SELECT p FROM Products p WHERE p.type =:type";

    @Query(search)
    Page<Products> filter(@Param("type") String type, Pageable pageable);
}

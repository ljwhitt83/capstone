package com.web.capstone.repository;

import com.web.capstone.model.PaymentMethod;
import org.springframework.data.jpa.repository.JpaRepository;


public interface PaymentMethodRepository extends JpaRepository<PaymentMethod, Long> {
}

package com.web.capstone.repository;

import com.web.capstone.model.Addresses;
import org.springframework.data.jpa.repository.JpaRepository;


public interface AddressRepository extends JpaRepository<Addresses, Long> {
}

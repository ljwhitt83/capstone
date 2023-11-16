package com.web.capstone.repository;

import com.web.capstone.model.ImageFiles;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ImageRepository extends JpaRepository<ImageFiles, Long> {
}

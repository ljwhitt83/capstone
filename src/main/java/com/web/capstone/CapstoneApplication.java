package com.web.capstone;

import com.web.capstone.model.Accounts;
import com.web.capstone.model.Role;
import com.web.capstone.repository.AccountsRepository;
import com.web.capstone.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.HashSet;
import java.util.Optional;

@SpringBootApplication
public class CapstoneApplication implements CommandLineRunner {

	@Autowired
	private AccountsRepository accountsRepository;

	@Autowired
	private RoleRepository roleRepository;


	public static void main(String[] args) {
		SpringApplication.run(CapstoneApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception{

		Optional<Accounts> usr = accountsRepository.findByEmail("admin@email.com");

		if (!usr.isPresent()){
			Accounts user = new Accounts();
			user.setfName("Admin");
			user.setlName("Manager");
			user.setEmail("admin@email.com");
			user.setPassword("123");
			user.setRoles(new HashSet<Role>(roleRepository.findAll()));
			accountsRepository.save(user);
		}
	}

}

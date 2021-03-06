package com.jobmatch.controllers;

import com.github.javafaker.Faker;
import com.jobmatch.models.Contact;
import com.jobmatch.models.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
public class SeedController extends BaseController {

    /**
     * Creates a new user in the database using random attributes
     */

    @RequestMapping("/seed")
    public String seedDatabase(Map<String, Object> model) {
        model.put("title", "Database Seeder");

        Faker faker = new Faker();

        Contact contact = new Contact(
                faker.phoneNumber().phoneNumber(),
                faker.address().streetAddress(false),
                faker.address().zipCode(),
                faker.internet().url(),
                faker.name().firstName(),
                faker.name().lastName()
        );

        User user = new User(roleRepository.findByName("seeker"), faker.name().name().replace(" ", ""), "myPassword", true, faker.internet().emailAddress());
        user.setContact(contact);
        userRepository.save(user);

        model.put("user", user);

        return "seed";
    }
}

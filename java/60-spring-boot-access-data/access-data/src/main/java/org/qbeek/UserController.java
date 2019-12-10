package org.qbeek;

import org.qbeek.accessingdata.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(name = "/demo")
public class UserController {
    @Autowired // will automatically instantiate the repository from the interface
    private UserRepository userRepository;

    @PostMapping(path = "/add")
    public @ResponseBody String addNewUser(@RequestParam String name, @RequestParam String email) {
        // @ResponseBody means the returned String is the response, not a view name
        // @RequestParam means it is a parameter from the GET or POST request

        User user = new User();
        user.setName(name);
        user.setEmail(email);
        userRepository.save(user);

        return "Saved";
    }

    @GetMapping(path = "all")
    public @ResponseBody Iterable<User> getAllUsers() {
        return userRepository.findAll();
    }
}


package com.ciemmedicjad.ciemmedicjad;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;




@RestController
public class newpageController {
    @RequestMapping("/helloprow")
    
    public String helloprow() {
        return "Mi primera vez en SpringBoot un 05 de junio del 2024";
    }
}

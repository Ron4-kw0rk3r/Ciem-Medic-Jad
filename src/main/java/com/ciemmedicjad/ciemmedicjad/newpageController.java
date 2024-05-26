package com.ciemmedicjad.ciemmedicjad;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;




@RestController
public class newpageController {
    @RequestMapping("/helloprow")
    
    public String helloprow() {
        return "Main New page Welcome";
    }
}

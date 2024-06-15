package com.ciemmedicjad.ciemmedicjad;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class searchForm {

    @RequestMapping("/search")
    public ModelAndView search(@RequestParam(value = "query", required = false) String query) {
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("searchQuery", query);
        return modelAndView;
    }
    
}

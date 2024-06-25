// Controlador
package com.ciemmedicjad.ciemmedicjad;
//package com.example.interpolation.controller;
//package com.example.interpolation.controller;

//import com.example.interpolation.model.DataPoint;
//import com.example.interpolation.service.InterpolationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
public class InterpolationController {

    @Autowired
    private InterpolationService interpolationService;

    @PostMapping("/add")
    public void addDatapoint(@RequestParam double x, @RequestParam double fx) {
        interpolationService.addDataPoint(x, fx);
    }

    @DeleteMapping("/data")
    public void clearDatapoints() {
        interpolationService.clearDataPoints();
    }

    @GetMapping("/data")
    public List<Datapoint> getDatapoints() {
        return interpolationService.getDataPoints();
    }

    @GetMapping("/interpolate")
    public String interpolate(@RequestParam int degree) {
        return interpolationService.interpolate(degree);
    }
}

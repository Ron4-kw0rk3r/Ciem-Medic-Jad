package com.ciemmedicjad.ciemmedicjad;

import java.io.IOException;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class automater {
    public void startAutomation() {
        ScheduledExecutorService executor = Executors.newScheduledThreadPool(1);
        Runnable task = () -> {
            try {
                Process process = Runtime.getRuntime().exec("python src/main/resources/public/res/avatars/main.py");
                process.waitFor();
            } catch (IOException | InterruptedException e) {
                e.printStackTrace();
            }
        };
        executor.scheduleAtFixedRate(task, 0, 1, TimeUnit.HOURS);
    }
    
}

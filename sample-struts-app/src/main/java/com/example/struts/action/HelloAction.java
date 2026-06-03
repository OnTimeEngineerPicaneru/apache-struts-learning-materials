package com.example.struts.action;

import com.example.struts.service.GreetingService;

public class HelloAction {

    private String message;

    public String execute() {
        GreetingService greetingService = new GreetingService();
        this.message = greetingService.createMessage();
        return "success";
    }

    public String getMessage() {
        return message;
    }
}

package com.example.struts.service;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

class GreetingServiceTest {

    @Test
    void createMessage_returnsGreetingMessage() {
        GreetingService service = new GreetingService();

        String message = service.createMessage();

        assertEquals("Hello, Apache Struts!", message);
    }
}

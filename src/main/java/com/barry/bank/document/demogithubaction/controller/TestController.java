package com.barry.bank.document.demogithubaction.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class TestController {


    @GetMapping("/api/search")
    public Map<String, String> search() {
        return Map.of("key1", "Belle formation", "key2", "JAVA 8", "key3", "MongoDB");
    }


}


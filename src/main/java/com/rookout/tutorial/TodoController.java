package com.rookout.tutorial;

import jdk.jfr.ContentType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
public class TodoController {
    public static final Logger logger = LoggerFactory.getLogger(TodoController.class);
    private TodoStorage todos = TodoStorage.getInstance();

    @RequestMapping(value = "/todos", method = RequestMethod.GET)
    public TodoRecord[] getTodos() {
        return todos.getAll();
    }

    @RequestMapping(value = "/todos", method = RequestMethod.POST)
    public ResponseEntity<?> addTodo(@RequestBody TodoRecord newTodoRecord) {
        newTodoRecord.setId(UUID.randomUUID().toString());
        logger.info("Adding a new todo: {}", newTodoRecord);
        todos.add(newTodoRecord);
//        HttpHeaders headers = new HttpHeaders();
//        headers.setContentType(MediaType.valueOf("text/html"));
        return new ResponseEntity<>("{\"status\": \"ok\"}", HttpStatus.OK);
    }


//    // @RequestParam binds the value of the query string parameter name into the name parameter of the greeting()
//    // method. If the name parameter is absent in the request, the defaultValue of "World" is used.
//    public Greeting greeting(@RequestParam(value = "name", defaultValue = "World") String name) {
//        return new Greeting(counter.incrementAndGet(), String.format(template, name));
//    }

}

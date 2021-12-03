package main.sbt.hello;

public class HelloPerson {
    private String name;
    public HelloPerson(String name) {
        this.name = name;
    }

    public String say(){
        return "Hello " + name;
    }
}

package main.sbt.hello;

import main.sbt.hello.HelloPerson;

public class Program {
    public static void main(String[] args) {
        for (int i = 0; i < 5; i++) {
            HelloPerson helloPerson = new HelloPerson("Person " + i);
            System.out.println(helloPerson.say());
        }
    }
}

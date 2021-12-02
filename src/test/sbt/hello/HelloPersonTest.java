package test.sbt.hello;

import main.sbt.hello.HelloPerson;
import org.junit.Assert;
import org.junit.jupiter.api.Test;



public class HelloPersonTest {

    @Test
    public void testSay() {
        String name = "Make";
        Assert.assertEquals(new HelloPerson(name).say(),"Hello Make");
    }
}
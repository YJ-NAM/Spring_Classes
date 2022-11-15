package com.nonspring.di03;

import java.io.FileReader;
import java.util.Properties;

class Car {    }
class SportsCar extends Car{    }
class Truck extends Car{    }
class Engine{    }

public class Main {
	
    public static Car getCar() throws Exception {
        Properties prop = new Properties();
        prop.load(new FileReader("config.txt"));
        Class clazz = Class.forName(prop.getProperty("car"));
        return (Car)clazz.newInstance();
    }
    
    public static Object getObject(String key) throws Exception {
        Properties prop = new Properties();
        prop.load(new FileReader("config.txt"));
        Class clazz = Class.forName(prop.getProperty(key));
        return clazz.newInstance();
    }
    
    public static void main(String[] args) throws Exception {
        Car car = new Car();
        System.out.println("car >>> " + car);

        Car car1 = new SportsCar();
        System.out.println("car1 >>> " + car1);    
        System.out.println("================================");
        
        Car car2 = getCar();
        System.out.println("car2 >>>" + car2);
        System.out.println("================================");
        
        Car car3 = (Car)getObject("car");
        Engine engine = (Engine)getObject("engine");
        System.out.println("car3 >>>" + car3);
        System.out.println("engine >>>" + engine);
        System.out.println("================================");
    }

}
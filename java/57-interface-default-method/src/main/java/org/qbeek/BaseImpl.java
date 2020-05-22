package org.qbeek;

public class BaseImpl implements Base {

    @Override
    public void coucou() {
        System.out.println("coucou le monde");
    }

    public Integer retInteger() {
        Integer i = 42;
        return Integer.valueOf(12);
    }
}

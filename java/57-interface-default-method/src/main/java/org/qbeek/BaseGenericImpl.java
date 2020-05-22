package org.qbeek;

public class BaseGenericImpl implements BaseGeneric<Integer> {

    @Override
    public Integer coucou() {
        System.out.println("coucou generic");

        return java.lang.Integer.valueOf(32);
    }
}

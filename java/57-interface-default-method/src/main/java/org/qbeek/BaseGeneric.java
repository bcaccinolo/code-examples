package org.qbeek;

public interface BaseGeneric<T> {

    public T coucou();

    default void coucou2(T t) {
        System.out.println("coucou 2!");
        System.out.println(t);
    }


}

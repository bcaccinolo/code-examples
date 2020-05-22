package org.qbeek;

public interface Base {

    public void coucou();

    default void coucou2() {
        System.out.println("coucou 2!");
    }



}

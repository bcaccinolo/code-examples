package org.qbeek;

import java.util.List;

/**
 * Hello world!
 */
public class App {
    public static void main(String[] args) {
        System.out.println("Hello World!");

        Integer[] ar = {1, 2, 3, 4, 5};
        List<Integer> list = java.util.Arrays.asList(ar);
        System.out.println(list);

        list.forEach(System.out::println);
        list.stream()
                .filter(i -> i > 3)
                .forEach(System.out::println);

        String[] str = {"hello", "le", "monde"};
        List<String> list2 = java.util.Arrays.asList(str);
        System.out.println(list2);

        list2.forEach(System.out::println);


    }
}

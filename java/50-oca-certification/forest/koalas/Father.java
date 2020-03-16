package koalas;

// import monkeys.*; // import is case sensitive

import static java.util.Arrays.asList;

class Father {

    static int food;
    final int ears;

    Father() {
        ears = 1;
        ears = 2;
    }

    static {
        System.out.println("static initializer");
    }

    {
        System.out.println("instance initializer");
    }

    static void asList(int... args) {
        System.out.println("asList local method");
    }

    static void eat() {
        System.out.println("manger!");
        System.out.println(food);
        Father.sleep();
    }

    static void sleep() {
        System.out.println("dodo !");
    }

    public static void main(String... args){
        Father.eat();
        new Father();
        new Father();
        asList(new int[4]);
    }

}

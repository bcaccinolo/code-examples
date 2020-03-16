

// this class is not public, it is 'default package private'
class PublicByDefault {

    String name;

    // it is not 'public', it is default access
    // meaning it can be accessed within the same package.
    void hello() {
        System.out.println("hello");
    }

    public static void main(String... args) {
        PublicByDefault pbd = new PublicByDefault();

        System.out.println(pbd.name);

        pbd.hello();
    }
}

// can't be public. To do so the file should be named Animal.java
class Animal {
    public static void roar() {
        System.out.println("RRRrrrr!");
    }
}

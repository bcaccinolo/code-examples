

public class OnePublicClass {

    public String s;
    public int a;


    public static void main(String[] args) {

        OnePublicClass opc = new OnePublicClass();

        System.out.println(opc.s);
        System.out.println(opc.a);
    }

}

// not a publc class
class Hello {}

// not a public class
class World {}



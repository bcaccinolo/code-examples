
class Initializers {

    int a;

    // instance initializer
    { 
        int b;

        System.out.println("in the instance initializer");
        System.out.println(a);
        System.out.println(b); // doesn't compile cause local var are not initialized
    }

    // static initializer
    static { 
        System.out.println("in the static initializer"); 

    }

    public static void main(String[] args) {

        System.out.println("in the main");

        new Initializers();

    }



}


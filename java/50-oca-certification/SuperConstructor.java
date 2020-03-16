

class ParentConstructor {

    // ParentConstructor(int a) {
    ParentConstructor() {
        System.out.println("ParentConstructor no param constructor");
    }

    protected void hello() {
        System.out.println("hello from Parent");
    }

}


public class SuperConstructor extends ParentConstructor {

    SuperConstructor() {
        // super(1); // it doesn't compile without this line. Cause else
                    // it searches for parent's default constructor

        this(1);

        System.out.println("SuperConstructor no param constructor");        
    }

    SuperConstructor(int a) {
        System.out.println("SuperConstructor one param constructor");
        hello();
    }

    public void hello() {
        System.out.println("hello from child");
    }

    public static void main(String[] args) {
        SuperConstructor sc = new SuperConstructor();
        sc.hello();
    }

}




// Test Overloading methods

class Overloading {

    public Overloading(int a) {}

    public Overloading(int a, int b) {}

    static void hello(int i, int j) {
        System.out.println("both int");
    }

    static void hello(long i, int j) {
        i = 4;
        System.out.println("one long and one int: " + i);
    }

    static void hello(long i, long j) {
        System.out.println("both long");
    }

    public static void main(String[] args) {
        hello(1, 2);
        hello((long) 1, 2);
        hello((long) 1, (long) 2);
    }

}





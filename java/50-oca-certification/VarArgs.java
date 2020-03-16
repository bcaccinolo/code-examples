
class VarArgs {

    static void hello(int a, int... b) {
        System.out.println(b.length);
    }

    public static void main(String[] args) {
        hello(1);
        hello(1, 2, 3);
        hello(1, new int[4]);
        hello(1, new int[]{1,2,3});
        
        // hello(1, {2, 3, 4}); // Compilation error
    }

}


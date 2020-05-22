// package overloadinghiding;


class Base {

    static void staticHello() {
        System.out.println("static hello from Base");
    }

    void hello() {
        System.out.println("hello from Base");
        privateHello();
        localHello();
    }

    void localHello() {
        System.out.println("Base Local Hello");
    }

    private void privateHello() {
        System.out.println("Base Private Hello");
    }

}

class OverriddingVsHiding extends Base {

    static void staticHello() {
        Base.staticHello();
        System.out.println("static hello from Overriding Vs Hiding");
    }

    // void hello() {
    //     System.out.println("hello from Overriding Vs Hiding");
    //     super.hello(); // parent hello() is not really overridden.
    // }

    void localHello() {
        System.out.println("Overriding Local Hello");
    }

    private void privateHello() {
        System.out.println("Overriding Private Hello");
    }

    public static void main(String[] args) {

        // OverriddingVsHiding.staticHello();

        OverriddingVsHiding ovh = new OverriddingVsHiding();
        ovh.hello();
    }

}
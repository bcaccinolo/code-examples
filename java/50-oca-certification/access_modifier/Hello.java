package access_modifier;

public class Hello {

    // default method
    // >>> not accessible in a sub-package
    // >>> just in the same package
    //
    static void default_world() {
        System.out.println(">>> default hello world ");
    }

    // public method
    public static void public_world() {
        System.out.println(">>> default hello world ");
    }

    // protected method
    protected static void protected_world() {
        System.out.println(">>> default hello world ");
    }

    // private method
    private static void private_world() {
        System.out.println(">>> default hello world ");
    }
}

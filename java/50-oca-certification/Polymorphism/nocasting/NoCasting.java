
class Primate {
    int age = 10;

    public boolean isPrimate() {
        return true;
    }
}

interface HasTails {
    boolean isTailStripped();

    default String getInterfaceName() {
        return "HasTails";
    }

    static void helloInterface() {
        System.out.println("hello from interface");
    }
}

class Lemur extends Primate implements HasTails {

    public boolean isTailStripped() {
        return true;
    }

    public static void main(String[] args) {
        Lemur lemur = new Lemur();

        System.out.println(lemur.getInterfaceName());

        Primate primate = lemur;

        // System.out.println(primate.getInterfaceName()); COMPILE ERROR

        Lemur lemur2 = (Lemur) primate;

        System.out.println(lemur2.getInterfaceName());

        Object obj = lemur;

        // Reverse casting
        // Cast a superclass to a subclass
        Primate pr = new Primate();
        // Lemur le = (Lemur) pr; // Throws Exception
        // System.out.println(le.isTailStripped());

        HasTails.helloInterface(); // calling a static method from an interface

    }
}


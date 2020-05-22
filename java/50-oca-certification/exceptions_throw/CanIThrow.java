
public class CanIThrow {

    void thrower() throws RuntimeException {

        throw new Error();

    }

    public static void main(String[] args) {

        System.out.println("Hello!");

        var canIThrow = new CanIThrow();
        canIThrow.thrower();

    }
}

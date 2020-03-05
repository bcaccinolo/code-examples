
class Primate {
    int age = 10;
}

interface HasTails {
    boolean isTailStripped();
}

class Lemur extends Primate implements HasTails {

    public boolean isTailStripped() {
        return true;
    }

    public static void main(String[] args) {
        Lemur lemur = new Lemur();

        Primate primate = lemur;

        Lemur lemur2 = (Lemur) primate;

    }
}


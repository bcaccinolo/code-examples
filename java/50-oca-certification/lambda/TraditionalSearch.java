
import java.util.*;
import java.util.function.*;

class Animal {
    private String species;
    private boolean canHop;
    private boolean canSwim;

    public Animal(String speciesName, boolean hopper, boolean swimmer) {
        species = speciesName;
        canHop = hopper;
        canSwim = swimmer;
    }

    public boolean canHop() { return canHop; }
    public boolean canSwim() { return canSwim; }
    public String toString() { return species; }
}


interface CheckTrait {
    boolean coucou(Animal a);
}

class CheckIsHopper implements CheckTrait {
    public boolean coucou(Animal a) {
        return a.canHop();
    }
}

class TraditionalSearch {

    public static void main(String[] args){

        One one = new One(); // accessible without an import

        List<Animal> list = new ArrayList<>();
        list.add(new Animal("elephant", false, true));
        list.add(new Animal("fish"    , true, true));
        list.add(new Animal("tiger"   , true, false));

        // print(list, new CheckIsHopper());
        print(list, (a) -> a.canHop() );
    }

    // public static void print(List<Animal> list, CheckTrait checker) {
    public static void print(List<Animal> list, Predicate<Animal> checker) {
        for(Animal a : list) {
            if(checker.test(a)) {
                System.out.print(a.toString() + ", ");
            }
        }
    }
}
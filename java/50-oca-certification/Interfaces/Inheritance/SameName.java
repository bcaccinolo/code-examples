
interface Omnivore {
  void eatPlants();
}

interface Carnivore {
  int eatPlants();
}

class Animal implements Omnivore, Carnivore {

  Animal() {
    System.out.println("Animal here!");
  }

  public void eatPlants() {
    System.out.println("miam plants!");
  }

  public static void main(String[] args) {
    Animal animal = new Animal();
  }

}

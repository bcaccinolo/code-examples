

class Rabbit {

    static void eatLettuce() throws RuntimeException {
        System.out.println("eat lettuce");
    }

    static void eatCarrot() throws Exception {
        System.out.println("eat carrot");
    }

    static void eatAllWithCatch() {
        
        eatLettuce();

        try {
            eatCarrot();
        } catch(Exception e) {
            System.out.println("exception catched");
        }
    }

    static void eatAllAndDeclare() throws Exception {
        eatCarrot();
    }

    public static void main(String[] args) {
        eatAllWithCatch();
        try {
            eatAllAndDeclare();
        } catch(Exception e) {
            System.out.println("catched exception");
        }

    }

}



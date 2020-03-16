
class TryCatch {

    public static void main(String[] args) {

        System.out.println("coucou");

        // throw new java.lang.RuntimeException("coucou2");
        // throw new java.lang.RuntimeException("coucou3"); // compilation error

        try {
            throw new java.lang.RuntimeException("coucou");            
        } catch(java.lang.RuntimeException e) {
            System.out.println("runtime exception catched");

            throw new java.lang.RuntimeException("coucou2");
        } finally {
            System.out.println("in the finally");

            // throw new java.lang.RuntimeException("coucou3");
        }

    }
}
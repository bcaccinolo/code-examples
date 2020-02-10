
/*
 *    This code doesn't compile cause the var 'name' is immutable, final.
 */
class ImmutableString {

    final String name = "john";

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public static void main(String[] args) {

        ImmutableString is = new ImmutableString();

        System.out.println(is.getName());
    }
}
package org.qbeek;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        System.out.println( "Hello World!" );

        var impl = new BaseImpl();
        impl.coucou();
        impl.coucou2();

        var implGeneric = new BaseGenericImpl();
        implGeneric.coucou();
        implGeneric.coucou2(42);
    }
}

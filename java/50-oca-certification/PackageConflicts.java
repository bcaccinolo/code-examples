
/**
 * Class to show package conflicts on compilation

 * javac PackageConflicts.java

 * java PackageConflicts

 */

// Conflict
// import java.util.Date;
// import java.sql.Date;

// No Conflict - Date from util is the default
// You have a notification on compilation
import java.util.Date;
import java.sql.*;

class PackageConflicts {

    public static void main(String[] args) {
        System.out.println("conflicts !");

        Date.parse("2020/12/12");
    }

}

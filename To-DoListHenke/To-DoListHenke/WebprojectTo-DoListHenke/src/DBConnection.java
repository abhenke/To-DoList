import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
   static Connection connection = null;

   static void getDBConnection() {
      connection = null;
      try {
          Class.forName("com.mysql.jdbc.Driver");
       } catch (ClassNotFoundException e) {
          System.out.println("Where is your MySQL JDBC Driver?");
          e.printStackTrace();
          return;
       }
       System.out.println("MySQL JDBC Driver Registered!");
      try {
         
         connection = DriverManager.getConnection("jdbc:mysql://ec2-3-15-238-255.us-east-2.compute.amazonaws.com:3306/MyDBHenke0930", "ahenke", "ah6708511");
      } catch (Exception e) {
         System.out.println("Connection Failed! Check output console");
         e.printStackTrace();
         return;
      }
   }
}

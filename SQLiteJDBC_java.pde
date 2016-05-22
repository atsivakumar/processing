import java.sql.*;
//String args[] = new String [5];
  void setup()
  {
    mainMeth(); 
  }
  
  void draw()
  {
    //mainMeth();
  }
  void mainMeth()
  {
    Connection c = null;
    Statement stmt = null;
    String sql_insert_data = "";
    try {
      Class.forName("org.sqlite.JDBC");
      c = DriverManager.getConnection("jdbc:sqlite:test1.db");
      //System.out.println("Opened database successfully");

      stmt = c.createStatement();
      /* Create a new table names COMPANY */
      String sql_create_table = "CREATE TABLE person " +
                   "(ID INT PRIMARY KEY     NOT NULL," +
                   " NAME           TEXT    NOT NULL, " +
                   " AGE            INT     NOT NULL, " +
                   " ADDRESS        CHAR(50), " +
                   " SALARY         REAL)";
      /* Enable the below line to drop the table */
      String sql_drop_table = "DROP TABLE IF EXISTS person";  
      /* list the data from the table */
      String sql_select_data = "SELECT * FROM person;";
      /* drop the table for clean up */
      System.out.println("Dropping existing table with name person, if any");
      //stmt.executeUpdate(sql_drop_table); // this is the time when it get executed
      System.out.println();
      
      System.out.println("Creating new table");
      //stmt.executeUpdate(sql_create_table);
      System.out.println();
      
      
      System.out.println("Inserting data in to the table");
       /* Add data to the table */ 
      sql_insert_data = "INSERT INTO person VALUES( 1001, 'siva', 25, '20990 Valley Green Drive', 1000.50 );" ;
      //stmt.executeUpdate(sql_insert_data);
      
       /* Add data to the table */ 
      sql_insert_data = "INSERT INTO person VALUES( 1002, 'shivika', 45, '20990 Valley Green Drive', 1.50 );" ;
      //stmt.executeUpdate(sql_insert_data);
      
      /* Add data to the table */ 
      sql_insert_data = "INSERT INTO person VALUES( 1003, 'radhika', 20, '20990 Valley Green Drive', 100.50 );" ;
      //stmt.executeUpdate(sql_insert_data);
      
      /* Add data to the table */
      
      //for ( int i = 1; i<=1000; i++){
        
      //  sql_insert_data = "INSERT INTO person VALUES( " + i + ", 'shreyas', 70, '20990 Valley Green Drive', 3.50 );" ;
      //  stmt.executeUpdate(sql_insert_data);
      
      //}
      System.out.println("Selecting data from the table");
      ResultSet rs = stmt.executeQuery( "SELECT * FROM person;" );
      
      while ( rs.next() ) {
         int id = rs.getInt("id");
         String  name = rs.getString("name");
         int age  = rs.getInt("age");
         String  address = rs.getString("address");
         float salary = rs.getFloat("salary");
         System.out.println( "ID = " + id );
         System.out.println( "NAME = " + name );
         System.out.println( "AGE = " + age );
         System.out.println( "ADDRESS = " + address );
         System.out.println( "SALARY = " + salary );
         System.out.println();
      }
      rs.close();
      stmt.close();
      
      //String result; 
      //result = "" + stmt.executeUpdate(sql_select_data);
      //System.out.println(result);
      
      //System.out.println("Dropping the new table just created");
      //stmt.executeUpdate(sql_drop_table);
      stmt.close();
      c.close();
    } catch ( Exception e ) {
      System.err.println( e.getClass().getName() + ": " + e.getMessage() );
      System.exit(0);
    }
    //System.out.println("Table created successfully");
  }
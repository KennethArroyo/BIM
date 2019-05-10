package bim.datos;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/**
 *
 * @author Kenneth
 */
public class RelDataBase {
    //public static final String PROPERTIES_FILE_NAME="BolsaEmpleo.properties";        
    Connection cnx;
    public RelDataBase(){
        cnx=this.getConnection();            
    }
//jdbc:sqlserver://localhost:1433;databaseName=BIM [UserBIM on USERBIM]
     public Connection getConnection(){
        try {
            /*+ "encrypt=true;"
                        + "trustServerCertificate=false;"
                        + "hostNameInCertificate=*.database.windows.net;"
                        + "loginTimeout=30;"*/
            //Properties prop = new Properties();
            //URL resourceUrl = getClass().getResource(PROPERTIES_FILE_NAME);
            //File file = new File(resourceUrl.toURI());            
            //prop.load(new BufferedInputStream(new FileInputStream(file)));
            String connectionUrl =
                "jdbc:sqlserver://192.170.10.84;"
                        + "database=BIM;"
                        + "user=sa;"
                        + "password=Pa$$w0rd;";
            
//             "jdbc:sqlserver://localhost;"
//                        + "database=BIM;"
//                        + "user=UserBIM;"
//                        + "password=root;";     

            String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            Class.forName(driver).newInstance();
            return DriverManager.getConnection(connectionUrl);
        } catch (Exception e) {
            String h = e.getMessage();
            String x = e.getMessage();
            System.exit(-1);
        } 
        return null;
    }

    public int executeUpdate(String statement) {
        try {
            Statement stm = cnx.createStatement();
            stm.executeUpdate(statement);
            return stm.getUpdateCount();
        } catch (SQLException ex) {
            return 0;
        }
    }
    public ResultSet executeQuery(String statement){
        try {
            Statement stm = cnx.createStatement();
            return stm.executeQuery(statement);
        } catch (SQLException ex) {
            return null;
        }
        
    }
    
    public int executeUpdateWithKeys(String statement) {
        try {
            Statement stm = cnx.createStatement();
            stm.executeUpdate(statement,Statement.RETURN_GENERATED_KEYS);
            ResultSet keys = stm.getGeneratedKeys();
            keys.next();
            return keys.getInt(1);
        } catch (SQLException ex) {
            return -1;
        }
    }    
}
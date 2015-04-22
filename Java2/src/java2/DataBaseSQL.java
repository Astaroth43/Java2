package java2;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import com.mysql.jdbc.Statement;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.Executor;

public class DataBaseSQL implements Connection {
    private final String server;
    private final String user;
    private final String pass;
    private final String driver;
    private Connection connection;
    PreparedStatement pstmt;

    public DataBaseSQL(){
        this.driver = "com.mysql.jdbc.Driver";
        this.pass = "";
        this.user = "root";
        this.server = "jdbc:mysql://localhost/jmasters";
            try{
                Class.forName(driver);
                connection = DriverManager.getConnection(server,user,pass);
                System.out.println("Conexion realizada con exito");
            }catch(ClassNotFoundException | SQLException e){
                System.out.println("Conexion NO realizada");
            }
    }

    public static void main(String[] args){
        DataBaseSQL db = new DataBaseSQL();
        db.select("empleado", 1);
        //db.free("insert into prueba values(null, \"Hola\")");
    }

    public void free(String q){
        try {
            Statement query = (Statement) connection.createStatement();
            query.executeUpdate("insert into prueba values(null, 'Hola')");
            System.out.println("Exito");
            query.close();
        } catch (SQLException e) {
            System.out.println("FAIL");
        }
    }
    
    public void insert(String tabla, String[] values){
        try {
            Statement query = (Statement) connection.createStatement();
            String q1;
            q1 = "insert into " + tabla + " values( null, ";
            for(String txt : values){
                q1 += "'" + txt + "', ";
            }
            q1 = q1.substring(0, q1.length()-2);
            q1 += ")";
            System.out.println(q1);
            query.executeUpdate(q1);
            System.out.println("Exito");
            query.close();
        } catch (SQLException e) {
           // System.out.println("FAIL \n error: " + e.getCause() + "\ncause " + e.getCause() + "\nin" + e.getClass());
        }
    }
    
    public ResultSet select(String tabla, int id){
        try {
            Statement query = (Statement) connection.createStatement();
            ResultSet rs;
            String q1;
            q1 = "select * from " + tabla + " where id = " + id ;
            System.out.println("-" + q1 + "-");
            rs = query.executeQuery(q1);
            System.out.println("Exito select");
            query.close();
            return rs;
        } catch (SQLException e) {
             System.out.println("Error en el select");
            return null;
        }  
    }
    
    public ResultSet select(String tabla){
        try {
            Statement query = (Statement) connection.createStatement();
            ResultSet rs;
            String q1;
            q1 = "select * from " + tabla;
            System.out.println(q1);
            rs = query.executeQuery(q1);
            System.out.println("Exito");
            
            
            
            query.close();
            return rs;
        } catch (SQLException e) {
            System.out.println("FAIL");
            return null;
        }  
    }
        
    
    public Connection getConnection(){
        return connection;
    }

    @Override
    public boolean isWrapperFor(Class<?> iface) throws SQLException {
            // TODO Auto-generated method stub
            return false;
    }

    @Override
    public <T> T unwrap(Class<T> iface) throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public void abort(Executor executor) throws SQLException {
            // TODO Auto-generated method stub

    }

    @Override
    public void clearWarnings() throws SQLException {
            // TODO Auto-generated method stub

    }

    @Override
    public void close() throws SQLException {
            // TODO Auto-generated method stub

    }

    @Override
    public void commit() throws SQLException {
            // TODO Auto-generated method stub

    }

    @Override
    public Array createArrayOf(String typeName, Object[] elements)
                    throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public Blob createBlob() throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public Clob createClob() throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public NClob createNClob() throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public SQLXML createSQLXML() throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public java.sql.Statement createStatement() throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public java.sql.Statement createStatement(int resultSetType,
                    int resultSetConcurrency) throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public java.sql.Statement createStatement(int resultSetType,
                    int resultSetConcurrency, int resultSetHoldability)
                    throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public Struct createStruct(String typeName, Object[] attributes)
                    throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public boolean getAutoCommit() throws SQLException {
            // TODO Auto-generated method stub
            return false;
    }

    @Override
    public String getCatalog() throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public Properties getClientInfo() throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public String getClientInfo(String name) throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public int getHoldability() throws SQLException {
            // TODO Auto-generated method stub
            return 0;
    }

    @Override
    public DatabaseMetaData getMetaData() throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public int getNetworkTimeout() throws SQLException {
            // TODO Auto-generated method stub
            return 0;
    }

    @Override
    public String getSchema() throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public int getTransactionIsolation() throws SQLException {
            // TODO Auto-generated method stub
            return 0;
    }

    @Override
    public Map<String, Class<?>> getTypeMap() throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public SQLWarning getWarnings() throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public boolean isClosed() throws SQLException {
            // TODO Auto-generated method stub
            return false;
    }

    @Override
    public boolean isReadOnly() throws SQLException {
            // TODO Auto-generated method stub
            return false;
    }

    @Override
    public boolean isValid(int timeout) throws SQLException {
            // TODO Auto-generated method stub
            return false;
    }

    @Override
    public String nativeSQL(String sql) throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public CallableStatement prepareCall(String sql) throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public CallableStatement prepareCall(String sql, int resultSetType,
                    int resultSetConcurrency) throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public CallableStatement prepareCall(String sql, int resultSetType,
                    int resultSetConcurrency, int resultSetHoldability)
                    throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public PreparedStatement prepareStatement(String sql) throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public PreparedStatement prepareStatement(String sql, int autoGeneratedKeys)
                    throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public PreparedStatement prepareStatement(String sql, int[] columnIndexes)
                    throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public PreparedStatement prepareStatement(String sql, String[] columnNames)
                    throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public PreparedStatement prepareStatement(String sql, int resultSetType,
                    int resultSetConcurrency) throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public PreparedStatement prepareStatement(String sql, int resultSetType,
                    int resultSetConcurrency, int resultSetHoldability)
                    throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public void releaseSavepoint(Savepoint savepoint) throws SQLException {
            // TODO Auto-generated method stub

    }

    @Override
    public void rollback() throws SQLException {
            // TODO Auto-generated method stub

    }

    @Override
    public void rollback(Savepoint savepoint) throws SQLException {
            // TODO Auto-generated method stub

    }

    @Override
    public void setAutoCommit(boolean autoCommit) throws SQLException {
            // TODO Auto-generated method stub

    }

    @Override
    public void setCatalog(String catalog) throws SQLException {
            // TODO Auto-generated method stub

    }

    @Override
    public void setClientInfo(Properties properties)
                    throws SQLClientInfoException {
            // TODO Auto-generated method stub

    }

    @Override
    public void setClientInfo(String name, String value)
                    throws SQLClientInfoException {
            // TODO Auto-generated method stub

    }

    @Override
    public void setHoldability(int holdability) throws SQLException {
            // TODO Auto-generated method stub

    }

    @Override
    public void setNetworkTimeout(Executor executor, int milliseconds)
                    throws SQLException {
            // TODO Auto-generated method stub

    }

    @Override
    public void setReadOnly(boolean readOnly) throws SQLException {
            // TODO Auto-generated method stub

    }

    @Override
    public Savepoint setSavepoint() throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public Savepoint setSavepoint(String name) throws SQLException {
            // TODO Auto-generated method stub
            return null;
    }

    @Override
    public void setSchema(String schema) throws SQLException {
            // TODO Auto-generated method stub

    }

    @Override
    public void setTransactionIsolation(int level) throws SQLException {
            // TODO Auto-generated method stub

    }

    @Override
    public void setTypeMap(Map<String, Class<?>> map) throws SQLException {
            // TODO Auto-generated method stub

    }

}


import ballerina/io;
import ballerina/java.jdbc;
// import ballerina/auth;
import ballerina/sql;
// import ballerina/time;





public function main() {
    jdbc:Client|sql:Error jdbcClient =  new ("jdbc:postgresql://localhost:5432/datatypes","postgres","postgres");
           
    if (jdbcClient is jdbc:Client) {

        sql:Error|sql:ExecutionResult result = setUp(jdbcClient);

        int|string|sql:Error? err = tableCreations(jdbcClient);

        sql:ExecutionResult| sql:Error? insertResult = tableInsertions(jdbcClient);

        sql:Error? selectionResult = tableSelections(jdbcClient);
        
        sql:Error? e = jdbcClient.close();  

        if(e is sql:Error){
            io:println("Conection close failed!!");
        } 
    } 
    else {
        io:println("Initialization failed!!");
        io:println(jdbcClient);
    }
}


















import ballerina/io;
import ballerina/java.jdbc;
// import ballerina/auth;
import ballerina/sql;
// import ballerina/time;



function setUp(jdbc:Client jdbcClient) returns sql:Error|sql:ExecutionResult{

    sql:ExecutionResult|sql:Error result; 

    result = jdbcClient->execute("DROP TYPE IF EXISTS enumValues CASCADE;");

    if(result is sql:Error){
        io:println("Error occurred while creating the enum type..");
        io:println(result);
    }
    
    result = jdbcClient->execute("CREATE TYPE enumValues AS ENUM ('value1','value2','value3')");

    if(result is sql:Error){
        io:println("Error occurred while creating the enum type..");
        io:println(result);
    }

    
    result = jdbcClient->execute("DROP TYPE IF EXISTS complex CASCADE;");

    if(result is sql:Error){
        io:println("Error occurred while creating the complex type..");
        io:println(result);
    }
    
    result = jdbcClient->execute("CREATE TYPE complex AS (r double precision,i double precision)");

    if(result is sql:Error){
        io:println("Error occurred while creating the complex type..");
        io:println(result);
    }

    result = jdbcClient->execute("DROP TYPE IF EXISTS inventory_item CASCADE;");

    if(result is sql:Error){
        io:println("Error occurred while creating the inventory_item type..");
        io:println(result);
    }
    
    result = jdbcClient->execute("CREATE TYPE inventory_item AS (name text,supplier_id integer,price numeric)");

    if(result is sql:Error){
        io:println("Error occurred while creating the inventory_item type..");
        io:println(result);
    }


    result = jdbcClient->execute("DROP TYPE IF EXISTS floatrange CASCADE;");

    if(result is sql:Error){
        io:println("Error occurred while creating the floatrange type..");
        io:println(result);
    }
    
    result = jdbcClient->execute("CREATE TYPE floatrange AS RANGE (subtype = float8,subtype_diff = float8mi )");

    if(result is sql:Error){
        io:println("Error occurred while creating the floatrange type..");
        io:println(result);
    }


    result = jdbcClient->execute("DROP Domain IF EXISTS posint CASCADE;");

    if(result is sql:Error){
        io:println("Error occurred while creating the posint domain..");
        io:println(result);
    }
    
    result = jdbcClient->execute("CREATE DOMAIN posint AS integer CHECK (VALUE > 0);");

    if(result is sql:Error){
        io:println("Error occurred while creating the posint domain..");
        io:println(result);
    }


    return result;

}






public function main() {
    jdbc:Client|sql:Error jdbcClient =  new ("jdbc:postgresql://localhost:5432/functions","postgres","postgres");
           
    if (jdbcClient is jdbc:Client) {
        
        sql:Error|sql:ExecutionResult result = setUp(jdbcClient);
        // sql:ExecutionResult|sql:Error err = functionsCreations(jdbcClient);

         _ = functionCalls(jdbcClient);
        

        // sql:ExecutionResult| sql:Error tearResult = tearDown(jdbcClient);
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


public function functionCalls(jdbc:Client jdbcClient){

    // sql:ProcedureCallResult| sql:Error result;


    // _ = ReturnCheckFunction(jdbcClient);



    // return result;



}

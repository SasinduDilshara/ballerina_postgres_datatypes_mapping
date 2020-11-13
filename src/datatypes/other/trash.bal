
function insertQueryMaker(map<string> args) returns InsertQueries{

    string insertQuery = "";
    string columns = "";
    string values = "";

    insertQuery += "(";

    foreach var [column,value] in args.entries() {
       columns += column +",";
       values += "'"+value+"'" + ",";
    }
    int columnLength = columns.length();
    int valueLength = values.length();
    columns = columns.substring(0,columnLength - 1);
    values = values.substring(0,valueLength - 1);

    insertQuery += columns;
    insertQuery += ")";
    insertQuery += " Values ";
    insertQuery += "(";
    insertQuery += values;
    insertQuery += ")";

    InsertQueries result = {insertQuery};

    return result;


} 



// public function queryFnction(jdbc:Client jdbcClient ,string|int|boolean|float|decimal|byte[]|xml a, string|int|boolean|float|decimal|byte[]|xml b,decimal|string c, string|int d, string e, string f) returns sql:ExecutionResult|sql:Error{


// sql:ParameterizedQuery Query =
//             `select testFuncton(${a}::any ,${b}::anyelement, ${c}::anyarray, ${d}::anynonarray, ${e}::anyenum, ${f}::anyrange)`;
    

//     sql:ExecutionResult|sql:Error result = jdbcClient->execute(Query);

//     if (result is sql:ExecutionResult) {
//         io:println("Function successfully created");
//     } 
//     else{
//         io:println("\nError ocurred while creating the function\n");
//         io:println(result);
//         io:println("\n");
//     }
    
//     return result;


// }


// //===============================================================================================================================================================
// //===============================================================================================================================================================






// //.........................................................................................................


// public function createFunction(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

//     sql:ParameterizedQuery insertQuery =
//             `CREATE OR REPLACE FUNCTION testFunction(
//                                              --a any,
//                                              b anyelement,
//                                              c anyarray,
//                                              d anynonarray,
//                                              e anyenum,
//                                              f anyrange
//                                              --g anycompatible,
//                                             -- h anycompatiblearray,
//                                              --i anycompatiblenonarray,
//                                              --j anycompatiblerange,
//                                             --inout k cstring,
//                                             --inout l internal,
//                                             --out m language_handler,
//                                             --out n fdw_handler,
//                                             --out o table_am_handler,
//                                             --out p index_am_handler,
//                                             --out q tsm_handler,
//                                             --w unknown
//                                             ) RETURNS NUMERIC  AS $$
//                         BEGIN
//                             return 1;
//                         END; $$

//                         LANGUAGE plpgsql;`;
    

//     sql:ExecutionResult|sql:Error result = jdbcClient->execute(insertQuery);

//     if (result is sql:ExecutionResult) {
//         io:println("Function successfully created");
//     } 
//     else{
//         io:println("\nError ocurred while creating the function\n");
//         io:println(result);
//         io:println("\n");
//     }
    
//     return result;

// }

// // public function queryFnction(jdbc:Client jdbcClient ,any a, decimal[]|string[]|byte[] b,decimal|string c, string d, string e, string f) returns sql:ExecutionResult|sql:Error{


// // sql:ParameterizedQuery Query =
// //             `select testFuncton(a,b,c,d,e,f)`;
    

// //     sql:ExecutionResult|sql:Error result = jdbcClient->execute(Query);

// //     if (result is sql:ExecutionResult) {
// //         io:println("Function successfully created");
// //     } 
// //     else{
// //         io:println("\nError ocurred while creating the function\n");
// //         io:println(result);
// //         io:println("\n");
// //     }
    
// //     return result;


// // }

// //.........................................................................................................


// // ======================================================================================================================================================================================================================================================================

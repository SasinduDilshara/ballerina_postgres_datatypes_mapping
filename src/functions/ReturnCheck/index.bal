

// import ballerina/io;
// import ballerina/java.jdbc;
// // import ballerina/auth;
// import ballerina/sql;
// // import ballerina/time;


// function returnCheckCreateQuery(string name,string parameterName,string parameterType) returns string{


//     return "Create or replace Function "+name+"("+parameterName+" "+parameterType +") Returns "+parameterType+" as $$ begin "+
//             "return "+"$1"+"; "+
//             "end; $$ language plpgsql;";
// }

// function returnCheckDropQuery(string name,string parameterType) returns string{


//     return "Drop function "+name+"("+parameterType+");";
// }

// function returnCheckCreateQuery1(string name,string parameterName,string parameterType) returns string{


//     return "Create or replace Function "+name+"("+parameterName+" "+parameterType +") Returns "+parameterType+" as $$ begin "+
//             "return "+"$1"+"; "+
//             "end; $$ language plpgsql;";

//             //     create or replace function get_film_stat(
//             //     out min_len int,
//             //     out max_len int,
//             //     out avg_len numeric) 
//             // language plpgsql
//             // as $$
//             // begin
            
//             //   select min(length),
//             //          max(length),
//             // 		 avg(length)::numeric(5,1)
//             //   into min_len, max_len, avg_len
//             //   from film;

//             // end;$$
// }

// function returnCheckDropQuery1(string name,string parameterType) returns string{


//     return "Drop function "+name+"("+parameterType+");";
// }

// public type ReturnCheckRecord record{
//     decimal returnCheck;
// };






// public function ReturnCheckFunction(jdbc:Client jdbcClient){

//         string funcName = "returnCheck";
//         string checkValue = "returnValue";

//         string checkType = "serial";

//         // sql:SmallIntValue returnCheckType = new(1);
//         // sql:IntegerValue returnCheckType = new(2);
//         // sql:BigIntValue returnCheckType = new(3);
//         // int returnCheckType = 4;
//         decimal returnCheckType = 1.111;
//         // float returnCheckType = 2.2222;

//         string query = returnCheckCreateQuery(funcName,checkValue,checkType);


//         sql:ExecutionResult|sql:Error create = jdbcClient->execute(query);

//         if(create is sql:Error){
//             io:println("Creation err",create);
//         }
//         else{
//             io:println(query);

//         }

        

//         sql:ParameterizedQuery callQuery = `select returnCheck(
//                         ${returnCheckType}                                   
//                     )`;

//         stream<record{}, error> | sql:Error resultStream =
//             jdbcClient->query(callQuery, ReturnCheckRecord);

        
//         io:println("resultStream",resultStream);

//         stream<ReturnCheckRecord, sql:Error> customerStream =
//             <stream<ReturnCheckRecord, sql:Error>>resultStream;

//         // io:println("resultStream",resultStream);
        
//         error? e = customerStream.forEach(function(ReturnCheckRecord rec) {
//             io:println("\n");
//             io:println(rec.returnCheck);
//             io:println("\n");
//         });
//         if (e is error) {
//         io:println(e);
//     }

//         string dquery = returnCheckDropQuery(funcName,checkType);


//         sql:ExecutionResult|sql:Error drop = jdbcClient->execute(dquery);

//         if(drop is sql:Error){
//             io:println(drop);
//         }
//         else{
//             io:println(dquery);

//         }




// }


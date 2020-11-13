// import ballerina/io;
// import ballerina/java.jdbc;
// // import ballerina/auth;
// import ballerina/sql;
// // import ballerina/time;



// function setUp(jdbc:Client jdbcClient) returns sql:Error|sql:ExecutionResult{

//     sql:ExecutionResult|sql:Error result; 

//     result = jdbcClient->execute("DROP TYPE IF EXISTS enumValues CASCADE;");

//     if(result is sql:Error){
//         io:println("Error occurred while creating the enum type..");
//         io:println(result);
//     }
    
//     result = jdbcClient->execute("CREATE TYPE enumValues AS ENUM ('value1','value2','value3')");

//     if(result is sql:Error){
//         io:println("Error occurred while creating the enum type..");
//         io:println(result);
//     }

    
//     result = jdbcClient->execute("DROP TYPE IF EXISTS complex CASCADE;");

//     if(result is sql:Error){
//         io:println("Error occurred while creating the complex type..");
//         io:println(result);
//     }
    
//     result = jdbcClient->execute("CREATE TYPE complex AS (r double precision,i double precision)");

//     if(result is sql:Error){
//         io:println("Error occurred while creating the complex type..");
//         io:println(result);
//     }

//     result = jdbcClient->execute("DROP TYPE IF EXISTS inventory_item CASCADE;");

//     if(result is sql:Error){
//         io:println("Error occurred while creating the inventory_item type..");
//         io:println(result);
//     }
    
//     result = jdbcClient->execute("CREATE TYPE inventory_item AS (name text,supplier_id integer,price numeric)");

//     if(result is sql:Error){
//         io:println("Error occurred while creating the inventory_item type..");
//         io:println(result);
//     }


//     result = jdbcClient->execute("DROP TYPE IF EXISTS floatrange CASCADE;");

//     if(result is sql:Error){
//         io:println("Error occurred while creating the floatrange type..");
//         io:println(result);
//     }
    
//     result = jdbcClient->execute("CREATE TYPE floatrange AS RANGE (subtype = float8,subtype_diff = float8mi )");

//     if(result is sql:Error){
//         io:println("Error occurred while creating the floatrange type..");
//         io:println(result);
//     }


//     result = jdbcClient->execute("DROP Domain IF EXISTS posint CASCADE;");

//     if(result is sql:Error){
//         io:println("Error occurred while creating the posint domain..");
//         io:println(result);
//     }
    
//     result = jdbcClient->execute("CREATE DOMAIN posint AS integer CHECK (VALUE > 0);");

//     if(result is sql:Error){
//         io:println("Error occurred while creating the posint domain..");
//         io:println(result);
//     }


//     return result;

// }






// public function main() {
//     jdbc:Client|sql:Error jdbcClient =  new ("jdbc:postgresql://localhost:5432/functions","postgres","postgres");
           
//     if (jdbcClient is jdbc:Client) {
        
//         sql:Error|sql:ExecutionResult result = setUp(jdbcClient);
//         sql:ExecutionResult|sql:Error err = functionsCreations(jdbcClient);

//         // sql:ProcedureCallResult| sql:Error callResults = functionsCalls(jdbcClient);
        

//         sql:ExecutionResult| sql:Error tearResult = tearDown(jdbcClient);
//         sql:Error? e = jdbcClient.close();  

//         if(e is sql:Error){
//             io:println("Conection close failed!!");
//         } 
//     } 
//     else {
//         io:println("Initialization failed!!");
//         io:println(jdbcClient);
//     }
// }


// function dropQuery(string name, string parameters,string parameters1, string[] types) returns string{

//     string query = "DROP function "+
//                      name
//                      +" ("+
//                      parameters+
//                      ");";
//                      query+="\n";
//         foreach var typeName in types {
//             query += "DROP function "+
//                      name
//                      +" ("+
//                      typeName+
//                      ");";
//             query+="\n";

//         }
//     return query;

// }
// // CREATE OR REPLACE FUNCTION increment(i integer) RETURNS integer AS $$
// //         BEGIN
// //                 RETURN i + 1;
// //         END;
// // $$ LANGUAGE plpgsql;

// function createQuery(string name, string parameters,string inParameter,string[] types,string logic) returns string{

//     string query = "Create or replace function "+
//                     name+" ( "+
//                     parameters + " ) "+
//                     " as $$ "+
//                     "begin "+
//                     logic +
//                     " "+
//                     "end; $$ language plpgsql;";
//             query+="\n";
//         foreach var typeName in types {
//             query += "Create or replace function "+
//                     name+" ( "+
//                     inParameter + " ) "+
//                     "Returns "+ typeName+
//                     " as $$ "+
//                     "begin "+
//                     "select $1;" +
//                     " "+
//                     "end; $$ language plpgsql;";
//             query+="\n";
//         }
//     return query;

// }


// function createParas(map<string> args) returns string{

//     string sent = "";

//     foreach var [name,datatype] in args.entries() {
//         sent += name + " " + datatype+",";
//     }
//     int valueLength = sent.length();
//     sent = sent.substring(0,valueLength - 1);

//     return sent;

// }

// function createDrops(map<string> args) returns string{

//     string sent = "";

//     foreach var [name,datatype] in args.entries() {
//         sent += datatype+",";
//     }
//     int valueLength = sent.length();
//     sent = sent.substring(0,valueLength - 1);

//     return sent;

// }
// function createParas1(map<string> args) returns string{

//     string sent = "";
//     string intype = "";
//     int i =0;
//     foreach var [name,datatype] in args.entries() {
//         sent += name + " " + datatype+",";
//         intype = datatype;
//         i+=1;
//         if(i == 1){
//             i = 0;
//             break;
//         }
//     }
//     int valueLength = sent.length();
//     sent = sent.substring(0,valueLength - 1);

//     return sent;

// }

// function createDrops1(map<string> args) returns string{

//     string sent = "";
//     int i =0;

//     foreach var [name,datatype] in args.entries() {
//         sent += datatype+",";
//         i+=1;
//         if(i == 1){
//             i = 0;
//             break;
//         }
//     }
//     int valueLength = sent.length();
//     sent = sent.substring(0,valueLength - 1);

//     return sent;

// }

// function tearDown(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

//     sql:ExecutionResult|sql:Error result;


//     result = numericalTearDown(jdbcClient);
//     // result = moneyTearDown(jdbcClient);
//     // result = CharacterTearDown(jdbcClient);
//     // result = binaryTearDown(jdbcClient);
//     // result = datetimeTearDown(jdbcClient);

//     // result = booleanTearDown(jdbcClient);
//     // result = geometricTearDown(jdbcClient);
//     // result = networkTearDown(jdbcClient);
//     // result = bitTearDown(jdbcClient);
//     // result = textsearchTearDown(jdbcClient);
    
//     // result = uuidTearDown(jdbcClient);
//     // result = xmlTearDown(jdbcClient);
//     // result = jsonTearDown(jdbcClient);
//     // result = arrayTearDown(jdbcClient);
//     // result = rangeTearDown(jdbcClient);

//     return result;

// }

// function functionsCreations(jdbc:Client jdbcClient)  returns sql:ExecutionResult|sql:Error {

//     sql:ExecutionResult|sql:Error result;

//     result = createNumericFunctions(jdbcClient);
//     // result = createMoneyFunctions(jdbcClient);
//     // result = createCharacterFunctions(jdbcClient);
//     // result = createBinaryFunctions(jdbcClient);
//     // result = createDatetimeFunctions(jdbcClient);

//     // result = createBooleanFunctions(jdbcClient);
//     // result = createGeometricFunctions(jdbcClient);
//     // result = createNetworkFunctions(jdbcClient);
//     // result = createBitFunctions(jdbcClient);
//     // result = createTextsearchFunctions(jdbcClient);

//     // result = createUuidFunctions(jdbcClient);
//     // result = createXmlFunctions(jdbcClient);
//     // result = createJsonFunctions(jdbcClient);
//     // result = createArrayFunctions(jdbcClient);
//     // result = createRangeFunctions(jdbcClient);

//     return result;       

// }


// // function functionsCalls(jdbc:Client jdbcClient)  returns sql:ProcedureCallResult|sql:Error {

// //     sql:ProcedureCallResult|sql:Error result;


// //     return result;   

// // }


// // function createQuery(string name, string parameters,string inParameter,string types,string logic)
// string numFuncName = "numerictest";
// string numFuncParameters = createParas(values);
// string dropFuncParameters = createDrops(values);
// string numFuncParameters1 = createParas1(values);
// string dropFuncParameters1 = createDrops1(values);
// string[] numTypes = ["smallint","integer"];
// map<string> values = {
//     "smallIntInValue": numTypes[0],"inout smallIntOutValue":numTypes[0]
//     ,"IntInValue":numTypes[1],"inout intOutValue":numTypes[1]
//     // ,"bigIntInValue":"bigint","inout bigintOutValue":"bigint"
//     // ,"decimalVal":"decimal","inout decimalinOut":"decimal"
//     // ,"numericVal":"numeric","inout numericinOut":"numeric"
//     // ,"realVal":"real","inout realinOut":"real"
//     // ,"doublePrecisionVal":"double precision","inout doublePrecisioninOut":"double precision"
//     // ,"sserialVal":"smallSerial","inout smallSerialInOut":"smallSerial"
// };
// function createNumericFunctions(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

//     sql:ExecutionResult|sql:Error result;


//     string query = createQuery(
//         numFuncName,
//         numFuncParameters,
//         numFuncParameters1,
//         numTypes,
//         "select smallIntInValue into smallIntOutValue;"
//         +"select intInValue into intOutValue;"
//         // +"select bigIntInValue into bigintOutValue;"
//         // +"select decimalVal into decimalinOut; "
//         // +"select numericVal into numericinOut; "
//         // +"select realVal into realinOut; "
//         // +"select doublePrecisionVal into doublePrecisioninOut; "
//         // +"select sserialVal into smallSerialInOut; "
        
//     );
//     io:println(query);
//     result = jdbcClient->execute(query);

//     if(result is sql:ExecutionResult){
//         io:println("NumericTest Function is initialization Success");
//         io:println(result);
//         io:println("\n");
//     }
//     else{
//         io:println("NumericTest Function is initialization failed");
//         io:println(result);
//         io:println("\n");
//     }


//     return result;  

// }


// function numericFunctionCall(jdbc:Client jdbcClient,
//     sql:SmallIntValue inSmallInput,        int outSmallInput
//     // ,sql:IntegerValue Inputint,             int outInt
//     // ,sql:BigIntValue Inputbigint,           sql:BigIntValue outbigInt
//     // ,sql:DecimalValue inDecimal,            sql:DecimalValue inoutDecimal
//     // ,sql:NumericValue inNumericVal,         sql:NumericValue inoutNumericVal
//     // ,sql:RealValue inReal,                  sql:RealValue inoutReal
//     // ,sql:DoubleValue inDoublePrecisionVal,  sql:DoubleValue inoutDoublePrecisionVal
//     // ,sql:IntegerValue sserial,                  sql:IntegerValue serialInOut
//     )  returns sql:ProcedureCallResult|sql:Error {

// // ${inSmallInput},
// // ${outSmallInputId},
// // ${Inputint},
// // ${outIntId},
// // ${Inputbigint},
// // ${outbigIntId},
// // ${inDecimal},
// // ${decId},
// // ${inNumericVal},
// // ${numeId},
// // ${inReal},
// // ${realId},
// // ${inDoublePrecisionVal},
// // ${dpId},
// // ${sserial},
// // ${serialInOut}  


// // ${inSmallInput},
// // ${outSmallInputId},
// // ${Inputint},
// // ${outIntId},
// // ${Inputbigint},
// // ${outbigIntId},
// // ${inDecimal},
// // ${decId},
// // ${inNumericVal},
// // ${numeId},
// // ${inReal},
// // ${realId},
// // ${inDoublePrecisionVal},
// // ${dpId}   


//     sql:ProcedureCallResult|sql:Error result;

//     sql:InOutParameter outSmallInputId = new (outSmallInput);
//     // sql:InOutParameter outIntId = new (outInt);
//     // sql:InOutParameter outbigIntId = new (outbigInt);
//     // sql:InOutParameter decId = new (inoutDecimal);
//     // sql:InOutParameter numeId = new (inoutNumericVal);
//     // sql:InOutParameter realId = new (inoutReal);
//     // sql:InOutParameter dpId = new (inoutDoublePrecisionVal);
//     // sql:InOutParameter ssId = new (serialInOut);

//     sql:ParameterizedCallQuery callQuery =
//             `call numerictest(
//                 ${inSmallInput},
//                 ${outSmallInputId}
                             
//             )`;
    

//     result = jdbcClient->call(callQuery);

//     if (result is sql:ProcedureCallResult) {
//         io:println("\n");
//         io:println(result);
//         io:println("SmallInt"," - ",outSmallInputId.get(int));
//         // io:println("Int"," - ",outIntId.get(int));
//         // io:println("BigInt"," - ",outbigIntId.get(int));
//         // io:println("decimal"," - ",decId.get(decimal));
//         // io:println("numeric"," - ",numeId.get(decimal));
//         // io:println("real"," - ",realId.get(float));
//         // io:println("double"," - ",dpId.get(float));
//         io:println("Numeric procedure successfully created");
//         io:println("\n");
//     } 
//     else{
//         io:println("\nError ocurred while creating the Numeric procedure\n");
//         io:println(result);
//         io:println("\n");
//     }

//     return result;      

// }


// // string numFuncParameters = "smallIntInValue smallint, inout smallIntOutValue smallint";
// // string numFuncParameters = createParas(values);
// // string dropFuncParameters = createDrops(values);

// function numericalTearDown(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

//     sql:ExecutionResult|sql:Error result;


//     string query = dropQuery(
//         numFuncName,
//         dropFuncParameters,
//         dropFuncParameters1,
//         numTypes
//     );
//     io:println(query);
//     result = jdbcClient->execute(query);

//     if(result is sql:ExecutionResult){
//         io:println("NumericTest Function is drop Success");
//         io:println(result);
//         io:println("\n");
//     }
//     else{
//         io:println("NumericTest Function is drop failed");
//         io:println(result);
//         io:println("\n");
//     }


//     return result;  

// }






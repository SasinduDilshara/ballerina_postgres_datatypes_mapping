import ballerina/io;
import ballerina/java.jdbc;
// import ballerina/auth;
import ballerina/sql;
import ballerina/time;



time:Time time_ = time:currentTime();


string anyProcName = "anytest";
map<string> anyValues = {
    // "anyInValue": "any","inout anyInOutValue":"any"
    "anyelementInValue": "anyelement","inout anyelementInOutValue":"anyelement"
    ,"anyarrayInValue": "anyarray","inout anyarrayInOutValue":"anyarray"
    ,"anynonarrayInValue": "anynonarray","inout anynonarrayInOutValue":"anynonarray"
    ,"anyenumInValue": "anyenum","inout anyenumInOutValue":"anyenum"
    ,"anyrangeInValue": "anyrange","inout anyrangeInOutValue":"anyrange"
    ,"recordInValue": "record","inout recordInOutValue":"record"
};
string anyProcParameters = createParas( anyValues);
string dropAnyProcParameters = createDrops( anyValues);

function createAnyProcedures(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;

    string query = createQuery(
        anyProcName,
        anyProcParameters,
        // "select anyInValue into anyInOutValue;"
        "select anyelementInValue into anyelementInOutValue;"
        +"select anyarrayInValue into anyarrayInOutValue;"
        +"select anynonarrayInValue into anynonarrayInOutValue;"
        +"select anyenumInValue into anyenumInOutValue;"
        +"select anyrangeInValue into anyrangeInOutValue;"
        +"select recordInValue into recordInOutValue;"
        
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("any Procedure is initialization Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("any Procedure is initialization failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}

function anyProcedureCall(jdbc:Client jdbcClient
    // string anyInput,        string anyInOut,
    ,string anyelementInput,        string anyelementInOut
    ,sql:ArrayValue anyarrayInput,        sql:ArrayValue anyarrayInOut
    ,string anynonarrayInput,        string anynonarrayInOut
    ,string anyenumInput,        string anyenumInOut
    ,string anyrangeInput,        string anyrangeInOut
    ,string recordInput,        string recordInOut
    )  returns sql:ProcedureCallResult|sql:Error {

// ${inSmallInput} 
// ${anyInput}
// ,${anyInOutId}
// ,${anyelementInput}
// ,${anyelementInOutId}
// ,${anyarrayInput}
// ,${anyarrayInOutId}  

    sql:ProcedureCallResult|sql:Error result;

    // sql:InOutParameter anyInOutId = new (anyInOut);
    sql:InOutParameter anyelementInOutId = new (anyelementInOut);
    sql:InOutParameter anyarrayInOutId = new (anyarrayInOut);
    sql:InOutParameter anynonarrayInOutId = new (anynonarrayInOut);
    sql:InOutParameter anyenumInOutId = new (anyenumInOut);
    sql:InOutParameter anyrangeInOutId = new (anyrangeInOut);
    sql:InOutParameter recordInOutId = new (recordInOut);
    
    sql:ParameterizedCallQuery callQuery =
            `call anytest(
                ${anyelementInput}
                ,${anyelementInOutId}
                ,${anyarrayInput}
                ,${anyarrayInOutId}
                ,${anynonarrayInput}
                ,${anynonarrayInOutId}
                ,${anyenumInput}
                ,${anyenumInOutId}
                ,${anyrangeInput}
                ,${anyrangeInOutId}
                ,${recordInput}
                ,${recordInOutId}                  
            )`;
    

    result = jdbcClient->call(callQuery);

    if (result is sql:ProcedureCallResult) {
        io:println("\n");
        io:println(result);
        // io:println("any(n) value"," - ",anyInOutId.get(string));
        io:println("anyelement value"," - ",anyelementInOutId.get(string));
        io:println("anyarray value"," - ",anyarrayInOutId.get(string));
        io:println("anynonarray value"," - ",anynonarrayInOutId.get(string));
        io:println("anyenum value"," - ",anyenumInOutId.get(string));
        io:println("anyrange value"," - ",anyrangeInOutId.get(string));
        io:println("record value"," - ",recordInOutId.get(string));
        io:println("any procedure successfully created");
        io:println("\n");
    } 
    else{
        io:println("\nError ocurred while creating the any procedure\n");
        io:println(result);
        io:println("\n");
    }

    return result;      

}

function anyTearDown(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;


    string query = dropQuery(
        anyProcName,
        dropAnyProcParameters
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("any Procedure is drop Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("any Procedure is drop failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}










string complexProcName = "complextest";
map<string> cplxValues = {
    "complexInValue": "complex","inout complexInOutValue":"complex"
};
string complexProcParameters = createParas( cplxValues);
string dropComplexProcParameters = createDrops( cplxValues);

function createComplexProcedures(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;

    string query = createQuery(
        complexProcName,
        complexProcParameters,
        "select complexInValue into complexInOutValue;"
        
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("complex Procedure is initialization Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("complex Procedure is initialization failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}

function complexProcedureCall(jdbc:Client jdbcClient,
    string complexInput,        string complexInOut
    )  returns sql:ProcedureCallResult|sql:Error {

// ${inSmallInput} 


    sql:ProcedureCallResult|sql:Error result;

    sql:InOutParameter complexInOutId = new (complexInOut);
    
    sql:ParameterizedCallQuery callQuery =
            `call complextest(
                ${complexInput}::complex,
                ${complexInOutId}              
            )`;
    

    result = jdbcClient->call(callQuery);

    if (result is sql:ProcedureCallResult) {
        io:println("\n");
        io:println(result);
        io:println("complex value"," - ",complexInOutId.get(string));
        io:println("complex procedure successfully created");
        io:println("\n");
    } 
    else{
        io:println("\nError ocurred while creating the complex procedure\n");
        io:println(result);
        io:println("\n");
    }

    return result;      

}

function complexTearDown(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;


    string query = dropQuery(
        complexProcName,
        dropComplexProcParameters
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("complex Procedure is drop Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("complex Procedure is drop failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}









//.....................................................................................................................................................



string enumProcName = "enumtest";
map<string> enumValues = {
    "enumValuesInValue": "enumValues","inout enumValuesInOutValue":"enumValues"
};
string enumProcParameters = createParas( enumValues);
string dropEnumProcParameters = createDrops( enumValues);

function createEnumProcedures(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;

    string query = createQuery(
        enumProcName,
        enumProcParameters,
        "select enumValuesInValue into enumValuesInOutValue;"
        
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("enum Procedure is initialization Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("enum Procedure is initialization failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}

function enumProcedureCall(jdbc:Client jdbcClient,
    string enumValuesInput,        string enumValuesInOut
    )  returns sql:ProcedureCallResult|sql:Error {

// ${inSmallInput} 


    sql:ProcedureCallResult|sql:Error result;

    sql:InOutParameter enumValuesInOutId = new (enumValuesInOut);
    
    sql:ParameterizedCallQuery callQuery =
            `call enumtest(
                ${enumValuesInput}::enumvalues,
                ${enumValuesInOutId}::enumvalues              
            )`;
    

    result = jdbcClient->call(callQuery);

    if (result is sql:ProcedureCallResult) {
        io:println("\n");
        io:println(result);
        io:println("enum value"," - ",enumValuesInOutId.get(string));
        io:println("enum procedure successfully created");
        io:println("\n");
    } 
    else{
        io:println("\nError ocurred while creating the enum procedure\n");
        io:println(result);
        io:println("\n");
    }

    return result;      

}

function enumTearDown(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;


    string query = dropQuery(
        enumProcName,
        dropEnumProcParameters
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("enum Procedure is drop Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("enum Procedure is drop failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}







//......................................................................................................................................................



string pglsnProcName = "pglsntest";
map<string> pgValues = {
    "pg_lsnInValue": "pg_lsn","inout pg_lsnInOutValue":"pg_lsn"
};
string pglsnProcParameters = createParas( pgValues);
string dropPglsnProcParameters = createDrops( pgValues);

function createPglsnProcedures(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;

    string query = createQuery(
        pglsnProcName,
        pglsnProcParameters,
        "select pg_lsnInValue into pg_lsnInOutValue;"
        
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("pglsn Procedure is initialization Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("pglsn Procedure is initialization failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}

function pglsnProcedureCall(jdbc:Client jdbcClient,
    string pg_lsnInput,        string pg_lsnInOut
    )  returns sql:ProcedureCallResult|sql:Error {

// ${inSmallInput} 


    sql:ProcedureCallResult|sql:Error result;

    sql:InOutParameter pg_lsnInOutId = new (pg_lsnInOut);
    
    sql:ParameterizedCallQuery callQuery =
            `call pglsntest(
                ${pg_lsnInput}::pg_lsn,
                ${pg_lsnInOutId}              
            )`;
    

    result = jdbcClient->call(callQuery);

    if (result is sql:ProcedureCallResult) {
        io:println("\n");
        io:println(result);
        io:println("pglsn value"," - ",pg_lsnInOutId.get(string));
        io:println("pglsn procedure successfully created");
        io:println("\n");
    } 
    else{
        io:println("\nError ocurred while creating the pglsn procedure\n");
        io:println(result);
        io:println("\n");
    }

    return result;      

}

function pglsnTearDown(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;


    string query = dropQuery(
        pglsnProcName,
        dropPglsnProcParameters
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("pglsn Procedure is drop Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("pglsn Procedure is drop failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}






//......................................................................................................................................................

string objectidentifierProcName = "objectidentifiertest";
map<string> oiValues = {
    "oidInValue": "oid","inout oidInOutValue":"oid"
};
string objectidentifierProcParameters = createParas( oiValues);
string dropObjectidentifierProcParameters = createDrops( oiValues);

function createObjectidentifierProcedures(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;

    string query = createQuery(
        objectidentifierProcName,
        objectidentifierProcParameters,
        "select oidInValue into oidInOutValue;"
        
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("objectidentifier Procedure is initialization Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("objectidentifier Procedure is initialization failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}

function objectidentifierProcedureCall(jdbc:Client jdbcClient,
    string oidInput,        string oidInOut
    )  returns sql:ProcedureCallResult|sql:Error {

// ${inSmallInput} 


    sql:ProcedureCallResult|sql:Error result;

    sql:InOutParameter oidInOutId = new (oidInOut);
    
    sql:ParameterizedCallQuery callQuery =
            `call objectidentifiertest(
                ${oidInput}::oid,
                ${oidInOutId}              
            )`;
    

    result = jdbcClient->call(callQuery);

    if (result is sql:ProcedureCallResult) {
        io:println("\n");
        io:println(result);
        io:println("objectidentifier value"," - ",oidInOutId.get(string));
        io:println("objectidentifier procedure successfully created");
        io:println("\n");
    } 
    else{
        io:println("\nError ocurred while creating the objectidentifier procedure\n");
        io:println(result);
        io:println("\n");
    }

    return result;      

}

function objectidentifierTearDown(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;


    string query = dropQuery(
        objectidentifierProcName,
        dropObjectidentifierProcParameters
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("objectidentifier Procedure is drop Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("objectidentifier Procedure is drop failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}






//......................................................................................................................................................
string domainProcName = "domaintest";
map<string> domValues = {
    "intInValue": "posint","inout intInOutValue":"posint"
};
string domainProcParameters = createParas( domValues);
string dropDomainProcParameters = createDrops( domValues);

function createDomainProcedures(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;

    string query = createQuery(
        domainProcName,
        domainProcParameters,
        "select intInValue into intInOutValue;"
        
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("domain Procedure is initialization Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("domain Procedure is initialization failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}

function domainProcedureCall(jdbc:Client jdbcClient,
    sql:IntegerValue intInput,        sql:IntegerValue intInOut
    )  returns sql:ProcedureCallResult|sql:Error {

// ${inSmallInput} 


    sql:ProcedureCallResult|sql:Error result;

    sql:InOutParameter intInOutId = new (intInOut);
    
    sql:ParameterizedCallQuery callQuery =
            `call domaintest(
                ${intInput},
                ${intInOutId}              
            )`;
    

    result = jdbcClient->call(callQuery);

    if (result is sql:ProcedureCallResult) {
        io:println("\n");
        io:println(result);
        io:println("domain value"," - ",intInOutId.get(string));
        io:println("domain procedure successfully created");
        io:println("\n");
    } 
    else{
        io:println("\nError ocurred while creating the domain procedure\n");
        io:println(result);
        io:println("\n");
    }

    return result;      

}

function domainTearDown(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;


    string query = dropQuery(
        domainProcName,
        dropDomainProcParameters
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("domain Procedure is drop Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("domain Procedure is drop failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}






//......................................................................................................................................................

string rangeProcName = "rangetest";
map<string> rangValues = {
    "int4rangeInValue": "int4range","inout int4rangeInOutValue":"int4range"
};
string rangeProcParameters = createParas( rangValues);
string dropRangeProcParameters = createDrops( rangValues);

function createRangeProcedures(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;

    string query = createQuery(
        rangeProcName,
        rangeProcParameters,
        "select int4rangeInValue into int4rangeInOutValue;"
        
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("range Procedure is initialization Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("range Procedure is initialization failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}

function rangeProcedureCall(jdbc:Client jdbcClient,
    string int4rangeInput,        string int4rangeInOut
    )  returns sql:ProcedureCallResult|sql:Error {

// ${inSmallInput} 


    sql:ProcedureCallResult|sql:Error result;

    sql:InOutParameter int4rangeInOutId = new (int4rangeInOut);
    
    sql:ParameterizedCallQuery callQuery =
            `call rangetest(
                ${int4rangeInput}::int4range,
                ${int4rangeInOutId}              
            )`;
    

    result = jdbcClient->call(callQuery);

    if (result is sql:ProcedureCallResult) {
        io:println("\n");
        io:println(result);
        io:println("range value"," - ",int4rangeInOutId.get(string));
        io:println("range procedure successfully created");
        io:println("\n");
    } 
    else{
        io:println("\nError ocurred while creating the range procedure\n");
        io:println(result);
        io:println("\n");
    }

    return result;      

}

function rangeTearDown(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;


    string query = dropQuery(
        rangeProcName,
        dropRangeProcParameters
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("range Procedure is drop Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("range Procedure is drop failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}










//.....................................................................................................................................................
string arrayProcName = "arraytest";
map<string> arrayValues = {
    "arrayInValue": "double precision[]","inout arrayInOutValue":"double precision[]"
};
string arrayProcParameters = createParas( arrayValues);
string dropArrayProcParameters = createDrops( arrayValues);

function createArrayProcedures(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;

    string query = createQuery(
        arrayProcName,
        arrayProcParameters,
        "select arrayInValue into arrayInOutValue;"
        
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("array Procedure is initialization Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("array Procedure is initialization failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}

public type arrayGet record {
    
};

function arrayProcedureCall(jdbc:Client jdbcClient,
    sql:ArrayValue arrayInput,        sql:ArrayValue arrayInOut
    )  returns sql:ProcedureCallResult|sql:Error {

// ${inSmallInput} 


    sql:ProcedureCallResult|sql:Error result;

    sql:InOutParameter arrayInOutId = new (arrayInOut);
    
    sql:ParameterizedCallQuery callQuery =
            `call arraytest(
                ${arrayInput},
                ${arrayInOutId}              
            )`;
    

    result = jdbcClient->call(callQuery);

    if (result is sql:ProcedureCallResult) {
        io:println("\n");
        io:println(result);
        // io:println("array value"," - ",arrayInOutId.get(arrayGet));
        io:println("array value"," - ",arrayInOutId);
        io:println("array procedure successfully created");
        io:println("\n");
    } 
    else{
        io:println("\nError ocurred while creating the array procedure\n");
        io:println(result);
        io:println("\n");
    }

    return result;      

}

function arrayTearDown(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;


    string query = dropQuery(
        arrayProcName,
        dropArrayProcParameters
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("array Procedure is drop Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("array Procedure is drop failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}







//......................................................................................................................................................


string jsonProcName = "jsontest";
map<string> jsonValues = {
    "jsonInValue": "json","inout jsonInOutValue":"json"
    ,"jsonbInValue": "jsonb","inout jsonbInOutValue":"jsonb"
    ,"jsonpathInValue": "jsonpath","inout jsonpathInOutValue":"jsonpath"
};
string jsonProcParameters = createParas( jsonValues);
string dropJsonProcParameters = createDrops( jsonValues);

function createJsonProcedures(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;

    string query = createQuery(
        jsonProcName,
        jsonProcParameters,
        "select jsonInValue into jsonInOutValue;"
        +"select jsonbInValue into jsonbInOutValue;"
        +"select jsonpathInValue into jsonpathInOutValue;"
        
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("json Procedure is initialization Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("json Procedure is initialization failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}

function jsonProcedureCall(jdbc:Client jdbcClient,
    string jsonInput,        string jsonInOut
    ,string jsonbInput,        string jsonbInOut
    ,string jsonpathInput,        string jsonpathInOut
    )  returns sql:ProcedureCallResult|sql:Error {

// ${inSmallInput} 


    sql:ProcedureCallResult|sql:Error result;

    sql:InOutParameter jsonInOutId = new (jsonInOut);
    sql:InOutParameter jsonbInOutId = new (jsonbInOut);
    sql:InOutParameter jsonpathInOutId = new (jsonpathInOut);
    
    sql:ParameterizedCallQuery callQuery =
            `call jsontest(
                ${jsonInput}
                ,${jsonInOutId}
                ,${jsonbInput}
                ,${jsonbInOutId}
                ,${jsonpathInput}
                ,${jsonpathInOutId}                
            )`;
    

    result = jdbcClient->call(callQuery);

    if (result is sql:ProcedureCallResult) {
        io:println("\n");
        io:println(result);
        // io:println("json(n) value"," - ",jsonInOutId.get(string));
        io:println("jsonb value"," - ",jsonbInOutId.get(string));
        io:println("json value"," - ",jsonpathInOutId.get(string));
        io:println("json procedure successfully created");
        io:println("\n");
    } 
    else{
        io:println("\nError ocurred while creating the json procedure\n");
        io:println(result);
        io:println("\n");
    }

    return result;      

}

function jsonTearDown(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;


    string query = dropQuery(
        jsonProcName,
        dropJsonProcParameters
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("json Procedure is drop Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("json Procedure is drop failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}







//......................................................................................................................................................





string xmlProcName = "xmltest";
map<string> xmlValues = {
    "xmlInValue": "xml","inout xmlInOutValue":"xml"
};
string xmlProcParameters = createParas( xmlValues);
string dropXmlProcParameters = createDrops( xmlValues);

function createXmlProcedures(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;

    string query = createQuery(
        xmlProcName,
        xmlProcParameters,
        "select xmlInValue into xmlInOutValue;"
        
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("xml Procedure is initialization Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("xml Procedure is initialization failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}

function xmlProcedureCall(jdbc:Client jdbcClient,
    xml xmlInput,        xml xmlInOut
    )  returns sql:ProcedureCallResult|sql:Error {

// ${inSmallInput} 


    sql:ProcedureCallResult|sql:Error result;

    sql:InOutParameter xmlInOutId = new (xmlInOut);
    
    sql:ParameterizedCallQuery callQuery =
            `call xmltest(
                ${xmlInput},
                ${xmlInOutId}              
            )`;
    

    result = jdbcClient->call(callQuery);

    if (result is sql:ProcedureCallResult) {
        io:println("\n");
        io:println(result);
        // io:println("xml value"," - ",xmlInOutId.get(xml));
        io:println("xml procedure successfully created");
        io:println("\n");
    } 
    else{
        io:println("\nError ocurred while creating the xml procedure\n");
        io:println(result);
        io:println("\n");
    }

    return result;      

}

function xmlTearDown(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;


    string query = dropQuery(
        xmlProcName,
        dropXmlProcParameters
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("xml Procedure is drop Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("xml Procedure is drop failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}








//......................................................................................................................................................






string uuidProcName = "uuidtest";
map<string> uidValues = {
    "uuidInValue": "uuid","inout uuidInOutValue":"uuid"
};
string uuidProcParameters = createParas( uidValues);
string dropUuidProcParameters = createDrops( uidValues);

function createUuidProcedures(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;

    string query = createQuery(
        uuidProcName,
        uuidProcParameters,
        "select uuidInValue into uuidInOutValue;"
        
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("uuid Procedure is initialization Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("uuid Procedure is initialization failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}

function uuidProcedureCall(jdbc:Client jdbcClient,
    string uuidInput,        string uuidInOut
    )  returns sql:ProcedureCallResult|sql:Error {

// ${inSmallInput} 


    sql:ProcedureCallResult|sql:Error result;

    sql:InOutParameter uuidInOutId = new (uuidInOut);
    
    sql:ParameterizedCallQuery callQuery =
            `call uuidtest(
                ${uuidInput}::uuid,
                ${uuidInOutId}              
            )`;
    

    result = jdbcClient->call(callQuery);

    if (result is sql:ProcedureCallResult) {
        io:println("\n");
        io:println(result);
        io:println("uuid value"," - ",uuidInOutId.get(string));
        io:println("uuid procedure successfully created");
        io:println("\n");
    } 
    else{
        io:println("\nError ocurred while creating the uuid procedure\n");
        io:println(result);
        io:println("\n");
    }

    return result;      

}

function uuidTearDown(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;


    string query = dropQuery(
        uuidProcName,
        dropUuidProcParameters
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("uuid Procedure is drop Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("uuid Procedure is drop failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}







//......................................................................................................................................................



string textsearchProcName = "textsearchtest";
map<string> tshValues = {
    "tsvInValue": "tsvector","inout tsvInOutValue":"tsvector"
    ,"tsqInValue": "tsquery","inout tsqInOutValue":"tsquery"
};
string textsearchProcParameters = createParas(tshValues);
string dropTextsearchProcParameters = createDrops(tshValues);

function createTextsearchProcedures(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;

    string query = createQuery(
        textsearchProcName,
        textsearchProcParameters,
        "select tsvInValue into tsvInOutValue;"
        +"select tsqInValue into tsqInOutValue;"
        
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("textsearch Procedure is initialization Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("textsearch Procedure is initialization failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}

function textsearchProcedureCall(jdbc:Client jdbcClient,
    string tsvInput,        string tsvInOut
    ,string tsqInput,        string tsqInOut
    )  returns sql:ProcedureCallResult|sql:Error {

// ${inSmallInput} 


    sql:ProcedureCallResult|sql:Error result;

    sql:InOutParameter tsvInOutId = new (tsvInOut);
    sql:InOutParameter tsqInOutId = new (tsqInOut);
    
    sql:ParameterizedCallQuery callQuery =
            `call textsearchtest(
                ${tsvInput},
                ${tsvInOutId},
                ${tsqInput},
                ${tsqInOutId}              
            )`;
    

    result = jdbcClient->call(callQuery);

    if (result is sql:ProcedureCallResult) {
        io:println("\n");
        io:println(result);
        io:println("textsearch value"," - ",tsvInOutId.get(string));
        io:println("textsearch value"," - ",tsqInOutId.get(string));
        io:println("textsearch procedure successfully created");
        io:println("\n");
    } 
    else{
        io:println("\nError ocurred while creating the textsearch procedure\n");
        io:println(result);
        io:println("\n");
    }

    return result;      

}

function textsearchTearDown(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;


    string query = dropQuery(
        textsearchProcName,
        dropTextsearchProcParameters
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("textsearch Procedure is drop Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("textsearch Procedure is drop failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}








//......................................................................................................................................................


string bitProcName = "bittest";
map<string> bitValues = {
    "bitInValue": "bit(10)","inout bitInOutValue":"bit(10)"
    ,"varbitInValue": "BIT VARYING(10)","inout varbitInOutValue":"BIT VARYING(10)"
    ,"bitOnlyInValue": "bit","inout bitOnlyInOutValue":"bit"
};
string bitProcParameters = createParas( bitValues);
string dropBitProcParameters = createDrops( bitValues);

function createBitProcedures(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;

    string query = createQuery(
        bitProcName,
        bitProcParameters,
        "select bitInValue into bitInOutValue;"
        +"select varbitInValue into varbitInOutValue;"
        +"select bitOnlyInValue into bitOnlyInOutValue;"
        
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("bit Procedure is initialization Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("bit Procedure is initialization failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}

function bitProcedureCall(jdbc:Client jdbcClient,
    sql:BitValue bitInput,        sql:BitValue bitInOut
    ,sql:BitValue varbitInput,        sql:BitValue varbitInOut
    ,sql:BitValue bitOnlyInput,        sql:BitValue bitOnlyInOut
    )  returns sql:ProcedureCallResult|sql:Error {

// ${inSmallInput} 


    sql:ProcedureCallResult|sql:Error result;

    sql:InOutParameter bitInOutId = new (bitInOut);
    sql:InOutParameter varbitInOutId = new (varbitInOut);
    sql:InOutParameter bitOnlyInOutId = new (bitOnlyInOut);
    
    sql:ParameterizedCallQuery callQuery =
            `call bittest(
                ${bitInput}
                ,${bitInOutId}
                ,${varbitInput}
                ,${varbitInOutId}
                ,${bitOnlyInput}
                ,${bitOnlyInOutId}                
            )`;
    

    result = jdbcClient->call(callQuery);

    if (result is sql:ProcedureCallResult) {
        io:println("\n");
        io:println(result);
        // io:println("bit(n) value"," - ",bitInOutId.get(string));
        io:println("varbit value"," - ",varbitInOutId.get(string));
        io:println("bit value"," - ",bitOnlyInOutId.get(string));
        io:println("bit procedure successfully created");
        io:println("\n");
    } 
    else{
        io:println("\nError ocurred while creating the bit procedure\n");
        io:println(result);
        io:println("\n");
    }

    return result;      

}

function bitTearDown(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;


    string query = dropQuery(
        bitProcName,
        dropBitProcParameters
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("bit Procedure is drop Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("bit Procedure is drop failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}







//......................................................................................................................................................


string networkProcName = "networktest";
map<string> netValues = {
    "inetInValue": "inet","inout inetInOutValue":"inet"
};
string networkProcParameters = createParas( netValues);
string dropNetworkProcParameters = createDrops( netValues);

function createNetworkProcedures(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;

    string query = createQuery(
        networkProcName,
        networkProcParameters,
        "select inetInValue into inetInOutValue;"
        
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("network Procedure is initialization Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("network Procedure is initialization failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}

function networkProcedureCall(jdbc:Client jdbcClient,
    string inetInput,        string inetInOut
    )  returns sql:ProcedureCallResult|sql:Error {

// ${inSmallInput} 


    sql:ProcedureCallResult|sql:Error result;

    sql:InOutParameter inetInOutId = new (inetInOut);
    
    sql:ParameterizedCallQuery callQuery =
            `call networktest(
                ${inetInput}::inet,
                ${inetInOutId}              
            )`;
    

    result = jdbcClient->call(callQuery);

    if (result is sql:ProcedureCallResult) {
        io:println("\n");
        io:println(result);
        io:println("network value"," - ",inetInOutId.get(string));
        io:println("network procedure successfully created");
        io:println("\n");
    } 
    else{
        io:println("\nError ocurred while creating the network procedure\n");
        io:println(result);
        io:println("\n");
    }

    return result;      

}

function networkTearDown(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;


    string query = dropQuery(
        networkProcName,
        dropNetworkProcParameters
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("network Procedure is drop Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("network Procedure is drop failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}




//......................................................................................................................................................


string geometricProcName = "geometrictest";
map<string> geoValues = {
    "pointInValue": "point","inout pointInOutValue":"point"
};
string geometricProcParameters = createParas(geoValues);
string dropGeometricProcParameters = createDrops(geoValues);

function createGeometricProcedures(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;

    string query = createQuery(
        geometricProcName,
        geometricProcParameters,
        "select pointInValue into pointInOutValue;"
        
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("Geometric Procedure is initialization Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("Geometric Procedure is initialization failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}

function geometricProcedureCall(jdbc:Client jdbcClient,
    string pointInput,        string pointInOut
    )  returns sql:ProcedureCallResult|sql:Error {

// ${inSmallInput} 


    sql:ProcedureCallResult|sql:Error result;

    sql:InOutParameter pointInOutId = new (pointInOut);
    
    sql:ParameterizedCallQuery callQuery =
            `call geometrictest(
                ${pointInput}::point,
                ${pointInOutId}              
            )`;
    

    result = jdbcClient->call(callQuery);

    if (result is sql:ProcedureCallResult) {
        io:println("\n");
        io:println(result);
        io:println("geometric value"," - ",pointInOutId.get(string));
        io:println("geometric procedure successfully created");
        io:println("\n");
    } 
    else{
        io:println("\nError ocurred while creating the geometric procedure\n");
        io:println(result);
        io:println("\n");
    }

    return result;      

}

function geometricTearDown(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;


    string query = dropQuery(
        geometricProcName,
        dropGeometricProcParameters
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("Geometric Procedure is drop Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("Geometric Procedure is drop failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}

//-----------------------------------------------------------------------------------------------------------------------------------------------






string booleanProcName = "booleantest";
map<string> boolValues = {
    "booleanInValue": "boolean","inout booleanInOutValue":"boolean"
};
string booleanProcParameters = createParas(boolValues);
string dropBooleanProcParameters = createDrops(boolValues);

function createBooleanProcedures(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;

    string query = createQuery(
        booleanProcName,
        booleanProcParameters,
        "select booleanInValue into booleanInOutValue;"
        
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("Boolean Procedure is initialization Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("Boolean Procedure is initialization failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}

function booleanProcedureCall(jdbc:Client jdbcClient,
    sql:BooleanValue booleanInput,        sql:BooleanValue booleanInOut
    )  returns sql:ProcedureCallResult|sql:Error {

// ${inSmallInput} 


    sql:ProcedureCallResult|sql:Error result;

    sql:InOutParameter booleanInOutId = new (booleanInOut);
    
    sql:ParameterizedCallQuery callQuery =
            `call booleantest(
                ${booleanInput},
                ${booleanInOutId}              
            )`;
    

    result = jdbcClient->call(callQuery);

    if (result is sql:ProcedureCallResult) {
        io:println("\n");
        io:println(result);
        io:println("boolean value"," - ",booleanInOutId.get(string));
        io:println("boolean value"," - ",booleanInOutId.get(int));
        io:println("boolean value"," - ",booleanInOutId.get(boolean));
        io:println("boolean procedure successfully created");
        io:println("\n");
    } 
    else{
        io:println("\nError ocurred while creating the Boolean procedure\n");
        io:println(result);
        io:println("\n");
    }

    return result;      

}

function booleanTearDown(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;


    string query = dropQuery(
        booleanProcName,
        dropBooleanProcParameters
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("Boolean Procedure is drop Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("Boolean Procedure is drop failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}







string datetimeProcName = "datetimetest";
map<string> dtValues = {
    "tsInValue": "timestamp","inout tsInOutValue":"timestamp"
    ,"tstzInValue": "timestamptz","inout tstzInOutValue":"timestamptz"
    ,"dInValue": "date","inout dInOutValue":"date"
    ,"tInValue": "time","inout tInOutValue":"time"
    ,"ttzInValue": "timetz","inout ttzInOutValue":"timetz"
    // ,"iInValue": "interval","inout iInOutValue":"interval"
};
string datetimeProcParameters = createParas(dtValues);
string dropDatetimeProcParameters = createDrops(dtValues);

function createDatetimeProcedures(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;

    string query = createQuery(
        datetimeProcName,
        datetimeProcParameters,
        "select tsInValue into tsInOutValue;"
        +"select tstzInValue into tstzInOutValue;"
        +"select dInValue into dInOutValue;"
        +"select tInValue into tInOutValue;"
        +"select ttzInValue into ttzInOutValue;"
        // +"select iInValue into iInOutValue;"
        
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("DateTime Procedure is initialization Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("DateTime Procedure is initialization failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}

public type timeR record {|
    int time;
    zoneR zone;
|};

public type zoneR record {|
    int id;
    string offset;
|};

function datetimeProcedureCall(jdbc:Client jdbcClient,
    sql:TimestampValue tsInput,        sql:TimestampValue tsInOut
    ,sql:TimestampValue tstzInput,     sql:TimestampValue tstzInOut
    ,sql:DateValue dInput,             sql:DateValue dInOut
    ,sql:TimeValue tInput,             sql:TimeValue tInOut
    ,sql:TimeValue ttzInput,             sql:TimeValue ttzInOut
    // ,int iIn,                       int iInOut
    )  returns sql:ProcedureCallResult|sql:Error {

//                 ${tsInput},
//                 ${tsInOutId},
//                 ${tstzInput},
//                 ${tstzInOutId},
//                 ${dInput},
//                 ${dInOutId},
//                 ${tInput},
//                 ${tInOutId}

    sql:ProcedureCallResult|sql:Error result;

    sql:InOutParameter tsInOutId = new (tsInOut);
    sql:InOutParameter tstzInOutId = new (tstzInOut);
    sql:InOutParameter dInOutId = new (dInOut);
    sql:InOutParameter tInOutId = new (tInOut);
    sql:InOutParameter ttzInOutId = new (ttzInOut);
    // sql:InOutParameter iInOutId = new (iInOut);
    
    sql:ParameterizedCallQuery callQuery =
            `call datetimetest(
                ${tsInput},
                ${tsInOutId},
                ${tstzInput},
                ${tstzInOutId},
                ${dInput},
                ${dInOutId},
                ${tInput},
                ${tInOutId},
                ${ttzInput},
                ${ttzInOutId}             
            )`;
    

    result = jdbcClient->call(callQuery);

    if (result is sql:ProcedureCallResult) {
        io:println("\n");
        io:println(result);
        io:println("TS value"," - ",tsInOutId.get(zoneR));
        io:println("TSTZ value"," - ",tstzInOutId.get(timeR));
        io:println("D value"," - ",dInOutId.get(timeR));
        io:println("T value"," - ",tInOutId.get(timeR));
        io:println("Tz value"," - ",ttzInOutId.get(timeR));
        io:println("Binary procedure successfully created");
        io:println("\n");
    } 
    else{
        io:println("\nError ocurred while creating the DateTime procedure\n");
        io:println(result);
        io:println("\n");
    }

    return result;      

}

function datetimeTearDown(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;


    string query = dropQuery(
        datetimeProcName,
        dropDatetimeProcParameters
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("DateTime Procedure is drop Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("Datetime Procedure is drop failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}








string binaryProcName = "binarytest";
map<string> binValues = {
    "binaryInValue": "bytea","inout binaryInOutValue":"bytea"
};
string binaryProcParameters = createParas(binValues);
string dropBinaryProcParameters = createDrops(binValues);

function createBinaryProcedures(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;

    string query = createQuery(
        binaryProcName,
        binaryProcParameters,
        "select binaryInValue into binaryInOutValue;"
        
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("Binary Procedure is initialization Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("Binary Procedure is initialization failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}

function binaryProcedureCall(jdbc:Client jdbcClient,
    sql:BinaryValue binaryInput,        sql:BinaryValue binaryInOut
    )  returns sql:ProcedureCallResult|sql:Error {

// ${inSmallInput} 


    sql:ProcedureCallResult|sql:Error result;

    sql:InOutParameter binaryInOutId = new (binaryInOut);
    
    sql:ParameterizedCallQuery callQuery =
            `call binarytest(
                ${binaryInput},
                ${binaryInOutId}              
            )`;
    

    result = jdbcClient->call(callQuery);

    if (result is sql:ProcedureCallResult) {
        io:println("\n");
        io:println(result);
        // io:println("Binary value"," - ",binaryInOutId.get(string));
        io:println("Binary procedure successfully created");
        io:println("\n");
    } 
    else{
        io:println("\nError ocurred while creating the Binary procedure\n");
        io:println(result);
        io:println("\n");
    }

    return result;      

}

function binaryTearDown(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;


    string query = dropQuery(
        binaryProcName,
        dropBinaryProcParameters
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("Binary Procedure is drop Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("Binary Procedure is drop failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}







string characterProcName = "charactertest";
map<string> charValues = {
    "charInValue": "char(10485760)","inout charInOutValue":"char(10485760)"
    ,"varcharInValue": "varchar(10485760)","inout varcharInOutValue":"varchar(10485760)"
    ,"textInValue": "text","inout textInOutValue":"text"
    ,"nameInValue": "name","inout nameInOutValue":"name"
};
string characterProcParameters = createParas(charValues);
string dropCharacterProcParameters = createDrops(charValues);

function createCharacterProcedures(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;

    string query = createQuery(
        characterProcName,
        characterProcParameters,
        "select charInValue into charInOutValue;"
        +"select varcharInValue into varcharInOutValue;"
        +"select textInValue into textInOutValue;"
        +"select nameInValue into nameInOutValue;"
        
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("Character Procedure is initialization Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("Character Procedure is initialization failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}

function characterProcedureCall(jdbc:Client jdbcClient,
     sql:CharValue charInput,        sql:CharValue charInOut
    ,string varcharInput,        string varcharInOut
    ,sql:TextValue textInput,        sql:TextValue textInOut
    ,string nameInput,        string nameInOut
    )  returns sql:ProcedureCallResult|sql:Error {

// ${charInput},
//                 ${charInOutId},
//                 ${varcharInput},
//                 ${varcharInOutId},
//                 ${textInput},
//                 ${textInOutId},
//                 ${nameInput},
//                 ${nameInOutId}   


    sql:ProcedureCallResult|sql:Error result;

    sql:InOutParameter charInOutId = new (charInOut);
    sql:InOutParameter varcharInOutId = new (varcharInOut);
    sql:InOutParameter textInOutId = new (textInOut);
    sql:InOutParameter nameInOutId = new (nameInOut);
    
    sql:ParameterizedCallQuery callQuery =
            `call charactertest(
                ${charInput},
                ${charInOutId},
                ${varcharInput},
                ${varcharInOutId},
                ${textInput},
                ${textInOutId},
                ${nameInput},
                ${nameInOutId}             
            )`;
    

    result = jdbcClient->call(callQuery);

    if (result is sql:ProcedureCallResult) {
        io:println("\n");
        io:println(result);
        io:println("Char value"," - ",charInOutId.get(string));
        io:println("Varchar value"," - ",varcharInOutId.get(string));
        io:println("Text value"," - ",textInOutId.get(string));
        io:println("Name value"," - ",nameInOutId.get(string));
        io:println("Character procedure successfully created");
        io:println("\n");
    } 
    else{
        io:println("\nError ocurred while creating the Character procedure\n");
        io:println(result);
        io:println("\n");
    }

    return result;      

}

function CharacterTearDown(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;


    string query = dropQuery(
        characterProcName,
        dropCharacterProcParameters
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("Character Procedure is drop Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("Character Procedure is drop failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}





string moneyProcName = "moneytest";
map<string> monValues = {
    "moneyInValue": "money","inout moneyInOutValue":"money"
};
string moneyProcParameters = createParas(monValues);
string dropMoneyProcParameters = createDrops(monValues);

function createMoneyProcedures(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;

    string query = createQuery(
        moneyProcName,
        moneyProcParameters,
        "select moneyInValue into moneyInOutValue;"
        
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("Money Procedure is initialization Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("Money Procedure is initialization failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}

function moneyProcedureCall(jdbc:Client jdbcClient,
    float moneyInput,        float moneyInOut
    )  returns sql:ProcedureCallResult|sql:Error {

// ${inSmallInput} 


    sql:ProcedureCallResult|sql:Error result;

    sql:InOutParameter moneyInOutId = new (moneyInOut);
    
    sql:ParameterizedCallQuery callQuery =
            `call moneytest(
                ${moneyInput},
                ${moneyInOutId}              
            )`;
    

    result = jdbcClient->call(callQuery);

    if (result is sql:ProcedureCallResult) {
        io:println("\n");
        io:println(result);
        io:println("Money value"," - ",moneyInOutId.get(string));
        io:println("Money procedure successfully created");
        io:println("\n");
    } 
    else{
        io:println("\nError ocurred while creating the Numeric procedure\n");
        io:println(result);
        io:println("\n");
    }

    return result;      

}

function moneyTearDown(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;


    string query = dropQuery(
        moneyProcName,
        dropMoneyProcParameters
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("Money Procedure is drop Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("Money Procedure is drop failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}







string numProcName = "numerictest";
map<string> values = {
    "smallIntInValue": "smallint","inout smallIntOutValue":"bigint",
    "IntInValue":"integer","inout intOutValue":"bigint",
    "bigIntInValue":"bigint","inout bigintOutValue":"bigint",
    "decimalVal":"decimal","inout decimalinOut":"decimal"
    ,"numericVal":"numeric","inout numericinOut":"numeric"
    ,"realVal":"real","inout realinOut":"real"
    ,"doublePrecisionVal":"double precision","inout doublePrecisioninOut":"double precision"
    // ,"sserialVal":"smallSerial","inout smallSerialInOut":"smallSerial"
};
function createNumericProcedures(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;


    string query = createQuery(
        numProcName,
        numProcParameters,
        "select smallIntInValue into smallIntOutValue;"
        +"select intInValue into intOutValue;"
        +"select bigIntInValue into bigintOutValue;"
        +"select decimalVal into decimalinOut; "
        +"select numericVal into numericinOut; "
        +"select realVal into realinOut; "
        +"select doublePrecisionVal into doublePrecisioninOut; "
        // +"select sserialVal into smallSerialInOut; "
        
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("NumericTest Procedure is initialization Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("NumericTest Procedure is initialization failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}


function numericProcedureCall(jdbc:Client jdbcClient,
    sql:SmallIntValue inSmallInput,        int outSmallInput,
    sql:IntegerValue Inputint,             int outInt,
    sql:BigIntValue Inputbigint,           sql:BigIntValue outbigInt,
    sql:DecimalValue inDecimal,            sql:DecimalValue inoutDecimal,
    sql:NumericValue inNumericVal,         sql:NumericValue inoutNumericVal,
    sql:RealValue inReal,                  sql:RealValue inoutReal,
    sql:DoubleValue inDoublePrecisionVal,  sql:DoubleValue inoutDoublePrecisionVal
    // ,sql:IntegerValue sserial,                  sql:IntegerValue serialInOut
    )  returns sql:ProcedureCallResult|sql:Error {

// ${inSmallInput},
// ${outSmallInputId},
// ${Inputint},
// ${outIntId},
// ${Inputbigint},
// ${outbigIntId},
// ${inDecimal},
// ${decId},
// ${inNumericVal},
// ${numeId},
// ${inReal},
// ${realId},
// ${inDoublePrecisionVal},
// ${dpId},
// ${sserial},
// ${serialInOut}  


    sql:ProcedureCallResult|sql:Error result;

    sql:InOutParameter outSmallInputId = new (outSmallInput);
    sql:InOutParameter outIntId = new (outInt);
    sql:InOutParameter outbigIntId = new (outbigInt);
    sql:InOutParameter decId = new (inoutDecimal);
    sql:InOutParameter numeId = new (inoutNumericVal);
    sql:InOutParameter realId = new (inoutReal);
    sql:InOutParameter dpId = new (inoutDoublePrecisionVal);
    // sql:InOutParameter ssId = new (serialInOut);

    sql:ParameterizedCallQuery callQuery =
            `call numerictest(
                ${inSmallInput},
                ${outSmallInputId},
                ${Inputint},
                ${outIntId},
                ${Inputbigint},
                ${outbigIntId},
                ${inDecimal},
                ${decId},
                ${inNumericVal},
                ${numeId},
                ${inReal},
                ${realId},
                ${inDoublePrecisionVal},
                ${dpId}                
            )`;
    

    result = jdbcClient->call(callQuery);

    if (result is sql:ProcedureCallResult) {
        io:println("\n");
        io:println(result);
        io:println("SmallInt"," - ",outSmallInputId.get(int));
        io:println("Int"," - ",outIntId.get(int));
        io:println("BigInt"," - ",outbigIntId.get(int));
        io:println("decimal"," - ",decId.get(decimal));
        io:println("numeric"," - ",numeId.get(decimal));
        io:println("real"," - ",realId.get(float));
        io:println("double"," - ",dpId.get(float));
        io:println("Numeric procedure successfully created");
        io:println("\n");
    } 
    else{
        io:println("\nError ocurred while creating the Numeric procedure\n");
        io:println(result);
        io:println("\n");
    }

    return result;      

}


// string numProcParameters = "smallIntInValue smallint, inout smallIntOutValue smallint";
string numProcParameters = createParas(values);
string dropProcParameters = createDrops(values);

function numericalTearDown(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;


    string query = dropQuery(
        numProcName,
        dropProcParameters
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("NumericTest Procedure is drop Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("NumericTest Procedure is drop failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}








string numProcName2 = "smallAndInttest";
map<string> values2 = {
    "smallIntInValue": "smallint","inout smallIntOutValue":"smallint"
    // "IntInValue":"integer","inout intOutValue":"integer"
};
function createNumericProcedures2(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;


    string query = createQuery(
        numProcName2,
        numProcParameters2,
        "select smallIntInValue into smallIntOutValue;"
        // "select intInValue into intOutValue;"
        
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("smallAndInttest Procedure is initialization Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("smallAndInttest Procedure is initialization failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}


function numericProcedureCall2(jdbc:Client jdbcClient,
    sql:SmallIntValue inSmallInput,        sql:SmallIntValue outSmallInput,
    sql:IntegerValue Inputint,             sql:IntegerValue outInt
    )  returns sql:ProcedureCallResult|sql:Error {

// ${inSmallInput},
// ${outSmallInputId},
// ${Inputint},
// ${outIntId}


    sql:ProcedureCallResult|sql:Error result;

    sql:InOutParameter outSmallInputId = new (outSmallInput);
    sql:InOutParameter outIntId = new (outInt);

    sql:ParameterizedCallQuery callQuery =
            `call smallAndInttest(
                ${inSmallInput},
                ${outSmallInputId}
            )`;
    

    result = jdbcClient->call(callQuery);

    if (result is sql:ProcedureCallResult) {
        io:println("\n");
        io:println(result);
        io:println("SmallInt"," - ",outSmallInputId.get(int));
        // io:println("Int"," - ",outIntId.get(int));
        io:println("Numeric procedure successfully created");
        io:println("\n");
    } 
    else{
        io:println("\nError ocurred while creating the Numeric procedure\n");
        io:println(result);
        io:println("\n");
    }

    return result;      

}


// string numProcParameters2 = "smallIntInValue smallint, inout smallIntOutValue smallint";
string numProcParameters2 = createParas(values2);
string dropProcParameters2 = createDrops(values2);

function numericalTearDown2(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;


    string query = dropQuery(
        numProcName2,
        dropProcParameters2
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("smallAndInttest Procedure is drop Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("smallAndInttest Procedure is drop failed");
        io:println(result);
        io:println("\n");
    }


    return result;  

}








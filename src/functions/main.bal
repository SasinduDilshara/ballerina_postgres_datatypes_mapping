
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









function dropQuery(string name, string parameters) returns string{

    string query = "DROP function "+
                     name
                     +" ("+
                     parameters+
                     ")";


    return query;

}


function createQuery(string name, string parameters,string logic) returns string{

    string query = "Create or replace function "+
                    name+" ( "+
                    parameters + " ) "+
                    "language plpgsql "+
                    "as $$ "+
                    "begin "+
                    logic +
                    " "+
                    "end; $$;";
    return query;

}


function createParas(map<string> args) returns string{

    string sent = "";

    foreach var [name,datatype] in args.entries() {
        sent += name + " " + datatype+",";
    }
    int valueLength = sent.length();
    sent = sent.substring(0,valueLength - 1);

    return sent;

}

function createDrops(map<string> args) returns string{

    string sent = "";
    int i =0;
    foreach var [name,datatype] in args.entries() {
        if(i%2 == 0){
        sent += datatype+",";
        }
        i+=1;
    }
    int valueLength = sent.length();
    sent = sent.substring(0,valueLength - 1);

    return sent;

}





public function main() {
    jdbc:Client|sql:Error jdbcClient =  new ("jdbc:postgresql://localhost:5432/functions","postgres","postgres");
           
    if (jdbcClient is jdbc:Client) {
        
        sql:Error|sql:ExecutionResult result = setUp(jdbcClient);
        // sql:ExecutionResult|sql:Error err = functionsCreations(jdbcClient);
        // _ = ReturnCheckFunction(jdbcClient);
         _ = functionCreation(jdbcClient);

         _ = functionCalls(jdbcClient);

         _ = functionTeardowns(jdbcClient);

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




sql:SmallIntValue lowerSmallInt = new(-3276);
// sql:SmallIntValue upperSmallInt = new(3276);

sql:BigIntValue bigInt1 = new(-3276);
sql:BigIntValue bigInt2 = new(3276);

// int lowerSmallInt =  -32768;
int upperSmallInt =  32767;

// int lowerInt =  -2147483648;
int upperInt =  2147483647;

// int bigInt1 = 2147483647;
// int bigInt2 = -2147483648;

sql:IntegerValue lowerInt = new(-2147483648);
// sql:IntegerValue upperInt = new(2147483647);

// decimal decVal1 = 123456789.123456789;
// decimal decVal2 = -123456789.123456789;

// decimal numVal1 = 123456789.123456789;
// decimal numVal2 = -123456789.123456789;

// float realVal1 = 282.34;
// float realVal2 = -282.349;

// float dpVal1 = 282.34;
// float dpVal2 = -282.349;

// int sser1 = 1;
// int sser2 = 32766;

// sql:IntegerValue sser1 = new(1);
// sql:IntegerValue sser2 = new(32766);

float moneyVal1 = 1767.12;
float moneyVal2 = 167.12;

sql:DecimalValue decVal1 = new(-123456789.123456789);
sql:DecimalValue decVal2 = new(123456789.123456789);

sql:NumericValue numVal1 = new(-123456789.123456789);
sql:NumericValue numVal2 = new(123456789.123456789);

sql:RealValue realVal1 = new(-282.34);
sql:RealValue realVal2 = new(282.349);

sql:DoubleValue dpVal1 = new(-282.34);
sql:DoubleValue dpVal2 = new(282.349);

sql:CharValue charVal1 = new("A");
sql:CharValue charVal2 = new("A");

// string charVal1 = "A";
// string charVal2 = "A";

sql:TextValue TextVal1 = new("A");
sql:TextValue TextVal2 = new("A");

// string TextVal1 = "A";
// string TextVal2 = "A";

// byte[] byteVal1 = [1,2,3,4,5,6];
// byte[] byteVal2 = [1,2,3,4,5,6];
byte[] byteVal3 = [1,2,3,4,5,6];
byte[] byteVal4 = [1,2,3,4,5,6];

sql:BinaryValue byteVal1 = new(byteVal3);
sql:BinaryValue byteVal2 = new(byteVal4);

sql:TimestampValue timeStampValue = new("1997-12-17 15:37:16.00");
sql:TimestampValue timeStamptzValue = new("1997-12-17 15:37:16.00");
sql:DateValue dateValue = new("1997-12-17");
sql:TimeValue timeValue = new("04:05:06");
// string inter = "4 years";
int inter = 4;
sql:BooleanValue booleanVaue = new(true);
string pointVal = "(1,2)";
string inetVal = "192.168.0.1/24";


// string bitn = "0000000001";
// string varbitn = "01110";
// string bit = "0";

sql:BitValue bitn = new(1);
sql:BitValue varbitn = new(1);
sql:BitValue bit = new(0);

string tv = "a fat cat sat on a mat and ate a fat rat";
string tq = "fat & rat";

string uid = "A0EEBC99-9C0B-4EF8-BB6D-6BB9BD380A11";

xml xmlVal = xml `<foo><tag>bar</tag><tag>tag</tag></foo>`;

// string xmlVal = "<foo><tag>bar</tag><tag>tag</tag></foo>";
string jsonVal = "{\"name\":\"Hello\"}";

// string arrVal = "{1,2,3,4}";

int[] arrIntVal = [1,2,3,4];
sql:ArrayValue arrVal = new(arrIntVal);

string rangVal = "(1,2)";

// int dom1 = 1;
sql:IntegerValue dom1 = new(1);
string oi1 = "564182";
string pg = "16/B374D848";
string enVal = "value1";

string cplx = "(1.1,2.32)";




public function functionCalls(jdbc:Client jdbcClient){


    _ = numericFunctionCall(jdbcClient,
    
    lowerSmallInt,lowerInt,"(1,2]",decVal1,numVal1,realVal1,dpVal1
    );

}

public function functionTeardowns(jdbc:Client jdbcClient){


    _ = numericalTearDown(jdbcClient);

}

public function functionCreation(jdbc:Client jdbcClient){

    // sql:ProcedureCallResult| sql:Error result;


    _ = createNumericFunctions(jdbcClient);



    // return result;



}


string numProcName = "numerictest";
map<string> values = {
    "smallIntInValue": "smallint","inout smallIntOutValue":"smallint"
    ,"IntInValue":"integer","out intOutValue":"int"
    ,"bigIntInValue":"int4range","out bigintOutValue":"int4range"
    ,"decimalVal":"decimal","out decimalinOut":"decimal"
    ,"numericVal":"numeric","out numericinOut":"numeric"
    ,"realVal":"real","out realinOut":"real"
    ,"doublePrecisionVal":"double precision","out doublePrecisioninOut":"double precision"
    // ,"serialVal":"serial","out smallSerialInOut":"serial"
};
function createNumericFunctions(jdbc:Client jdbcClient) {

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
        // +"select serialVal into smallSerialInOut; "
        
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("NumericTest Function is initialization Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("NumericTest Function is initialization failed");
        io:println(result);
        io:println("\n");
    }


    // return result;  

}

public type numericFuncRecord record{

    int smallIntOutValue;
    int intOutValue;
    string bigintOutValue;
    decimal decimalinOut;
    decimal numericinOut;
    float realinOut;
    float doublePrecisioninOut;   
    // int  smallSerialInOut;


};


function numericFunctionCall(jdbc:Client jdbcClient,
    sql:SmallIntValue inSmallInput,       
    sql:IntegerValue Inputint,             
    string Inputbigint,           
    sql:DecimalValue inDecimal,            
    sql:NumericValue inNumericVal,         
    sql:RealValue inReal,                  
    sql:DoubleValue inDoublePrecisionVal
    // ,sql:IntegerValue serial
    )   {

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

// ${inSmallInput},
// ${Inputint},
// ${Inputbigint},
// ${inDecimal},
// ${inNumericVal},
// ${inReal},
// ${inDoublePrecisionVal}

    sql:ProcedureCallResult|sql:Error result;

    // sql:InOutParameter smallInOut = new(inSmallInput);

    sql:SmallIntOutParameter outSmallInputId = new ;
    sql:IntegerOutParameter outIntId = new ;
    sql:BigIntOutParameter outbigIntId = new ;
    sql:DecimalOutParameter decId = new ;
    sql:NumericOutParameter numeId = new ;
    sql:RealOutParameter realId = new ;
    sql:DoubleOutParameter dpId = new ;
    // sql:InOutParameter ssId = new (serialInOut);

    sql:ParameterizedQuery callQuery =
            `select * from numerictest(
                ${inSmallInput},
                ${inSmallInput},
                ${Inputint},
                ${Inputbigint}::int4range,
                ${inDecimal},
                ${inNumericVal},
                ${inReal},
                ${inDoublePrecisionVal}
            )`;
    
    // result = jdbcClient->call(callQuery);
    io:println(callQuery);


    stream<record{}, error> | sql:Error resultStream =
            jdbcClient->query(callQuery,numericFuncRecord);

        
        io:println("resultStream",resultStream);
// 
        stream<numericFuncRecord, sql:Error> customerStream =
            <stream<numericFuncRecord, sql:Error>>resultStream;

        // io:println("resultStream",resultStream);
        
        error? e = customerStream.forEach(function(numericFuncRecord rec) {
            io:println("\n");
            io:println(rec.smallIntOutValue);
            io:println(rec.intOutValue);
            io:println(rec.bigintOutValue);
            io:println(rec.decimalinOut);
            io:println(rec.numericinOut);
            io:println(rec.realinOut);
            io:println(rec.doublePrecisioninOut);
            io:println("\n");
        });
        if (e is error) {
        io:println(e);
    }






    // if (result is sql:ProcedureCallResult) {
    //     io:println("\n");
    //     io:println("CALL RESULT ",result);
    //     io:println("SmallInt"," - ",outSmallInputId.get(int));
    //     io:println("Int"," - ",outIntId.get(int));
    //     io:println("BigInt"," - ",outbigIntId.get(int));
    //     io:println("decimal"," - ",decId.get(decimal));
    //     io:println("numeric"," - ",numeId.get(decimal));
    //     io:println("real"," - ",realId.get(float));
    //     io:println("double"," - ",dpId.get(float));
    //     io:println("Numeric function successfully created");
    //     io:println("\n");
    // } 
    // else{
    //     io:println("\nError ocurred while creating the Numeric function\n");
    //     io:println(result);
    //     io:println("\n");
    // }

    // return result;      

}


// string numProcParameters = "smallIntInValue smallint, out smallIntOutValue smallint";
string numProcParameters = createParas(values);
string dropProcParameters = createDrops(values);

function numericalTearDown(jdbc:Client jdbcClient) {

    sql:ExecutionResult|sql:Error result;


    string query = dropQuery(
        numProcName,
        dropProcParameters
    );
    io:println(query);
    result = jdbcClient->execute(query);

    if(result is sql:ExecutionResult){
        io:println("NumericTest Function is drop Success");
        io:println(result);
        io:println("\n");
    }
    else{
        io:println("NumericTest Function is drop failed");
        io:println(result);
        io:println("\n");
    }


    // return result;  

}







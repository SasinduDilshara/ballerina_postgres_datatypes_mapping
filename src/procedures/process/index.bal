

// import ballerina/io;
import ballerina/java.jdbc;
// import ballerina/auth;
import ballerina/sql;
// import ballerina/time;





function proceduresCreations(jdbc:Client jdbcClient)  returns sql:ExecutionResult|sql:Error {

    sql:ExecutionResult|sql:Error result;

    result = createNumericProcedures(jdbcClient);
    result = createMoneyProcedures(jdbcClient);
    result = createCharacterProcedures(jdbcClient);
    result = createBinaryProcedures(jdbcClient);
    result = createDatetimeProcedures(jdbcClient);

    result = createBooleanProcedures(jdbcClient);
    result = createGeometricProcedures(jdbcClient);
    result = createNetworkProcedures(jdbcClient);
    result = createBitProcedures(jdbcClient);
    result = createTextsearchProcedures(jdbcClient);

    result = createUuidProcedures(jdbcClient);
    result = createXmlProcedures(jdbcClient);
    result = createJsonProcedures(jdbcClient);
    result = createArrayProcedures(jdbcClient);
    result = createRangeProcedures(jdbcClient);

    result = createDomainProcedures(jdbcClient);
    result = createObjectidentifierProcedures(jdbcClient);
    result = createPglsnProcedures(jdbcClient);
    result = createEnumProcedures(jdbcClient);
    result = createComplexProcedures(jdbcClient);

    return result;       

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

function proceduresCalls(jdbc:Client jdbcClient)  returns sql:ProcedureCallResult|sql:Error {

    sql:ProcedureCallResult|sql:Error result;

    result = numericProcedureCall(
        jdbcClient,lowerSmallInt,upperSmallInt
        ,lowerInt,upperInt
        ,bigInt1,bigInt2
        ,decVal1,decVal2
        ,numVal1,numVal2
        ,realVal1,realVal2
        ,dpVal1,dpVal2
        // ,sser1,sser2
    );
    // result = moneyProcedureCall(jdbcClient,
    //     moneyVal1,moneyVal2
    // );
    // result = characterProcedureCall(jdbcClient,
    //     charVal1,charVal2
    //     ,"A","A"
    //     ,TextVal1,TextVal2
    //     ,"A","A"
    // );
    // io:println(byteVal1.value);

    // result = binaryProcedureCall(jdbcClient,
    //     byteVal1,byteVal2
    // );
    // result = datetimeProcedureCall(jdbcClient,
    //      timeStampValue,timeStampValue
    //     ,timeStamptzValue,timeStamptzValue
    //     ,dateValue,dateValue
    //     ,timeValue,timeValue
    //     // ,inter,inter
    // );
    // result = booleanProcedureCall(jdbcClient,
    //     booleanVaue,booleanVaue
    // );
    // result = geometricProcedureCall(jdbcClient,
    //     pointVal,pointVal
    // );
    // result = networkProcedureCall(jdbcClient,
    //     inetVal,inetVal
    // );
    // result = bitProcedureCall(jdbcClient,
    //     bitn,bitn
    //     ,varbitn,varbitn
    //     ,bit,bit
    // );
    // result = textsearchProcedureCall(jdbcClient,
    //     tv,tv
    //     ,tq,tq
    // );
    // result = uuidProcedureCall(jdbcClient,
    //     uid,uid
    // );
    // result = xmlProcedureCall(jdbcClient,
    //     xmlVal,xmlVal
    // );
    //   result = jsonProcedureCall(jdbcClient,
    //     jsonVal,jsonVal
    //     ,jsonVal,jsonVal
    //     ,jsonVal,jsonVal
    // );
    result = arrayProcedureCall(jdbcClient,
        arrVal,arrVal
    );

    // result = rangeProcedureCall(jdbcClient,
    //     rangVal,rangVal
    // );

    // result = domainProcedureCall(jdbcClient,
    //     dom1,dom1
    // );
    // result = objectidentifierProcedureCall(jdbcClient,
    //     oi1,oi1
    // );
    // result = pglsnProcedureCall(jdbcClient,
    //     pg,pg
    // );
    result = enumProcedureCall(jdbcClient,
        enVal,enVal
    );
    // result = complexProcedureCall(jdbcClient,
    //     cplx,cplx
    // );

    return result;   

}

//.....................................................................................................................................................






















function tearDown(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error{

    sql:ExecutionResult|sql:Error result;


    result = numericalTearDown(jdbcClient);
    result = moneyTearDown(jdbcClient);
    result = CharacterTearDown(jdbcClient);
    result = binaryTearDown(jdbcClient);
    result = datetimeTearDown(jdbcClient);

    result = booleanTearDown(jdbcClient);
    result = geometricTearDown(jdbcClient);
    result = networkTearDown(jdbcClient);
    result = bitTearDown(jdbcClient);
    result = textsearchTearDown(jdbcClient);

    result = uuidTearDown(jdbcClient);
    result = xmlTearDown(jdbcClient);
    result = jsonTearDown(jdbcClient);
    result = arrayTearDown(jdbcClient);
    result = rangeTearDown(jdbcClient);

    result = domainTearDown(jdbcClient);
    result = objectidentifierTearDown(jdbcClient);
    result = pglsnTearDown(jdbcClient);
    result = enumTearDown(jdbcClient);
    result = complexTearDown(jdbcClient);

    return result;

}


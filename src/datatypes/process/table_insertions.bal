

import ballerina/io;
import ballerina/java.jdbc;
// import ballerina/auth;
import ballerina/sql;
// import ballerina/time;


sql:SmallIntValue smallIntValue1 = new(32768);
sql:IntegerValue IntValue1 = new(2147483647);
sql:BigIntValue bigIntValue1 = new(2147483647);

sql:DecimalValue decimalValue1 = new(9223372036854775807922337203685477580792233720368547758079223372036854775807.92233720368547758079223372036854775807);
sql:NumericValue numericValue1 = new(9223372036854775807922337203685477580792233720368547758079223372036854775807.92233720368547758079223372036854775807);
sql:RealValue realValue1 = new(123.12345678);
sql:FloatValue floatValue1 = new(9223372036854775807922337203685477580792233720368547758079223372036854775807.92233720368547758079223372036854775807);
sql:DoubleValue doubleValue1 = new(123456789.123456);

// // ======================================================================================================================================================================================================================================================================
function numericTableInsertions(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error?{

    //Check NAN values and Infinity values

    sql:ExecutionResult|sql:Error? result;
    result = insertNumericTable(jdbcClient,
    
        -32767.2,-2147483647,-9223372036854775807.9,
        122.22,
        2.66,
        123456.123456,
        123456789.123456,
        1,1,1

    );
    result = insertNumericTable(jdbcClient,
    
        -32768,-2147483648,-9223372036854775808,
        -92233720368547758079223372036854775807.92233720368547758079223372036854775807,
        -19223372036854775807922337203685477580792233720368547758079223372036854775807.92233720368547758079223372036854775807,
        123456.123456,
        123456789.123456,
        1,1,1

    );


    result = insertNumericTable(jdbcClient,
        smallIntValue1,IntValue1,bigIntValue1,
        decimalValue1,
        numericValue1,
        realValue1,
        doubleValue1,
        32766.2,
        2147483646.9,
        9223372036854775806.9
    );
    return result;

}

function insertNumericTable(jdbc:Client jdbcClient , 
                            int|float|decimal|sql:SmallIntValue smallIntType, int|float|decimal|sql:IntegerValue intType, int|float|decimal|sql:BigIntValue bigInttypeypeType,
                            int|float|decimal|sql:DecimalValue decimalType, int|float|decimal|sql:NumericValue numericType,
                            int|float|decimal|sql:RealValue realType,int|float|decimal|sql:DoubleValue doublePrecisionType, 
                            int|float|decimal smallSerialType, int|float|decimal serialType,int|decimal bigSerialType) returns sql:ExecutionResult|sql:Error?{

   sql:ParameterizedQuery insertQuery =
            `INSERT INTO numericTypes (
                smallIntType, intType, bigIntType, decimalType, numericType, realType, doublePrecisionType, smallSerialType, serialType, bigSerialType
                ) 
             VALUES (
            ${smallIntType}, ${intType}, ${bigInttypeypeType}, ${decimalType}, ${numericType}, ${realType}, ${doublePrecisionType}, ${smallSerialType}, ${serialType}, ${bigSerialType}
            
            )`;
    

    sql:ExecutionResult|sql:Error result = jdbcClient->execute(insertQuery);

    if (result is sql:ExecutionResult) {
        io:println("\nInsert success, generated Id: ", result.lastInsertId);
    } 
    else{
        io:println("\nError ocurred while insert to numeric table\n");
        io:println(result);
        io:println("\n");
    }
    
    return result;
        

}


function moneyTableInsertions(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error?{

    sql:ExecutionResult|sql:Error? result;
    result = insertMoneyTable(jdbcClient,
    
    -92233720368547758.08

    );
    result = insertMoneyTable(jdbcClient,
    
        92233720368547758.07

    );
    return result;

}

function insertMoneyTable(jdbc:Client jdbcClient , decimal moneyType) returns sql:ExecutionResult|sql:Error?{
    // "MoneyType":"money"
   sql:ParameterizedQuery insertQuery =
            `INSERT INTO moneyTypes (
                moneyType              ) 
             VALUES (
                ${moneyType}
            )`;
    

    sql:ExecutionResult|sql:Error result = jdbcClient->execute(insertQuery);

    if (result is sql:ExecutionResult) {
        io:println("\nInsert success, generated Id: ", result.lastInsertId);
    } 
    else{
        io:println("\nError ocurred while insert to numeric table\n");
        io:println(result);
        io:println("\n");
    }
    
    return result;
        

}

sql:CharValue charValue = new("sql:CharValue charValue");
sql:VarcharValue varcharValue = new("sql:VarCharValue charValue");
sql:TextValue textValue = new("sql:TextValue charValue");
sql:TextValue nameValue = new("123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789123456789");
sql:CharValue charValue2 = new("1");

// xml `<v>Hello</v>`
function characterTableInsertions(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error?{

    sql:ExecutionResult|sql:Error? result;
    result = insertCharacterTable(jdbcClient,
    
    charValue,varcharValue,
    textValue,
    nameValue,
    charValue2

    );

    // result = insertCharacterTable(jdbcClient,
    
    //     "1","2","3","4","5"

    // );
    return result;

}

function insertCharacterTable(jdbc:Client jdbcClient , sql:CharValue charType, sql:VarcharValue varcharType, sql:TextValue textType, sql:TextValue nameType, sql:CharValue charWithoutLengthType) returns sql:ExecutionResult|sql:Error?{
    //         "charType":"char(10485760)",
    //         "varcharType":"varchar(10485760)",
    //         "textType":"text",
    //         "nameType":"name",
    //         "charWithoutLengthType": "char"
   sql:ParameterizedQuery insertQuery =
            `INSERT INTO charTypes (
                charType, varcharType, textType, nameType, charWithoutLengthType              ) 
             VALUES (
                ${charType}, ${varcharType}, ${textType}, ${nameType}, ${charWithoutLengthType}
            )`;
    

    sql:ExecutionResult|sql:Error result = jdbcClient->execute(insertQuery);

    if (result is sql:ExecutionResult) {
        io:println("\nInsert success, generated Id: ", result.lastInsertId);
    } 
    else{
        io:println("\nError ocurred while insert to numeric table\n");
        io:println(result);
        io:println("\n");
    }
    
    return result;
        

}



sql:BinaryValue binaryValue = new([5, 24, 56, 243, 24, 56, 243, 24, 56, 243, 24, 56, 243, 24, 56, 243, 24, 56, 243, 24, 56, 243, 24, 56, 243, 24, 56, 243]);

function binaryTableInsertions(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error?{

    sql:ExecutionResult|sql:Error? result;

    byte[] byteArray1 = [5, 24, 56, 243, 24, 56, 243, 24, 56, 243, 24, 56, 243, 24, 56, 243, 24, 56, 243, 24, 56, 243, 24, 56, 243, 24, 56, 243];

    byte[] byteArray2 = base16 `aeeecdefabcd12345567888822aeeecdefabcd12345567888822aeeecdefabcd12345567888822aeeecdefabcd12345567888822aeeecdefabcd12345567888822`;

    byte[] byteArray3 = base64 `aGVsbG8gYmFsbGVyaW5hICEhIQ==`;

    // result = insertBinaryTable(jdbcClient,
    
    // "\\xDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEF"

    // );
    // result = insertBinaryTable(jdbcClient,
    
    //     "abc \\153\\154\\155 \\052\\251\\124\\153\\154\\155 \\052\\251\\124\\153\\154\\155 \\052\\251\\124\\153\\154\\155 \\052\\251\\124\\153\\154\\155 \\052\\251\\124"

    // );
     result = insertBinaryTable(jdbcClient,
    
        binaryValue

    );
    result = insertBinaryTable(jdbcClient,
    
        byteArray1

    );
    result = insertBinaryTable(jdbcClient,
    
        byteArray2

    );
    result = insertBinaryTable(jdbcClient,
    
        byteArray3

    );
    // result = insertBinaryTable(jdbcClient,
    
    //     3

    // );
    return result;

}

function insertBinaryTable(jdbc:Client jdbcClient , sql:BinaryValue|string|byte[] byteaType) returns sql:ExecutionResult|sql:Error?{
    // "byteaType":"bytea" 
   sql:ParameterizedQuery insertQuery =
            `INSERT INTO binaryTypes (
                byteaType
                            ) 
             VALUES (
                ${byteaType}
            )`;
    

    sql:ExecutionResult|sql:Error result = jdbcClient->execute(insertQuery);

    if (result is sql:ExecutionResult) {
        io:println("\nInsert success, generated Id: ", result.lastInsertId);
    } 
    else{
        io:println("\nError ocurred while insert to numeric table\n");
        io:println(result);
        io:println("\n");
    }
    
    return result;
        

}
//{"ID":1,"timestampType":1098181434000,"dateType":915753600000,"timeType":14706789,"intervalType":"4 years"}

// {"ID":1,"timestampType":{"time":1098181434000,"zone":{"id":"UTC","offset":0}},
// "dateType":{"time":915753600000,"zone":{"id":"UTC","offset":0}},"timeType":{"time":14706789,"zone":{"id":"UTC","offset":0}},
// "intervalType":"4 years"}
function DateTimeTableInsertions(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error?{

    sql:ExecutionResult|sql:Error? result;
    // result = insertDateTimeTable(jdbcClient,
    
    // 1098181434000,915753600000,14706789,"4 Year"

    // );
    sql:TimestampValue timeStampValue = new("1997-12-17 15:37:16.00");
    sql:TimestampValue timeStamptzValue = new("2004-10-19 10:23:54");
    sql:DateValue dateValue = new("1997-12-17");
    sql:TimeValue timeValue = new("04:05:06");

    result = insertDateTimeTable(jdbcClient,
    
    timeStampValue,timeStamptzValue,dateValue,timeValue,"4 Year"

    );
    // result = insertDateTimeTable(jdbcClient,
    
    //     "2004-10-19 10:23:54+02","January 8, 1999","2003-04-12 04:05:06 America/New_York","4 Month"

    // );
    return result;

}

function insertDateTimeTable(jdbc:Client jdbcClient , sql:TimestampValue timestampType, sql:TimestampValue timestamptzType, sql:DateValue dateType, sql:TimeValue timeType, string|int intervalType) returns sql:ExecutionResult|sql:Error?{
    //         "timestampType":"timestamp",
    // "timestamptzType":"timestamptz",
    //         "dateType":"date",
    //         "timeType":"time",
    //         "intervalType":"interval"
   sql:ParameterizedQuery insertQuery =
            `INSERT INTO dateTimeTypes (
                timestampType, timestamptzType, dateType, timeType, intervalType
                             ) 
             VALUES (
                ${timestampType} 
                ,${timestamptzType}
                , ${dateType}
                , ${timeType}
                , ${intervalType} :: interval
            )`;
    

    sql:ExecutionResult|sql:Error result = jdbcClient->execute(insertQuery);

    if (result is sql:ExecutionResult) {
        io:println("\nInsert success, generated Id: ", result.lastInsertId);
    } 
    else{
        io:println("\nError ocurred while insert to numeric table\n");
        io:println(result);
        io:println("\n");
    }
    
    return result;
        

}

sql:BooleanValue booleanVaue = new(true);

function booleanTimeTableInsertions(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error?{

    sql:ExecutionResult|sql:Error? result;
    result = insertBooleanTimeTable(jdbcClient,
    
    booleanVaue

    );
    // result = insertBooleanTimeTable(jdbcClient,
    
    // "true"

    // );
    // result = insertBooleanTimeTable(jdbcClient,
    
    //     true

    // );
    // result = insertBooleanTimeTable(jdbcClient,
    
    //     "yes"

    // );
    // result = insertBooleanTimeTable(jdbcClient,
    
    //     "on"

    // );
    // result = insertBooleanTimeTable(jdbcClient,
    
    //     "1"

    // );
    // result = insertBooleanTimeTable(jdbcClient,
    
    //     0

    // );
    return result;

}

function insertBooleanTimeTable(jdbc:Client jdbcClient ,boolean|string|sql:BooleanValue booleanType) returns sql:ExecutionResult|sql:Error?{
    //         "booleanType":"boolean"
   sql:ParameterizedQuery insertQuery =
            `INSERT INTO booleantypes (
                booleanType
                             ) 
             VALUES (
                ${booleanType}
            )`;
    

    sql:ExecutionResult|sql:Error result = jdbcClient->execute(insertQuery);

    if (result is sql:ExecutionResult) {
        io:println("\nInsert success, generated Id: ", result.lastInsertId);
    } 
    else{
        io:println("\nError ocurred while insert to numeric table\n");
        io:println(result);
        io:println("\n");
    }
    
    return result;
        

}


function enumTableInsertions(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error?{

    sql:ExecutionResult|sql:Error? result;
    result = insertEnumTable(jdbcClient,
    
    "value1"

    );
    result = insertEnumTable(jdbcClient,
    
        "value2"

    );
    return result;

}

function insertEnumTable(jdbc:Client jdbcClient ,string enumType) returns sql:ExecutionResult|sql:Error?{
// "enumType":"enumValues"
   sql:ParameterizedQuery insertQuery =
            `INSERT INTO enumTypes (
                enumType
                             ) 
             VALUES (
                ${enumType}::enumvalues
            )`;
    

    sql:ExecutionResult|sql:Error result = jdbcClient->execute(insertQuery);

    if (result is sql:ExecutionResult) {
        io:println("\nInsert success, generated Id: ", result.lastInsertId);
    } 
    else{
        io:println("\nError ocurred while insert to numeric table\n");
        io:println(result);
        io:println("\n");
    }
    
    return result;
        

}

function geometricTableInsertions(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error?{

    sql:ExecutionResult|sql:Error? result;
    result = insertGeometricTable(jdbcClient,
    
    "(1,2)", "{1,2,3}","[(1,2),(3,4)]","((1,2),(3,4))","((1,2),(3,4))","((1,2),(3,4))","((1,2),3)"

    );
    result = insertGeometricTable(jdbcClient,
    
    "(1,2)", "{1,2,3}","[(1,2),(3,4)]","((1,2),(3,4))","((1,2),(3,4))","((1,2),(3,4))","((1,2),3)"

    );
    
    return result;

}

function insertGeometricTable(jdbc:Client jdbcClient ,string pointType, string lineType, string lsegType, string boxType, string pathType, string polygonType, string circleType) returns sql:ExecutionResult|sql:Error?{
// "pointType":"point",
//             "lineType":"line",
//             "lsegType":"lseg",
//             "boxType":"box",
//             "pathType":"path",
//             "polygonType":"polygon",
//             "circleType":"circle"
   sql:ParameterizedQuery insertQuery =
            `INSERT INTO geometrictypes (
                pointType, lineType, lsegType, boxType, pathType, polygonType, circleType
                             ) 
             VALUES (
                ${pointType}::point, ${lineType}::line, ${lsegType}::lseg, ${boxType}::box, ${pathType}::path, ${polygonType}::polygon, ${circleType}::circle
            )`;
    

    sql:ExecutionResult|sql:Error result = jdbcClient->execute(insertQuery);

    if (result is sql:ExecutionResult) {
        io:println("\nInsert success, generated Id: ", result.lastInsertId);
    } 
    else{
        io:println("\nError ocurred while insert to numeric table\n");
        io:println(result);
        io:println("\n");
    }
    
    return result;
        

}

function networkTableInsertions(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error?{

    sql:ExecutionResult|sql:Error? result;
    result = insertNetworkTable(jdbcClient,
    
    "192.168.0.1/24","::ffff:1.2.3.0/120","08:00:2b:01:02:03","08-00-2b-01-02-03-04-05"

    );
    result = insertNetworkTable(jdbcClient,
    
        "192.168.0.1/24","::ffff:1.2.3.0/120","08:00:2b:01:02:03","08-00-2b-01-02-03-04-05"

    );
    return result;

}

function insertNetworkTable(jdbc:Client jdbcClient ,string inetType, string cidrType, string macaddrType, string macaddr8Type) returns sql:ExecutionResult|sql:Error?{
// "inetType":"inet",
//             "cidrType":"cidr",
//             "macaddrType":"macaddr",
//             "macaddr8Type":"macaddr8"
   sql:ParameterizedQuery insertQuery =
            `INSERT INTO networkTypes (
                inetType, cidrType, macaddrType, macaddr8Type
                             ) 
             VALUES (
                ${inetType}::inet, ${cidrType}::cidr, ${macaddrType}::macaddr, ${macaddr8Type}::macaddr8
            )`;
    

    sql:ExecutionResult|sql:Error result = jdbcClient->execute(insertQuery);

    if (result is sql:ExecutionResult) {
        io:println("\nInsert success, generated Id: ", result.lastInsertId);
    } 
    else{
        io:println("\nError ocurred while insert to numeric table\n");
        io:println(result);
        io:println("\n");
    }
    
    return result;
        

}
function BitTableInsertions(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error?{

    sql:ExecutionResult|sql:Error? result;

    sql:BitValue bit1Value = new(1);

    result = insertBitTable(jdbcClient,
    
    "111","11100","B100","B10"

    );
    // result = insertBitTable(jdbcClient,
    
    //     "001","B101","B101","B101"

    // );
    return result;

}

function insertBitTable(jdbc:Client jdbcClient ,string bitType, string bitVaryType, string bitVaryType2, string bitOnlyType) returns sql:ExecutionResult|sql:Error?{
// "bitType":"bit(3)",
//             "bitVaryType":"BIT VARYING(5)",
//             "bitVaryType2":"BIT VARYING(7)",
//             "bitOnlyType":"bit"
   sql:ParameterizedQuery insertQuery =
            `INSERT INTO bitTypes (
                bitType, bitVaryType, bitVaryType2, bitOnlyType
                             ) 
             VALUES (
                ${bitType}::bit(3), ${bitVaryType}::BIT VARYING(5), ${bitVaryType2}::BIT VARYING(7), ${bitOnlyType} :: bit
            )`;
    

    sql:ExecutionResult|sql:Error result = jdbcClient->execute(insertQuery);

    if (result is sql:ExecutionResult) {
        io:println("\nInsert success, generated Id: ", result.lastInsertId);
    } 
    else{
        io:println("\nError ocurred while insert to numeric table\n");
        io:println(result);
        io:println("\n");
    }
    
    return result;
        

}


function textSearchTableInsertions(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error?{

    sql:ExecutionResult|sql:Error? result;
    result = insertTextSearchTable(jdbcClient,
    
    "a fat cat sat on a mat and ate a fat rat","fat & rat"

    );
    result = insertTextSearchTable(jdbcClient,
    
        "a fat cat sat on a mat and ate a fat rat","fat & rat"

    );
    return result;

}

function insertTextSearchTable(jdbc:Client jdbcClient ,string tsvectorType, string tsqueryType) returns sql:ExecutionResult|sql:Error?{

// "tsvectorType":"tsvector",
//             "tsqueryType":"tsquery"
   sql:ParameterizedQuery insertQuery =
            `INSERT INTO textSearchTypes (
                tsvectorType, tsqueryType
                             ) 
             VALUES (
                ${tsvectorType}::tsvector, ${tsqueryType}::tsquery
            )`;
    

    sql:ExecutionResult|sql:Error result = jdbcClient->execute(insertQuery);

    if (result is sql:ExecutionResult) {
        io:println("\nInsert success, generated Id: ", result.lastInsertId);
    } 
    else{
        io:println("\nError ocurred while insert to numeric table\n");
        io:println(result);
        io:println("\n");
    }
    
    return result;
        

}

function UUIDTableInsertions(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error?{

    sql:ExecutionResult|sql:Error? result;
    result = insertUUIDTable(jdbcClient,
    
    "A0EEBC99-9C0B-4EF8-BB6D-6BB9BD380A11"

    );
    result = insertUUIDTable(jdbcClient,
    
        "{a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11}"

    );
    result = insertUUIDTable(jdbcClient,
    
    "a0eebc999c0b4ef8bb6d6bb9bd380a11"

    );
    result = insertUUIDTable(jdbcClient,
    
        "a0ee-bc99-9c0b-4ef8-bb6d-6bb9-bd38-0a11"

    );
    result = insertUUIDTable(jdbcClient,
    
        "{a0eebc99-9c0b4ef8-bb6d6bb9-bd380a11}"

    );
    result = insertUUIDTable(jdbcClient,
    
        "a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11"

    );
    return result;

}

function insertUUIDTable(jdbc:Client jdbcClient ,string uuidType) returns sql:ExecutionResult|sql:Error?{

// "uuidType":"uuid"
   sql:ParameterizedQuery insertQuery =
            `INSERT INTO uuidTypes (
                uuidType
                             ) 
             VALUES (
                ${uuidType}::uuid
            )`;
    

    sql:ExecutionResult|sql:Error result = jdbcClient->execute(insertQuery);

    if (result is sql:ExecutionResult) {
        io:println("\nInsert success, generated Id: ", result.lastInsertId);
    } 
    else{
        io:println("\nError ocurred while insert to numeric table\n");
        io:println(result);
        io:println("\n");
    }
    
    return result;
        

}

function xmlTableInsertions(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error?{

    sql:ExecutionResult|sql:Error? result;
    
    // result = insertXmlTable(jdbcClient,
    
    //     "<foo>bar</foo>"

    // );
    // result = insertXmlTable(jdbcClient,
    
    //     "bar"

    // );
    result = insertXmlTable(jdbcClient,
    
     xml `<foo><tag>bar</tag><tag>tag</tag></foo>`

    );
    return result;

}

function insertXmlTable(jdbc:Client jdbcClient ,string|xml xmlType) returns sql:ExecutionResult|sql:Error?{

// "xmlType":"xml"
   sql:ParameterizedQuery insertQuery =
            `INSERT INTO xmlTypes (
                xmlType
                             ) 
             VALUES (
                ${xmlType}
            )`;
    

    sql:ExecutionResult|sql:Error result = jdbcClient->execute(insertQuery);

    if (result is sql:ExecutionResult) {
        io:println("\nInsert success, generated Id: ", result.lastInsertId);
    } 
    else{
        io:println("\nError ocurred while insert to numeric table\n");
        io:println(result);
        io:println("\n");
    }
    
    return result;
        

}

function JsonTableInsertions(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error?{

    sql:ExecutionResult|sql:Error? result;
    result = insertJsonTable(jdbcClient,
    
     "{\"bar\": \"baz\", \"balance\": 7.77, \"active\":false}", "{\"bar\": \"baz\", \"balance\": 7.77, \"active\":false}","$.floor[*].apt[*] ? (@.area > 40 && @.area < 90) ? (@.rooms > 2)"

    );
    result = insertJsonTable(jdbcClient,
    
      "{\"bar\": \"baz\", \"balance\": 7.77, \"active\":false}", "{\"bar\": \"baz\", \"balance\": 7.77, \"active\":false}","$.floor[*].apt[*] ? (@.area > 40 && @.area < 90) ? (@.rooms > 2)"  

    );
    return result;

}

function insertJsonTable(jdbc:Client jdbcClient ,string jsonType, string jsonbType, string jsonPathType) returns sql:ExecutionResult|sql:Error?{

// "ID": "SERIAL", 
//             "jsonType":"json",
//             "jsonbType":"jsonb",
//             "jsonpathType":"jsonpath"
   sql:ParameterizedQuery insertQuery =
            `INSERT INTO jsonTypes (
                jsonType, jsonbType, jsonPathType
                             ) 
             VALUES (
                ${jsonType}:: json, ${jsonbType}:: jsonb, ${jsonPathType}:: jsonpath 
            )`;
    

    sql:ExecutionResult|sql:Error result = jdbcClient->execute(insertQuery);

    if (result is sql:ExecutionResult) {
        io:println("\nInsert success, generated Id: ", result.lastInsertId);
    } 
    else{
        io:println("\nError ocurred while insert to numeric table\n");
        io:println(result);
        io:println("\n");
    }
    
    return result;
        

}
function arrayTableInsertions(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error?{

    sql:ExecutionResult|sql:Error? result;
    // result = insertArrayTable(jdbcClient,
    

    //         "{{\"A\"},{\"B\"}}","{\"A\",\"B\",\"\"}", "{1,2,3,4,5}","{{1,2},{3,4}}", "{1,2,3,4}","{1,2,3,4,5,6,7}"
    // );
    // result = insertArrayTable(jdbcClient,
    

    //         "{{\"A\"},{\"B\"}}","{\"A\",\"B\",\"\"}", "{1,2,3,4,5}","{{1,2},{3,4}}", "{1,2,3,4}","{1,2,3,4,5,6,7}"
    // );
    int[] intArray1d;
    intArray1d = [1,2,3];
    sql:ArrayValue intArray1dValue= new (intArray1d); 

    // int[][] intArray2d;
    // intArray2d = [[1,2,3],[1]];
    // sql:ArrayValue intArray2dValue= new (intArray2d); 

    string[] stringArray1d;
    stringArray1d = ["1","2","3"];
    sql:ArrayValue stringArray1dValue= new (stringArray1d); 

    result = insertArrayTable(jdbcClient,
    
            
            "{{\"A\"},{\"B\"}}",
            stringArray1dValue, 
            intArray1dValue,
            "{{1,2},{3,4}}", 
            intArray1dValue,
            intArray1dValue
    );
    return result;

}

function insertArrayTable(jdbc:Client jdbcClient ,string textArrayType ,sql:ArrayValue textArray2Type , sql:ArrayValue integerArrayType, string integerArray2Type, sql:ArrayValue arrayType, sql:ArrayValue array2Type) returns sql:ExecutionResult|sql:Error?{

            // "textArrayType":"text[][]",
            // "textArray2Type":"text[]",
            // "integerArrayType":"int[]",
            // "integerArray2Type":"int[][]",
            // "arrayType":"int array[5]",
            // "array2Type":"int array"
   sql:ParameterizedQuery insertQuery =
            `INSERT INTO arrayTypes (
                textArrayType,textArray2Type, integerArrayType,integerArray2Type, arrayType, array2Type
                             ) 
             VALUES (
                ${textArrayType}::text[][],
                ${textArray2Type}, 
                ${integerArrayType},
                ${integerArray2Type}::int[][], 
                ${arrayType}, 
                ${array2Type}
            )`;
    

    sql:ExecutionResult|sql:Error result = jdbcClient->execute(insertQuery);

    if (result is sql:ExecutionResult) {
        io:println("\nInsert success, generated Id: ", result.lastInsertId);
    } 
    else{
        io:println("\nError ocurred while insert to numeric table\n");
        io:println(result);
        io:println("\n");
    }
    
    return result;
        

}

function ComplexTableInsertions(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error?{

    sql:ExecutionResult|sql:Error? result;
    result = insertComplexTable(jdbcClient,
    

        "(1.1,2.2)","(\"Name\",2,456.32)"
    );
    result = insertComplexTable(jdbcClient,
    

        "(1.1,2.2)","(\"Name\",2,456.32)"
    );
    return result;

}

function insertComplexTable(jdbc:Client jdbcClient ,string complexType, string inventoryType) returns sql:ExecutionResult|sql:Error?{

            // "complexType":"complex",
            // "inventoryType":"inventory_item"
   sql:ParameterizedQuery insertQuery =
            `INSERT INTO complexTypes (
                complexType, inventoryType
                             ) 
             VALUES (
                ${complexType}::complex, ${inventoryType}::inventory_item
            )`;
    

    sql:ExecutionResult|sql:Error result = jdbcClient->execute(insertQuery);

    if (result is sql:ExecutionResult) {
        io:println("\nInsert success, generated Id: ", result.lastInsertId);
    } 
    else{
        io:println("\nError ocurred while insert to numeric table\n");
        io:println(result);
        io:println("\n");
    }
    
    return result;
        

}

function RangeTableInsertions(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error?{

    sql:ExecutionResult|sql:Error? result;
    result = insertRangeTable(jdbcClient,
    

        "(2,50)","(10,100)","(0,24)","(2010-01-01 14:30, 2010-01-01 15:30)","(2010-01-01 14:30, 2010-01-01 15:30)","(2010-01-01 14:30, 2010-01-03 )","(1,4)"
    );
    result = insertRangeTable(jdbcClient,
    

        "(1,3)","(10,100)","(0,24)","(2010-01-01 14:30, 2010-01-01 15:30)","(2010-01-01 14:30, 2010-01-01 15:30)","(2010-01-01 14:30, 2010-01-01 )","(2,12)"
    );
    return result;

}

function insertRangeTable(jdbc:Client jdbcClient ,string int4rangeType, string int8rangeType, string numrangeType,string tsrangeType,string tstzrangeType,string daterangeType, string floatrangeType) returns sql:ExecutionResult|sql:Error?{

            // "int4rangeType":"int4range",
            // "int8rangeType":"int8range",
            // "numrangeType":"numrange",
            // "tsrangeType":"tsrange",
            // "tstzrangeType":"tstzrange",
            // "daterangeType":"daterange",
            // "floatrangeType":"floatrange"
   sql:ParameterizedQuery insertQuery =
            `INSERT INTO rangeTypes (
                int4rangeType, int8rangeType, numrangeType, tsrangeType, tstzrangeType, daterangeType, floatrangeType
                             ) 
             VALUES (
                ${int4rangeType}::int4range, ${int8rangeType}::int8range, ${numrangeType}::numrange, ${tsrangeType}::tsrange, ${tstzrangeType}::tstzrange, ${daterangeType}::daterange, ${floatrangeType}::floatrange

            )`;
    

    sql:ExecutionResult|sql:Error result = jdbcClient->execute(insertQuery);

    if (result is sql:ExecutionResult) {
        io:println("\nInsert success, generated Id: ", result.lastInsertId);
    } 
    else{
        io:println("\nError ocurred while insert to numeric table\n");
        io:println(result);
        io:println("\n");
    }
    
    return result;
        

}


function domainTableInsertions(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error?{

    sql:ExecutionResult|sql:Error? result;
    result = insertDomainTable(jdbcClient,
    
        1

    );
    // result = insertDomainTable(jdbcClient,
    
    //     "1"

    // );
    return result;

}

function insertDomainTable(jdbc:Client jdbcClient ,string|int posintType) returns sql:ExecutionResult|sql:Error?{

            // "posintType":"posint"
   sql:ParameterizedQuery insertQuery =
            `INSERT INTO domainTypes (
                posintType
                             ) 
             VALUES (
                ${posintType}
            )`;
    

    sql:ExecutionResult|sql:Error result = jdbcClient->execute(insertQuery);

    if (result is sql:ExecutionResult) {
        io:println("\nInsert success, generated Id: ", result.lastInsertId);
    } 
    else{
        io:println("\nError ocurred while insert to numeric table\n");
        io:println(result);
        io:println("\n");
    }
    
    return result;
        

}



function objectIdentifierTableInsertions(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error?{

    sql:ExecutionResult|sql:Error? result;
    result = insertObjectIdentifierTable(jdbcClient,
    
        "564182","pg_type","english","simple","pg_catalog","!","*(int,int)","NOW","sum(int4)","postgres","int"

    );
    // result = insertObjectIdentifierTable(jdbcClient,
    
    //     "564182","pg_type","english","simple","pg_catalog","*","*(integer,​integer) or -(NONE,​integer)","sum","sum(int4)","smithee","integer"

    // );
    return result;

}

function insertObjectIdentifierTable(jdbc:Client jdbcClient ,string oidType, string regclassType, string regconfigType, string regdictionaryType, string regnamespaceType, string regoperType, string regoperatorType, string regprocType, string regprocedureType, string regroleType, string regtypeType ) returns sql:ExecutionResult|sql:Error?{

    //         "oidType" : "oid",
    //         "regclassType" : "regclass",
    //         "regconfigType" : "regconfig",Are we going to have the meeting tonight
    //         "regdictionaryType" : "regdictionary",
    //         "regnamespaceType" : "regnamespace",
    //         "regoperType" : "regoper",
    //         "regoperatorType" : "regoperator",
    //         "regprocType" : "regproc",
    //         "regprocedureType" : "regprocedure",
    //         "regroleType" : "regrole",
    //         "regtypeType" : "regtype"
   sql:ParameterizedQuery insertQuery =
            `INSERT INTO objectIdentifierTypes (
                oidType, regclassType, regconfigType, regdictionaryType, regnamespaceType, regoperType, regoperatorType, regprocType, regprocedureType, regroleType, regtypeType
                             ) 
             VALUES (
                ${oidType} ::oid,
                 ${regclassType} ::regclass, ${regconfigType} ::regconfig, ${regdictionaryType} ::regdictionary, ${regnamespaceType} ::regnamespace, ${regoperType} ::regoper, ${regoperatorType} ::regoperator, ${regprocType} ::regproc, ${regprocedureType} ::regprocedure, ${regroleType} ::regrole, ${regtypeType} ::regtype
            )`;
    

    sql:ExecutionResult|sql:Error result = jdbcClient->execute(insertQuery);

    if (result is sql:ExecutionResult) {
        io:println("\nInsert success, generated Id: ", result.lastInsertId);
    } 
    else{
        io:println("\nError ocurred while insert to numeric table\n");
        io:println(result);
        io:println("\n");
    }
    
    return result;
        

}



function pslgnTableInsertions(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error?{

    sql:ExecutionResult|sql:Error? result;
    result = insertPslgnTable(jdbcClient,
    
        "16/B374D848"

    );
    result = insertPslgnTable(jdbcClient,
    
        "16/B374D848"

    );
    return result;

}

function insertPslgnTable(jdbc:Client jdbcClient ,string pglsnType) returns sql:ExecutionResult|sql:Error?{

            // "pglsnType" : "pg_lsn"
   sql:ParameterizedQuery insertQuery =
            `INSERT INTO pglsnTypes (
                pglsnType
                             ) 
             VALUES (
                ${pglsnType}::pg_lsn
            )`;
    

    sql:ExecutionResult|sql:Error result = jdbcClient->execute(insertQuery);

    if (result is sql:ExecutionResult) {
        io:println("\nInsert success, generated Id: ", result.lastInsertId);
    } 
    else{
        io:println("\nError ocurred while insert to numeric table\n");
        io:println(result);
        io:println("\n");
    }
    
    return result;
        

}



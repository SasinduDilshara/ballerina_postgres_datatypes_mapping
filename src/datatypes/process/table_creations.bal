
import ballerina/io;
import ballerina/java.jdbc;
// import ballerina/auth;
import ballerina/sql;
// import ballerina/time;



function createNumericTable(jdbc:Client jdbcClient) returns int|string|sql:Error?{

    string tableName = "numericTypes";

        CreateQueries createTableQuery = createQueryMaker({

            "ID": "SERIAL", "smallIntType":"smallInt","intType": "integer", "bigIntType": "bigint", "decimalType": "decimal","numericType": "numeric",
            "realType":"real", "doublePrecisionType":"double precision","smallSerialType":"smallserial", "serialType":"serial", "bigSerialType":"bigserial"

        },"ID");

        int|string|sql:Error? initResult = initializeTable(jdbcClient, tableName , createTableQuery.createQuery);
        if (initResult is int) {
            io:println("Sample executed successfully!");
        } 
        else if (initResult is sql:Error) {
            io:println("Customer table initialization failed: ", initResult);
    }

    return initResult;

}


function createMoneyTable(jdbc:Client jdbcClient) returns int|string|sql:Error?{

    string tableName = "moneyTypes";

        CreateQueries createTableQuery = createQueryMaker({

            "ID": "SERIAL", 
            "MoneyType":"money"
        },"ID");

        int|string|sql:Error? initResult = initializeTable(jdbcClient, tableName , createTableQuery.createQuery);
        if (initResult is int) {
            io:println("Sample executed successfully!");
        } 
        else if (initResult is sql:Error) {
            io:println("Customer table initialization failed: ", initResult);
    }

    return initResult;

}

function createCharacterTable(jdbc:Client jdbcClient) returns int|string|sql:Error?{

    string tableName = "charTypes";

        CreateQueries createTableQuery = createQueryMaker({

            "ID": "SERIAL", 
            "charType":"char(200)",
            "varcharType":"varchar(10485760)",
            "textType":"text",
            "nameType":"name",
            "charWithoutLengthType": "char"
        },"ID");

        int|string|sql:Error? initResult = initializeTable(jdbcClient, tableName , createTableQuery.createQuery);
        if (initResult is int) {
            io:println("Sample executed successfully!");
        } 
        else if (initResult is sql:Error) {
            io:println("Customer table initialization failed: ", initResult);
    }

    return initResult;

}

function createBinaryTable(jdbc:Client jdbcClient) returns int|string|sql:Error?{

    string tableName = "binaryTypes";

        CreateQueries createTableQuery = createQueryMaker({

            "ID": "SERIAL", 
            "byteaType":"bytea"    //Two types need to test. bytea hexa type and bytea escape type.
        },"ID");

        int|string|sql:Error? initResult = initializeTable(jdbcClient, tableName , createTableQuery.createQuery);
        if (initResult is int) {
            io:println("Sample executed successfully!");
        } 
        else if (initResult is sql:Error) {
            io:println("Customer table initialization failed: ", initResult);
    }

    return initResult;

}

function createDateTimeTable(jdbc:Client jdbcClient) returns int|string|sql:Error?{

    string tableName = "dateTimeTypes";

        CreateQueries createTableQuery = createQueryMaker({
            //Need to test with timezone and without time zone. And also several ways in interval type need to test.
            "ID": "SERIAL", 
            "timestampType":"timestamp",
            "timestamptzType":"timestamptz",
            "dateType":"date",
            "timeType":"time",
            "timeWithTimeZoneType":"timetz",
            "intervalType":"interval"
        },"ID");

        int|string|sql:Error? initResult = initializeTable(jdbcClient, tableName , createTableQuery.createQuery);
        if (initResult is int) {
            io:println("Sample executed successfully!");
        } 
        else if (initResult is sql:Error) {
            io:println("Customer table initialization failed: ", initResult);
    }

    return initResult;

}

function createBooleanTable(jdbc:Client jdbcClient) returns int|string|sql:Error?{

    string tableName = "booleanTypes";

        CreateQueries createTableQuery = createQueryMaker({
            "ID": "SERIAL", 
            "booleanType":"boolean"
        },"ID");

        int|string|sql:Error? initResult = initializeTable(jdbcClient, tableName , createTableQuery.createQuery);
        if (initResult is int) {
            io:println("Sample executed successfully!");
        } 
        else if (initResult is sql:Error) {
            io:println("Customer table initialization failed: ", initResult);
    }

    return initResult;

}

function createEnumTable(jdbc:Client jdbcClient) returns int|string|sql:Error?{

   string tableName = "enumTypes";

        CreateQueries createTableQuery = createQueryMaker({
            "ID": "SERIAL", 
            "enumType":"enumValues"
        },"ID");

        int|string|sql:Error? initResult = initializeTable(jdbcClient, tableName , createTableQuery.createQuery);
        if (initResult is int) {
            io:println("Sample executed successfully!");
        } 
        else if (initResult is sql:Error) {
            io:println("Customer table initialization failed: ", initResult);
    }

    return initResult;

}

function createGeometricTable(jdbc:Client jdbcClient) returns int|string|sql:Error?{

   string tableName = "geometricTypes";

        CreateQueries createTableQuery = createQueryMaker({
            "ID": "SERIAL", 
            "pointType":"point",
            "lineType":"line",
            "lsegType":"lseg",
            "boxType":"box",
            "pathType":"path",
            "polygonType":"polygon",
            "circleType":"circle"
        },"ID");

        int|string|sql:Error? initResult = initializeTable(jdbcClient, tableName , createTableQuery.createQuery);
        if (initResult is int) {
            io:println("Sample executed successfully!");
        } 
        else if (initResult is sql:Error) {
            io:println("Customer table initialization failed: ", initResult);
    }

    return initResult;

}


function createNetworkTable(jdbc:Client jdbcClient) returns int|string|sql:Error?{

   string tableName = "networkTypes";

        CreateQueries createTableQuery = createQueryMaker({
            "ID": "SERIAL", 
            "inetType":"inet",
            "cidrType":"cidr",
            "macaddrType":"macaddr",
            "macaddr8Type":"macaddr8"
        },"ID");

        int|string|sql:Error? initResult = initializeTable(jdbcClient, tableName , createTableQuery.createQuery);
        if (initResult is int) {
            io:println("Sample executed successfully!");
        } 
        else if (initResult is sql:Error) {
            io:println("Customer table initialization failed: ", initResult);
    }

    return initResult;

}

function createBitTable(jdbc:Client jdbcClient) returns int|string|sql:Error?{

   string tableName = "bitTypes";

        CreateQueries createTableQuery = createQueryMaker({
            "ID": "SERIAL", 
            "bitType":"bit(3)",
            "bitVaryType":"BIT VARYING(5)",
            "bitVaryType2":"BIT VARYING(7)",
            "bitOnlyType":"bit"
        },"ID");

        int|string|sql:Error? initResult = initializeTable(jdbcClient, tableName , createTableQuery.createQuery);
        if (initResult is int) {
            io:println("Sample executed successfully!");
        } 
        else if (initResult is sql:Error) {
            io:println("Customer table initialization failed: ", initResult);
    }

    return initResult;

}


function createTextSearchTable(jdbc:Client jdbcClient) returns int|string|sql:Error?{

   string tableName = "textSearchTypes";

        CreateQueries createTableQuery = createQueryMaker({
            "ID": "SERIAL", 
            "tsvectorType":"tsvector",
            "tsqueryType":"tsquery"
        },"ID");

        int|string|sql:Error? initResult = initializeTable(jdbcClient, tableName , createTableQuery.createQuery);
        if (initResult is int) {
            io:println("Sample executed successfully!");
        } 
        else if (initResult is sql:Error) {
            io:println("Customer table initialization failed: ", initResult);
    }

    return initResult;

}

function createUuidTable(jdbc:Client jdbcClient) returns int|string|sql:Error?{

   string tableName = "uuidTypes";

        CreateQueries createTableQuery = createQueryMaker({
            "ID": "SERIAL", 
            "uuidType":"uuid"
        },"ID");

        int|string|sql:Error? initResult = initializeTable(jdbcClient, tableName , createTableQuery.createQuery);
        if (initResult is int) {
            io:println("Sample executed successfully!");
        } 
        else if (initResult is sql:Error) {
            io:println("Customer table initialization failed: ", initResult);
    }

    return initResult;

}

function createXmlTable(jdbc:Client jdbcClient) returns int|string|sql:Error?{

   string tableName = "xmlTypes";

        CreateQueries createTableQuery = createQueryMaker({
            "ID": "SERIAL", 
            "xmlType":"xml"
        },"ID");

        int|string|sql:Error? initResult = initializeTable(jdbcClient, tableName , createTableQuery.createQuery);
        if (initResult is int) {
            io:println("Sample executed successfully!");
        } 
        else if (initResult is sql:Error) {
            io:println("Customer table initialization failed: ", initResult);
    }

    return initResult;

}

function createJsonTable(jdbc:Client jdbcClient) returns int|string|sql:Error?{

   string tableName = "jsonTypes";

        CreateQueries createTableQuery = createQueryMaker({
            "ID": "SERIAL", 
            "jsonType":"json",
            "jsonbType":"jsonb",
            "jsonpathType":"jsonpath"
        },"ID");

        int|string|sql:Error? initResult = initializeTable(jdbcClient, tableName , createTableQuery.createQuery);
        if (initResult is int) {
            io:println("Sample executed successfully!");
        } 
        else if (initResult is sql:Error) {
            io:println("Customer table initialization failed: ", initResult);
    }

    return initResult;

}

function createArrayTable(jdbc:Client jdbcClient) returns int|string|sql:Error?{

   string tableName = "arrayTypes";

        CreateQueries createTableQuery = createQueryMaker({
            "ID": "SERIAL", 
            "textArrayType":"text[][]",
            "textArray2Type":"text[]",
            "integerArrayType":"int[]",
            "integerArray2Type":"int[][]",
            "arrayType":"int array[5]",
            "array2Type":"int array",
            "booleanArrayType":"boolean[]",
            "byteaArrayType":"int[]",
            "floatArrayType":"double precision[]"
        },"ID");

        int|string|sql:Error? initResult = initializeTable(jdbcClient, tableName , createTableQuery.createQuery);
        if (initResult is int) {
            io:println("Sample executed successfully!");
        } 
        else if (initResult is sql:Error) {
            io:println("Customer table initialization failed: ", initResult);
    }

    return initResult;

}

function createCompositeTable(jdbc:Client jdbcClient) returns int|string|sql:Error?{

   string tableName = "complexTypes";

        CreateQueries createTableQuery = createQueryMaker({
            "ID": "SERIAL", 
            "complexType":"complex",
            "inventoryType":"inventory_item"
        },"ID");

        int|string|sql:Error? initResult = initializeTable(jdbcClient, tableName , createTableQuery.createQuery);
        if (initResult is int) {
            io:println("Sample executed successfully!");
        } 
        else if (initResult is sql:Error) {
            io:println("Customer table initialization failed: ", initResult);
    }

    return initResult;

}


function createRangeTable(jdbc:Client jdbcClient) returns int|string|sql:Error?{

   string tableName = "rangeTypes";

        CreateQueries createTableQuery = createQueryMaker({
            "ID": "SERIAL", 
            "int4rangeType":"int4range",
            "int8rangeType":"int8range",
            "numrangeType":"numrange",
            "tsrangeType":"tsrange",
            "tstzrangeType":"tstzrange",
            "daterangeType":"daterange",
            "floatrangeType":"floatrange"
        },"ID");

        int|string|sql:Error? initResult = initializeTable(jdbcClient, tableName , createTableQuery.createQuery);
        if (initResult is int) {
            io:println("Sample executed successfully!");
        } 
        else if (initResult is sql:Error) {
            io:println("Customer table initialization failed: ", initResult);
    }

    return initResult;

}

function createDomainTable(jdbc:Client jdbcClient) returns int|string|sql:Error?{

   string tableName = "domainTypes";

        CreateQueries createTableQuery = createQueryMaker({
            "ID": "SERIAL", 
            "posintType":"posint"
        },"ID");

        int|string|sql:Error? initResult = initializeTable(jdbcClient, tableName , createTableQuery.createQuery);
        if (initResult is int) {
            io:println("Sample executed successfully!");
        } 
        else if (initResult is sql:Error) {
            io:println("Customer table initialization failed: ", initResult);
    }

    return initResult;

}

function createObjectIdentifierTable(jdbc:Client jdbcClient) returns int|string|sql:Error?{

   string tableName = "objectIdentifierTypes";

        CreateQueries createTableQuery = createQueryMaker({
            "ID": "SERIAL", 
            "oidType" : "oid",
            "regclassType" : "regclass",
            // "regcollationType" : "regcollation",
            "regconfigType" : "regconfig",
            "regdictionaryType" : "regdictionary",
            "regnamespaceType" : "regnamespace",
            "regoperType" : "regoper",
            "regoperatorType" : "regoperator",
            "regprocType" : "regproc",
            "regprocedureType" : "regprocedure",
            "regroleType" : "regrole",
            "regtypeType" : "regtype"
        },"ID");

        int|string|sql:Error? initResult = initializeTable(jdbcClient, tableName , createTableQuery.createQuery);
        if (initResult is int) {
            io:println("Sample executed successfully!");
        } 
        else if (initResult is sql:Error) {
            io:println("Customer table initialization failed: ", initResult);
    }

    return initResult;

}

function createPglsnTable(jdbc:Client jdbcClient) returns int|string|sql:Error?{

   string tableName = "pglsnTypes";

        CreateQueries createTableQuery = createQueryMaker({
            "ID": "SERIAL", 
            "pglsnType" : "pg_lsn"
        },"ID");

        int|string|sql:Error? initResult = initializeTable(jdbcClient, tableName , createTableQuery.createQuery);
        if (initResult is int) {
            io:println("Sample executed successfully!");
        } 
        else if (initResult is sql:Error) {
            io:println("Customer table initialization failed: ", initResult);
    }

    return initResult;

}

// function createPseudoTypeTable(jdbc:Client jdbcClient) returns int|string|sql:Error?{

//    string tableName = "pseudoTypes";

//         CreateQueries createTableQuery = createQueryMaker({
//             "ID": "SERIAL", 
//             "anyType" : "any",
//             "anyelementType" : "anyelement",
//             "anyarrayType" : "anyarray",
//             "anynonarrayType" : "anynonarray",
//             "anyenumType" : "anyenum",
//             "anyrangeType" : "anyrange",
//             "anycompatibleType" : "anycompatible",
//             "anycompatiblearrayType" : "anycompatiblearray",
//             "anycompatiblenonarrayType" : "anycompatiblenonarray",
//             "anycompatiblerangeType" : "anycompatiblerange",
//             "cstringType" : "cstring",
//             "internalType" : "internal",
//             "language_handlerType" : "language_handler",
//             "fdw_handlerType" : "fdw_handler",
//             "table_am_handlerType" : "table_am_handler",
//             "index_am_handlerType" : "index_am_handler",
//             "tsm_handlerType" : "tsm_handler",
//             "recordType" : "record",
//             "triggerType" : "trigger",
//             "event_triggerType" : "event_trigger",
//             "pg_ddl_commandType" : "pg_ddl_command",
//             "voidType" : "void",
//             "unknownType" : "unknown"
//         },"ID");

//         int|string|sql:Error? initResult = initializeTable(jdbcClient, tableName , createTableQuery.createQuery);
//         if (initResult is int) {
//             io:println("Sample executed successfully!");
//         } 
//         else if (initResult is sql:Error) {
//             io:println("Customer table initialization failed: ", initResult);
//     }

//     return initResult;

// }

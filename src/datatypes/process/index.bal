
// import ballerina/io;
import ballerina/java.jdbc;
// import ballerina/auth;
import ballerina/sql;
// import ballerina/time;





function tableCreations(jdbc:Client jdbcClient) returns int|string|sql:Error?{

    int|string|sql:Error? result;

    // result = createNumericTable(jdbcClient);
    // result = createMoneyTable(jdbcClient);
    // result = createCharacterTable(jdbcClient);
    // result = createBinaryTable(jdbcClient);
    // result = createDateTimeTable(jdbcClient);
    // result = createBooleanTable(jdbcClient);
    // result = createEnumTable(jdbcClient);
    // result = createGeometricTable(jdbcClient);
    // result = createNetworkTable(jdbcClient);
    // result = createBitTable(jdbcClient);

    // result = createTextSearchTable(jdbcClient);
    // result = createUuidTable(jdbcClient);
    // result = createXmlTable(jdbcClient);
    // result = createJsonTable(jdbcClient);
    // result = createArrayTable(jdbcClient);
    // result = createCompositeTable(jdbcClient);
    // result = createRangeTable(jdbcClient);
    result = createDomainTable(jdbcClient);
    // result = createObjectIdentifierTable(jdbcClient);
    // result = createPglsnTable(jdbcClient);
    // result = createPseudoTypeTable(jdbcClient);
    
     return result;   


}



function tableInsertions(jdbc:Client jdbcClient) returns sql:ExecutionResult|sql:Error?{

    sql:ExecutionResult|sql:Error? result;


    // result = numericTableInsertions(jdbcClient);
    // result = moneyTableInsertions(jdbcClient);
    // result = characterTableInsertions(jdbcClient);
    // result = binaryTableInsertions(jdbcClient);
    // result = DateTimeTableInsertions(jdbcClient);
    // result = booleanTimeTableInsertions(jdbcClient);
    // result = enumTableInsertions(jdbcClient);
    // result = geometricTableInsertions(jdbcClient);
    // result = networkTableInsertions(jdbcClient);
    // result = BitTableInsertions(jdbcClient);

    // result = textSearchTableInsertions(jdbcClient);
    // result = UUIDTableInsertions(jdbcClient);
    // result = xmlTableInsertions(jdbcClient);
    // result = JsonTableInsertions(jdbcClient);
    // result = arrayTableInsertions(jdbcClient);
    // result = ComplexTableInsertions(jdbcClient);
    // result = RangeTableInsertions(jdbcClient);
    result = domainTableInsertions(jdbcClient);
    // result = objectIdentifierTableInsertions(jdbcClient);
    // result = pslgnTableInsertions(jdbcClient);


    return result;
}



function tableSelections(jdbc:Client jdbcClient) returns sql:Error?{

        sql:Error? result;

        // result = numericTableSelection(jdbcClient);
        // result = moneyTableSelection(jdbcClient);
        // result = characterTableSelection(jdbcClient);
        // result = binaryTableSelection(jdbcClient);
        // result = dateTimeTableSelection(jdbcClient);
        // result = BooleanTableSelection(jdbcClient);
        // result = enumTableSelection(jdbcClient);
        // result = geometricTableSelection(jdbcClient);
        // result = networkTableSelection(jdbcClient);
        // result = bitTableSelection(jdbcClient);

        // result = textsearchTableSelection(jdbcClient);
        // result = uuidTableSelection(jdbcClient);
        // result = xmlTableSelection(jdbcClient);
        // result = jsonTableSelection(jdbcClient);
        // result = arrayTableSelection(jdbcClient);
        // result = complexTableSelection(jdbcClient);
        // result = rangeTableSelection(jdbcClient);
        result = domainTableSelection(jdbcClient);
        // result = objectIdentifierTableSelection(jdbcClient);
        // result = pglsnTableSelection(jdbcClient);

        return result;
        
}


public type characterRecord record{

    int ID;
    string charType;
    string varcharType;
    string textType;
    string nameType;
    string charWithoutLengthType;

};

public type moneyRecord record{

    int ID;
    decimal moneyType;

};

public type numericRecord record{

    int ID;
    int smallIntType;
    int intType;
    int bigIntType;
    decimal decimalType;
    decimal numericType;
    float realType;
    float doublePrecisionType;
    int smallSerialType;
    int serialType;
    int bigSerialType;

};

public type NetworkRecord record{
    
    int ID;
    string inetType;
    string cidrType;
    string macaddrType;
    string macaddr8Type;
};

public type GeometricRecord record{
    
    int ID;
    string pointType;
    string lineType;
    string lsegType;
    string boxType;
    string pathType;
    string polygonType;
    string circleType;

};

public type EnumRecord record{
    
    int ID;
    string enumType;

};


public type BooleanRecord record{
    
    int ID;
    boolean booleanType;

};

public type DateTimeRecord record{
    
    int ID;
    string timestampType;
    string timestamptzType;
    string dateType;
    string timeType;
    string timeWithTimeZoneType;
    string intervalType;

};

public type BinaryRecord record{

    int ID;
    byte[] byteaType;//1400000

};


public type JsonRecord record{
    
    int ID;
    json jsonType;
    json jsonbType;
    string jsonpathType;
};

public type XmlRecord record{
    
    int ID;
    string xmlType;
};


public type UuidRecord record{
    
    int ID;
    byte[] uuidType;
};

public type TextSearchRecord record{
    
    int ID;
    string tsvectorType;
    byte[] tsqueryType;
};


public type BitRecord record{
    
    int ID;
    string bitType;
    decimal bitVaryType;
    float bitVaryType2;
    int bitOnlyType;
};


public type ArrayRecord record{
    
    int ID;
    string textArrayType;
    string[] textArray2Type;
    int[] integerArrayType;
    string integerArray2Type;
    int[5] arrayType;
    int[] array2Type;
};


public type ComplexRecord record{
    
    int ID;
    
    string complexType;
    string inventoryType;

    // record{|
    //     decimal r;
    //     decimal i;
    // |} complexType;

    // record{|
    //     string name;
    //     decimal supplier_id;
    //     decimal price;
    // |} inventoryType;
    
};


public type RangeRecord record{
    
    int ID;
    string int4rangeType;
    string int8rangeType;
    string numrangeType;
    string tsrangeType;
    string tstzrangeType;
    string daterangeType;
    string floatrangeType;
};


public type DomainRecord record{
    
    int ID;
    int posintType;
};



public type ObjectIdentifierRecord record{
    
    int ID;
    string oidType;
    string regclassType;
    string regconfigType;
    string regdictionaryType;
    string regnamespaceType;
    string regoperType;
    string regoperatorType;
    string regprocType;
    string regprocedureType;
    string regroleType;
    string regtypeType;
};





public type PglsnRecord record{
    
    int ID;
    string pglsnType;
};

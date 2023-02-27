table 70002 FBM_CustOpSite
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;
        }
        field(2; "Operator No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = FBM_Customer."No.";
        }
        field(3; "Site Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = FBM_Site;
        }
        // field(4; "Site Code 2"; Code[20])
        // {
        //     DataClassification = ToBeClassified;
        // }
        // field(5; "Vat Number"; Code[20])
        // {
        //     DataClassification = ToBeClassified;
        // }
    }
    keys
    {
        key(PK; "Customer No.", "Operator No.", "Site Code")
        {
            Clustered = true;
        }
    }
    
}

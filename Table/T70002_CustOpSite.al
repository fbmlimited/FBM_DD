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
            TableRelation = Customer;
        }
        field(3; "Site Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = FBM_Site where(Active = const(true));
        }

        field(1000; "Valid From"; Date)
        {
            Caption = 'Valid from';
        }
        field(1001; "Valid To"; Date)
        {
            Caption = 'Valid to';
        }
        field(1002; "Record Owner"; code[30])
        {
            Caption = 'Record Owner';
        }
        field(1003; "Change Note"; Text[1024])
        {
            Caption = 'Change Note';
        }
        field(2000; Subsidiary; text[250])
        {
            Caption = 'Subsidiary';
            FieldClass = FlowField;
            CalcFormula = Lookup("Company Information"."Custom System Indicator Text");
        }

    }
    keys
    {
        key(PK; "Customer No.", "Site Code")
        {
            Clustered = true;
        }
    }

}

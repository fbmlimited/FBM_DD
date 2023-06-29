table 70002 FBM_CustOpSite
{
    DataClassification = ToBeClassified;
    DataPerCompany = false;

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = FBM_Customer where(ActiveRec = const(true));
        }
        field(6; "Cust Loc Code"; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Operator No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = FBM_Customer where(ActiveRec = const(true));
        }
        field(7; "Op Loc Code"; code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Site Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = FBM_Site where(ActiveRec = const(true));
        }
        field(4; "Site Loc Code"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(5; IsActive; Boolean)
        {
            Caption = 'Active Record';
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
        field(1004; Version; Integer)
        {
            Caption = 'Version';
        }
        field(1005; ActiveRec; Boolean)
        {
            Caption = 'Active Record';
        }
        field(2000; Subsidiary; text[250])
        {
            Caption = 'Subsidiary';

        }
        field(2001; Active; Boolean)
        {
            Caption = 'Is Active';

        }

    }
    keys
    {
        key(PK; Subsidiary, "Customer No.", "Operator No.", "Site Code")
        {
            Clustered = true;
        }
    }

}

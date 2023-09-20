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
            caption = 'Site Code';
            DataClassification = ToBeClassified;
            TableRelation = FBM_Site where(ActiveRec = const(true));
        }
        field(4; "Site Loc Code"; Code[20])
        {
            caption = 'Site Loc Code';
            DataClassification = ToBeClassified;

        }
        field(5; IsActive; Boolean)
        {
            Caption = 'Active Record';
        }
        field(8; Status; enum "FBM_Site Status_DD")
        {

            Caption = 'Status';
            Editable = true;
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
        field(70019; FBM_LastAdquiredDate; Date)
        {
            Caption = 'Last Adquired Date';

        }
        field(70020; FBM_Sma; DateTime)
        {
            Caption = 'Loc. Site Modified';

        }
        field(70021; FBM_Sca; DateTime)
        {
            Caption = 'Loc. Site Created';

        }


    }
    keys
    {
        key(PK; Subsidiary, "Cust Loc Code", "Op Loc Code", "Site Loc Code")
        {
            Clustered = true;
        }
    }

}

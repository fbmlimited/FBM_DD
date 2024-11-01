table 70019 FBM_FAHistory_DD
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';



        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';

        }
        field(5; "FA Class Code"; Code[10])
        {
            Caption = 'FA Class Code';
            TableRelation = "FA Class";


        }
        field(6; "FA Subclass Code"; Code[10])
        {
            Caption = 'FA Subclass Code';
            TableRelation = "FA Subclass";


        }
        field(10; "FA Location Code"; Code[10])
        {
            Caption = 'FA Location Code';
            TableRelation = "FA Location";


        }
        field(17; "Serial No."; Text[50])
        {
            Caption = 'Serial No.';

        }
        field(70107; "FBM_Site"; code[20])
        {
            Caption = 'Site';
            TableRelation = FBM_Site;

        }

        field(70113; FBM_Status; Enum "FBM_FA Status_DD")
        {
            Caption = 'FA Status';
            InitValue = 0;

        }
        field(70116; "FBM_DatePrepared"; Date)
        {
            Caption = 'Date Prepared';
        }
        field(70117; FBM_Brand; Option)
        {
            Caption = 'Brand';
            OptionCaption = ' ,FBM,DINGO';
            OptionMembers = " ",FBM,DINGO;
        }
        field(70118; FBM_Lessee; text[20])
        {
            Caption = 'Lessee';

        }
        field(70123; FBM_Model; text[50])
        {
            Caption = 'Model';
            TableRelation = FBM_ListValues.Value WHERE(TYPE = CONST('FAMODEL'));
            ValidateTableRelation = false;

        }
        field(70124; FBM_Segment2; enum FBM_Segment_DD)
        {
            caption = 'Segment ';


        }
        field(70000; "Valid From"; Date)
        {
            Caption = 'Valid from';
        }
        field(70001; "Valid To"; Date)
        {
            Caption = 'Valid to';
        }
        field(70002; "Record Owner"; code[30])
        {
            Caption = 'Record Owner';
        }
        field(70003; "Change Note"; Text[1024])
        {
            Caption = 'Change Note';
        }
        field(70004; Version; Integer)
        {
            Caption = 'Version';
            DataClassification = ToBeClassified;
        }
        field(70005; ActiveRec; Boolean)
        {
            Caption = 'Active Record';
        }
        field(70006; FBM_AcquisitionCost; Decimal)
        {
            caption = 'Acquisition Cost';
        }
        field(70007; FBM_AcquisitionDate; Date)
        {
            caption = 'Acquisition Date';

        }

    }

    keys
    {
        key(PK; "No.", Version, ActiveRec)
        {
            Clustered = true;
        }
    }

}
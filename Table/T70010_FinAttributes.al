table 70010 FBM_FinAttributes
{
    DataPerCompany = false;

    fields
    {
        field(1; "EntryNo"; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Rectype"; Option)
        {
            OptionMembers = " ",CustOp,Site,Subsidiary;
            Caption = 'Record Type';
            DataClassification = ToBeClassified;
        }
        field(3; "Code"; code[20])
        {

            Caption = 'Code';
            DataClassification = ToBeClassified;
            TableRelation = if (rectype = const(CustOp)) Customer else
            if (rectype = const(Site)) FBM_CustomerSite_C."Site Code" else
            if (Rectype = const(Subsidiary)) FBM_Subsidiary.Subsidiary;
            ValidateTableRelation = false;
        }
        field(4; Segment; Option)
        {
            caption = 'Segment ';
            OptionMembers = " ",Bingo,Spin,Online;
            //ObsoleteState = Removed;

        }
        field(5; Share; Decimal)
        {
            caption = 'Share %';


        }
        field(6; low; Decimal)
        {
            caption = 'Low';


        }
        field(7; high; Decimal)
        {
            caption = 'High';


        }
        field(8; FranchiseTax; Decimal)
        {
            caption = 'Franchise Tax %';


        }

        field(9; WTHTax; Decimal)
        {
            caption = 'WithHolding Tax';


        }
        field(10; FBM_Segment2; enum FBM_Segment_DD)
        {
            caption = 'Segment ';


        }
        // field(10; Royalty; Decimal)
        // {
        //     caption = 'Royalty %';


        // }
        field(11; InvInt; Decimal)
        {
            caption = 'Internal Invoicing %';


        }
        field(12; InvExt; Decimal)
        {
            caption = 'External Invoicing %';


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



    }

    keys
    {
        key(PK; EntryNo)
        {
            Clustered = true;
        }
    }

}
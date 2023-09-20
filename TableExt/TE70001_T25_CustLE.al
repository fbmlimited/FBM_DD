tableextension 70001 FBM_CustLEExt_DD extends "Cust. Ledger Entry"
{
    fields
    {

        field(70000; "FBM_Period Start"; Date)
        {
            caption = 'Period Start';
            DataClassification = ToBeClassified;
        }
        field(70001; "FBM_Period End"; Date)
        {
            caption = 'Period End';
            DataClassification = ToBeClassified;
        }

        field(70003; FBM_Segment; Option)
        {
            caption = 'Segment';
            OptionMembers = " ",Bingo,Spin,Online;

        }
        field(70004; FBM_Site; Code[20])
        {
            Caption = 'Site';


        }
        field(61100; FBM_DocNo; code[20])
        {
            Caption = 'Doc. No.';


        }
        field(61101; FBM_DocDate; Date)
        {
            Caption = 'Doc. Date';


        }
        field(61102; FBM_DocType; Enum "Gen. Journal Document Type")
        {
            Caption = 'Doc. Type';


        }

    }
    var
}
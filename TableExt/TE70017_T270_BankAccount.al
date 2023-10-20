tableextension 70017 FBM_BankAccountExt_DD extends "Bank Account"
{
    fields
    {
        field(70100; "FBM_Check Layout Code"; code[20])
        {
            caption = 'Check Layout';
            TableRelation = "Custom Report Layout" where("Report ID" = const(60116));
        }
        // Add changes to table fields here
        field(70101; FBM_Beneficiary; Text[250])
        {
            Caption = 'Beneficiary';
        }
        field(70105; FBM_IsPayment; Boolean)
        {
            Caption = 'Is Payment Account';
        }

    }

    var
        myInt: Integer;
}
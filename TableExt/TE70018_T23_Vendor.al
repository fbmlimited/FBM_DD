tableextension 70018 FBM_VendorExt_DD extends Vendor
{

    fields
    {
        field(70002; "FBM_Default Bank Account"; Code[20])
        {
            TableRelation = "Bank Account";


        }
        field(70003; "FBM_Print Name on Check"; Text[100])
        {
            Caption = 'Print Name on Check';
        }
    }
    trigger OnAfterModify()
    begin
        TestField("Currency Code");
    end;
}
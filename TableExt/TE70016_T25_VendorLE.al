tableextension 70016 FBM_VendorLEExt_DD extends "Vendor Ledger Entry"
{
    fields
    {
        field(70000; FBM_approved; Boolean)
        {
            Caption = 'Finance Approved';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if FBM_approved = true then begin
                    "FBM_approved date" := System.CurrentDateTime();
                    "FBM_approved user" := UserId;
                end
                else begin
                    Clear("FBM_approved date");
                    Clear("FBM_approved user");
                end;

            end;
        }
        field(70001; "FBM_approved date"; DateTime)
        {
            Caption = 'Finance Approved Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70002; "FBM_approved user"; Text[50])
        {
            Caption = 'Finance Approved User';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(70003; "FBM_Approver Comment"; Text[50])
        {
            Caption = 'Finance Approver Comment';
            DataClassification = ToBeClassified;
            Editable = true;
        }

    }
}

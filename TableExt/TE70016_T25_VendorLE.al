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
        field(70004; FBM_approved1; Boolean)
        {
            Caption = 'AP Approved';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if FBM_approved = true then begin
                    "FBM_approved date1" := System.CurrentDateTime();
                    "FBM_approved user1" := UserId;
                end
                else begin
                    Clear("FBM_approved date1");
                    Clear("FBM_approved user1");
                end;

            end;
        }
        field(70005; "FBM_approved date1"; DateTime)
        {
            Caption = 'AP Approved Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70006; "FBM_approved user1"; Text[50])
        {
            Caption = 'AP Approved User';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(70007; "FBM_Approver Comment1"; Text[50])
        {
            Caption = 'AP Approver Comment';
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(70008; FBM_approved2; Boolean)
        {
            Caption = 'Inv. Approved';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if FBM_approved = true then begin
                    "FBM_approved date1" := System.CurrentDateTime();
                    "FBM_approved user1" := UserId;
                end
                else begin
                    Clear("FBM_approved date1");
                    Clear("FBM_approved user1");
                end;

            end;
        }
        field(70009; "FBM_approved date2"; DateTime)
        {
            Caption = 'Inv. Approved Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70010; "FBM_approved user2"; Text[50])
        {
            Caption = 'Inv. Approved User';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(70011; "FBM_Approver Comment2"; Text[50])
        {
            Caption = 'Inv. Approver Comment';
            DataClassification = ToBeClassified;
            Editable = true;
        }


    }
}

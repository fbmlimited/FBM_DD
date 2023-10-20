tableextension 70016 FBM_VendorLEExt_DD extends "Vendor Ledger Entry"
{

    fields
    {
        field(70100; FBM_approved; Boolean)
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
        field(70101; "FBM_approved date"; DateTime)
        {
            Caption = 'Finance Approved Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70102; "FBM_approved user"; Text[50])
        {
            Caption = 'Finance Approved User';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(70103; "FBM_Approver Comment"; Text[50])
        {
            Caption = 'Finance Approver Comment';
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(70104; FBM_approved1; Boolean)
        {
            Caption = 'AP Approved';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                util: Codeunit FBM_Utility_DD;
            begin
                util.updatedetvendle(rec);
                if FBM_approved1 = true then begin
                    "FBM_approved date1" := System.CurrentDateTime();
                    "FBM_approved user1" := UserId;
                end
                else begin
                    Clear("FBM_approved date1");
                    Clear("FBM_approved user1");
                end;

            end;
        }
        field(70105; "FBM_approved date1"; DateTime)
        {
            Caption = 'AP Approved Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70106; "FBM_approved user1"; Text[50])
        {
            Caption = 'AP Approved User';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(70107; "FBM_Approver Comment1"; Text[50])
        {
            Caption = 'AP Approver Comment';
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(70108; FBM_approved2; Boolean)
        {
            Caption = 'Inv. Approved';
            DataClassification = ToBeClassified;

        }
        field(70109; "FBM_approved date2"; DateTime)
        {
            Caption = 'Inv. Approved Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70110; "FBM_approved user2"; Text[50])
        {
            Caption = 'Inv. Approved User';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(70111; "FBM_Approver Comment2"; Text[50])
        {
            Caption = 'Inv. Approver Comment';
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(70112; "FBM_Paid"; Boolean)
        {
            Caption = 'Paid';
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(70113; "FBM_Amount"; decimal)
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70114; "FBM_RemAmount"; decimal)
        {
            Caption = 'Rem. Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }

    }
}

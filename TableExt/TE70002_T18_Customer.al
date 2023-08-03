tableextension 70002 FBM_CustomerExt_DD extends Customer
{
    fields
    {

        field(70001; "FBM_Separate Halls Inv."; Boolean)
        {
            Caption = 'Separate Halls Invoice';
        }
        field(70002; "FBM_Customer Since"; Date)
        {
            Caption = 'Customer Since';
        }
        field(70003; "FBM_GrCode"; Code[20])
        {
            caption = 'Group Code';
            //Editable = false;
        }
        field(70004; "FBM_Group"; Text[100])
        {
            Caption = 'Group Customer';

            FieldClass = Normal;
            TableRelation = FBM_CustGroup;
            ValidateTableRelation = false;

        }
        field(70005; "FBM_SubGroup"; Text[100])
        {
            Caption = 'SubGroup Customer';

            FieldClass = Normal;
            TableRelation = FBM_CustGroup.SubGroup where("Group" = field(FBM_Group));
            ValidateTableRelation = false;


        }




        field(71000; "FBM_Valid From"; Date)
        {
            Caption = 'Valid from';
        }
        field(71001; "FBM_Valid To"; Date)
        {
            Caption = 'Valid to';
        }
        field(71002; "FBM_Record Owner"; code[30])
        {
            Caption = 'Record Owner';
        }
        field(71003; "FBM_Change Note"; Text[1024])
        {
            Caption = 'Change Note';
        }

        field(70036; "FBM_Name 3"; text[100])
        {
            Caption = 'Group Name';

        }
        field(70034; "FBM_Payment Bank Code"; Code[20])
        {
            caption = 'Payment bank';
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No." where(FBM_IsPayment = const(true));
        }
        field(70035; "FBM_Payment Bank Code2"; Code[20])
        {
            caption = 'Payment bank 2';
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No." where(FBM_IsPayment = const(true));
        }




    }
    trigger
    OnAfterDelete()
    var
        csite: record FBM_CustomerSite_C;
        cos: record FBM_CustOpSite;
    begin
        csite.SetRange("Customer No.", xrec."No.");
        csite.DeleteAll();
        cos.setrange("Cust Loc Code", xrec."No.");
        cos.DeleteAll();

    end;


}

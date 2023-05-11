tableextension 70004 FBM_FixedAssetExt_DD extends "Fixed Asset"
{
    fields
    {
        modify("Serial No.")
        {
            trigger OnAfterValidate()
            begin
                FA.Reset();
                FA.SetFilter("Serial No.", Rec."Serial No.");
                if FA.FindFirst() then error(Text000, FA."No.");
            end;
        }

        field(70002; "FBM_Date Prepared"; Date)
        {
            Caption = 'Date Prepared';
        }


        field(70005; "FBM_Fa Posting Group Depr"; Code[20])
        {
            Caption = 'Fa Posting Group Depr';
            FieldClass = FlowField;
            CalcFormula = lookup("FA Depreciation Book"."FA Posting Group" where("FA No." = field("No."), "Depreciation Book Code" = filter('COMPANY')));
        }
        field(70006; "FBM_Location"; text[50])
        {


        }
        field(70007; "FBM_Hall"; text[50])
        {


        }
        field(70008; "FBM_Group"; Text[100])
        {
            Caption = 'Group Customer';
            Description = 'ONETECH';
            FieldClass = Normal;
            TableRelation = FBM_CustGroup where(IsGroup = const(true));

        }
        field(70009; "FBM_Hall Status"; Text[50])
        {
            FieldClass = Normal;
        }


        field(70010; "FBM_Operator Name"; Text[100])
        {
            FieldClass = Normal;
        }
        field(70011; "FBM_Business Name"; Text[100])
        {
            FieldClass = Normal;
        }
        field(70012; FBM_Is_EGM; Boolean)
        {
            Caption = 'Is EGM';
            FieldClass = FlowField;
            CalcFormula = lookup("FA Subclass".FBM_EGM where(code = field("FA Subclass Code")));

        }
        field(70013; FBM_Status; Enum "FBM_FA Status_DD")
        {
            Caption = 'FA Status';

        }


    }
    var
        FA: Record "Fixed Asset";
        Text000: Label 'Fixed Asset %1 has the same Serial No.!';
}

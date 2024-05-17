tableextension 70004 FBM_FixedAssetExt_DD extends "Fixed Asset"
{
    fields
    {

        field(70101; IsActive; Boolean)
        {
            Caption = 'Is Active';

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
        field(70114; FBM_EGM_Property; text[3])
        {
            Caption = 'Property';

        }
        field(70115; FBM_Subsidiary; text[20])
        {
            Caption = 'Subsidiary';

        }
        // modify("Serial No.")
        // {
        // trigger OnAfterValidate()
        // var
        //     comp: record Company;
        //     count: Integer;
        // begin
        //     comp.FindFirst();
        //     count := 0;
        //     repeat
        //         fa.ChangeCompany(comp.Name);
        //         FA.Reset();
        //         FA.SetFilter("Serial No.", Rec."Serial No.");
        //         fa.SetFilter(FBM_Status, '<>%1', fa.FBM_Status::"I. Sold");
        //         fa.SetRange(IsActive, true);
        //         count += fa.Count;
        //     until comp.next = 0;
        //     if count > 0 then error(Text000, FA."No.");

        // end;
        // }

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
        field(70119; FBM_Sma; DateTime)
        {
            Caption = 'SystemModifiedAt Original';

        }
        field(70120; FBM_Dupecomp; text[3])
        {
            Caption = 'Dupe';

        }
        field(70121; FBM_IsEGM; Boolean)
        {
            Caption = 'Is EGM';
            FieldClass = FlowField;
            CalcFormula = lookup("FA Subclass".FBM_EGM where(Code = field("FA Subclass Code")));

        }
        field(70122; FBM_Sca; DateTime)
        {
            Caption = 'FA Created';

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


    }
    var
        FA: Record "Fixed Asset";
        Text000: Label 'Fixed Asset %1 has the same Serial No.!';

}

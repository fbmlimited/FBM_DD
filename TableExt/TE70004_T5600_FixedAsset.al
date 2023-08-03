tableextension 70004 FBM_FixedAssetExt_DD extends "Fixed Asset"
{
    fields
    {

        field(70001; IsActive; Boolean)
        {
            Caption = 'Is Active';

        }




        field(70007; "FBM_Site"; code[20])
        {
            Caption = 'Site';
            TableRelation = FBM_Site;

        }






        field(70013; FBM_Status; Enum "FBM_FA Status_DD")
        {
            Caption = 'FA Status';

        }
        field(70014; FBM_EGM_Property; text[3])
        {
            Caption = 'Property';

        }
        field(70015; FBM_Subsidiary; text[20])
        {
            Caption = 'Subsidiary';

        }
        modify("Serial No.")
        {
            trigger OnAfterValidate()
            begin
                FA.Reset();
                FA.SetFilter("Serial No.", Rec."Serial No.");
                if FA.FindFirst() then error(Text000, FA."No.");
            end;
        }

        field(70016; "FBM_DatePrepared"; Date)
        {
            Caption = 'Date Prepared';
        }
        field(70017; FBM_Brand; Option)
        {
            Caption = 'Brand';
            OptionCaption = ' ,FBM,DINGO';
            OptionMembers = " ",FBM,DINGO;
        }
        field(70018; FBM_Lessee; text[20])
        {
            Caption = 'Lessee';

        }
        field(70019; FBM_Sma; DateTime)
        {
            Caption = 'SystemModifiedAt Original';

        }
        field(70020; FBM_Dupecomp; text[3])
        {
            Caption = 'Dupe';

        }


    }
    var
        FA: Record "Fixed Asset";
        Text000: Label 'Fixed Asset %1 has the same Serial No.!';

}

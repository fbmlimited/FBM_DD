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
            InitValue = 0;

        }
        field(70014; FBM_EGM_Property; text[3])
        {
            Caption = 'Property';

        }
        field(70015; FBM_Subsidiary; text[20])
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
        field(70021; FBM_IsEGM; Boolean)
        {
            Caption = 'Is EGM';
            FieldClass = FlowField;
            CalcFormula = lookup("FA Subclass".FBM_EGM where(Code = field("FA Subclass Code")));

        }
        field(70022; FBM_Sca; DateTime)
        {
            Caption = 'FA Created';

        }


    }
    var
        FA: Record "Fixed Asset";
        Text000: Label 'Fixed Asset %1 has the same Serial No.!';

}

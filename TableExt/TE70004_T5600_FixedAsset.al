tableextension 70004 FBM_FixedAssetExt_DD extends "Fixed Asset"
{
    fields
    {




        field(70005; "FBM_Fa Posting Group Depr"; Code[20])
        {
            Caption = 'Fa Posting Group Depr';
            FieldClass = FlowField;
            CalcFormula = lookup("FA Depreciation Book"."FA Posting Group" where("FA No." = field("No."), "Depreciation Book Code" = filter('COMPANY')));
        }

        field(70007; "FBM_Site"; code[20])
        {
            Caption = 'Site';
            TableRelation = FBM_Site;

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
        field(70014; FBM_EGM_Property; text[3])
        {
            Caption = 'Property';

        }
        field(70015; FBM_Subsidiary; text[20])
        {
            Caption = 'Subsidiary';

        }


    }
    var
        FA: Record "Fixed Asset";

}

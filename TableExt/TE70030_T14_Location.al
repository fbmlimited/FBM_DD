tableextension 70030 FBM_LocationExt_DD extends Location
{
    fields
    {
        field(70000; FBM_NewItem; Boolean)
        {
            Caption = 'Stock New Items';
            trigger
            OnValidate()
            begin
                if rec.FBM_NewItem then
                    rec.FBM_UsedItem := false;
            end;

        }
        field(70001; FBM_UedItem; Boolean)
        {
            Caption = 'Stock Used Items';
            ObsoleteState = Removed;


        }
        field(70002; FBM_UsedItem; Boolean)
        {
            Caption = 'Stock Used Items';

            trigger
            OnValidate()
            begin
                if rec.FBM_UsedItem then
                    rec.FBM_NewItem := false;
            end;

        }
        field(70003; FBM_TransitLoc; Boolean)
        {
            Caption = 'Temp Location before Installation';



        }
        field(70100; FBM_Site; Code[20])
        {
            Caption = 'Site';
            TableRelation = FBM_CustomerSite_C."Site Code";
            ValidateTableRelation = false;
        }
    }

}
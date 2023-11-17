tableextension 70036 FBM_PurchLineExt_DD extends "Purchase Line"
{
    fields
    {
        field(70100; FBM_Site; code[20])
        {
            Caption = 'Site';
            TableRelation = FBM_CustomerSite_C."Site Code";
            ValidateTableRelation = false;
        }
        modify("Location Code")
        {
            trigger
                OnAfterValidate()
            var
                loc: record Location;
            begin
                if loc.get("Location Code") then
                    if loc.FBM_Site <> '' then
                        rec.FBM_Site := loc.FBM_Site;
            end;
        }

    }

}
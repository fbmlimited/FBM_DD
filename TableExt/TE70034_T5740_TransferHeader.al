tableextension 70034 FBM_TransferHeaderExt_DD extends "Transfer Header"
{
    fields
    {
        field(70000; FBM_SiteFrom; code[20])
        {
            Caption = 'Site From';
            TableRelation = FBM_CustomerSite_C."Site Code";
            ValidateTableRelation = false;

        }
        field(70001; FBM_SiteTo; code[20])
        {
            Caption = 'Site To';
            TableRelation = FBM_CustomerSite_C."Site Code";
            ValidateTableRelation = false;

        }
        modify("Transfer-from Code")
        {
            trigger
            OnAfterValidate()
            var
                loc: record Location;
            begin
                if loc.get("Transfer-from Code") then
                    if loc.FBM_Site <> '' then
                        rec.FBM_SiteFrom := loc.FBM_Site;
            end;

        }
        modify("Transfer-to Code")
        {
            trigger
            OnAfterValidate()
            var
                loc: record Location;
            begin
                if loc.get("Transfer-to Code") then
                    if loc.FBM_Site <> '' then
                        rec.FBM_SiteTo := loc.FBM_Site;
            end;

        }

    }



}
page 61500 FBM_LinkedSite_DD
{
    Caption = 'Local Site';
    PageType = ListPart;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Name/Value Buffer";
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Rec.name)
                {
                    Caption = 'Subsidiary|Customer|Site|Status';
                    ApplicationArea = All;
                }
                field(Description; Rec.Value)
                {
                    caption = 'Site Gr. Code';
                    ApplicationArea = All;
                }

            }
        }

    }

    trigger
    OnOpenPage()
    begin
        comp.FindFirst();
        if comp.FindSet() then
            repeat
                cinfo.ChangeCompany(comp.Name);
                cinfo.get;
                if cinfo.FBM_CustIsOp then begin
                    csite.ChangeCompany(comp.Name);
                    //csite.setrange(Status, csite.Status::OPERATIONAL);
                    csite.SetFilter("Customer No.", '<>%1', '');
                    csite.SetRange(ActiveRec, true);
                    if csite.FindFirst() then
                        repeat
                            id += 1;
                            rec.id := id;
                            rec.name := copystr(cinfo."Custom System Indicator Text" + '|' + csite."customer No." + '|' + csite."Site Code" + '|' + format(csite.Status), 1, 250);
                            rec.value := csite.SiteGrCode;
                            rec.Insert();
                        until csite.Next() = 0;
                end;
            until comp.Next() = 0;
    end;

    var
        comp: record Company;
        cinfo: record "Company Information";
        csite: record FBM_CustomerSite_C;
        id: Integer;
}
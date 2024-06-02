page 61501 FBM_LinkedCust_DD
{
    Caption = 'Local Customer';
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
                    Caption = 'Subsidiary|Customer';
                    ApplicationArea = All;
                }
                field(Description; Rec.Value)
                {
                    caption = 'Customer Gr. Code';
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
                    cust.ChangeCompany(comp.Name);
                    //csite.setrange(Status, csite.Status::OPERATIONAL);

                    if cust.FindFirst() then
                        repeat
                            id += 1;
                            rec.id := id;
                            rec.name := copystr(cinfo."Custom System Indicator Text" + '|' + cust."No.", 1, 250);
                            rec.value := cust.FBM_GrCode;
                            rec.Insert();
                        until cust.Next() = 0;
                end;
            until comp.Next() = 0;
    end;

    var
        comp: record Company;
        cinfo: record "Company Information";
        cust: record Customer;
        id: Integer;
}
page 60135 FBM_SiteMasterList_DD
{
    Caption = 'Site Master List';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = FBM_Site;
    CardPageId = FBM_SiteMaster_DD;
    SourceTableView = where(ActiveRec = const(true));

    layout
    {
        area(Content)
        {
            group(header)
            {
                field(maxcode; maxcode)
                {
                    caption = 'Max SiteGrCode';
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            repeater(Group)
            {
                FIELD(pendingreq; pendingreq)
                {
                    ApplicationArea = All;
                    Caption = 'Pending req.';
                }
                field("Site Code"; Rec."Site Code")
                {
                    ApplicationArea = All;
                }
                field("Site Name"; Rec."Site Name")
                {
                    ApplicationArea = All;
                }
                field("Site Name 2"; Rec."Site Name 2")
                {
                    ApplicationArea = All;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = All;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }
                field(County; Rec.County)
                {
                    ApplicationArea = All;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = All;
                }
                field("Vat Number"; Rec."Vat Number")
                {
                    ApplicationArea = All;
                }
                field(Company1; Rec.Company1)
                {
                    ApplicationArea = All;
                }
                field(Company2; Rec.Company2)
                {
                    ApplicationArea = All;
                }
                field(Company3; Rec.Company3)
                {
                    ApplicationArea = All;
                }

            }
        }
        area(Factboxes)
        {

        }
    }



    actions
    {
        area(Navigation)
        {
            action(RequestsList)

            {
                caption = 'Requests List';
                image = List;
                Promoted = true;
                PromotedIsBig = true;
                ApplicationArea = All;
                PromotedCategory = Process;

                trigger
                OnAction()
                var
                    req: record FBM_CustSiteReq;
                    PREQ: page FBM_ReqList_DD;
                begin
                    req.SetRange(Rectype, 'SITE');
                    preq.SetTableView(req);
                    preq.Run();
                    clear(PREQ);
                end;


            }
        }
    }
    trigger
                       OnOpenPage()
    begin
        getmaxsite();
        rec.SetRange(ActiveRec, true);

    end;

    trigger
        OnAfterGetRecord()
    begin

        req.setrange(rectype, 'SITE');
        REQ.SetRange(Status, req.Status::Sent);

        if (rec."Site Code" = req.CustSiteCode) and REQ.FindFirst() THEN begin

            rec."Site Name_New" := req.Name;
            rec."Site Name 2_New" := req."Name 2";
            rec.Address_New := req.Address;
            rec."Address 2_New" := req."Address 2";
            rec.City_New := req.City;
            rec."Post Code_New" := req."Post Code";
            rec.County_New := req.County;
            rec."Country/Region Code_New" := req."Country/Region Code";
            rec."Vat Number_New" := req."VAT registration No.";

            REC.Modify();
            repeat
                req.Status := req.Status::Received;
                req.Modify();
            until req.Next() = 0;
        end;

        req.setrange(Rectype, 'SITE');
        REQ.SetRange(CustSiteCode, REC."Site Code");
        req.SetRange(Status, req.Status::Received);
        pendingreq := REQ.Count;

    end;

    var
        maxcode: Text;
        site: record FBM_Site;

        req: record FBM_CustSiteReq;
        pendingreq: Integer;



    procedure getmaxsite()


    begin
        site.SetFilter("Site Code", '<%1', 'SITE9990');
        site.SetCurrentKey("Site Code");
        if site.FindLast() then
            maxcode := site."Site Code";
        CurrPage.Update();
    end;
}
page 60130 FBM_SiteReq_DD
{
    Caption = 'Customer Request';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = FBM_CustSiteReq;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(ReqType; Rec.ReqType)
                {
                    ApplicationArea = All;
                    trigger
                    OnValidate()

                    begin
                        fillfields(rec.CustSiteCode);
                    end;
                }
                field(CustSiteCode; Rec.CustSiteCode)
                {
                    ApplicationArea = All;
                    enabled = viscode;
                    trigger
                    OnValidate()

                    begin
                        fillfields(rec.CustSiteCode);
                    end;

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;

                }
                field("Name 2"; Rec."Name 2")
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
                field(City; Rec.City)
                {
                    ApplicationArea = All;

                }
                field("Post Code"; Rec."Post Code")
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
                field("VAT registration No."; Rec."VAT registration No.")
                {
                    ApplicationArea = All;

                }
                field(FBM_Group; Rec.FBM_Group)
                {
                    ApplicationArea = All;

                }
                field(FBM_Subgroup; Rec.FBM_Subgroup)
                {
                    ApplicationArea = All;

                }
            }
            group(System)
            {
                Editable = false;
                field(EntryNo; Rec.EntryNo)
                {
                    ApplicationArea = All;

                }
                field(Sender; Rec.Sender)
                {
                    ApplicationArea = All;

                }
                field(Sent; Rec.Sent)
                {
                    ApplicationArea = All;

                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;

                }
                field(Rectype; Rec.Rectype)
                {
                    ApplicationArea = All;

                }


            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Send)
            {
                ApplicationArea = All;
                caption = 'Send Request';

                trigger OnAction()
                begin
                    sendrequest();
                end;
            }
        }
    }
    trigger
    OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        rec.CustSiteCode := ccode;
        rec.Rectype := 'SITE';

        fillfields(ccode);
    end;

    trigger
    OnClosePage()
    begin
        req.setrange(Status, req.Status::Draft);
        req.SetRange(Sender, UserId);
        req.DeleteAll();
    end;

    trigger
    OnOpenPage()
    begin

        currpage.Editable(pedit);
    end;

    var
        ccode: code[20];
        viscode: Boolean;
        sitem: record FBM_Site;
        cinfo: record "Company Information";
        pedit: Boolean;
        req: record FBM_CustSiteReq;

    procedure passpar(custcode: code[20]; edit: boolean)
    begin
        pedit := edit;
        ccode := custcode;
        rec.Init();
        rec.ReqType := rec.ReqType::Edit;
        //rec.Insert();
        fillfields(ccode);
    end;

    local procedure sendrequest()
    begin
        cinfo.get;
        if cinfo.FBM_IsOnMainServer then
            sendtotable()
        else
            sendtows();

    end;

    local procedure sendtotable()
    begin
        cinfo.get;
        rec.sender := UserId;
        rec.Status := rec.Status::Sent;
        rec.companyReq := cinfo."Custom System Indicator Text";
        rec.Sent := CurrentDateTime;
        rec.Modify();
    end;

    local procedure sendtows()
    begin
        rec.sender := UserId;
        rec.Status := rec.Status::Sent;
        rec.companyReq := cinfo."Custom System Indicator Text";
        rec.Sent := CurrentDateTime;
        rec.Modify();
    end;

    local procedure fillfields(cust: code[20])
    begin
        if rec.reqtype = rec.ReqType::Edit then begin
            viscode := true;
            sitem.SetRange(ActiveRec, true);
            sitem.SetRange("Site Code", cust);
            if sitem.FindFirst() then begin
                rec.Init();
                REC.ReqType := REC.ReqType::Edit;
                rec.CustSiteCode := sitem."Site Code";
                rec.Name := sitem."Site Name";
                rec."Name 2" := sitem."Site Name 2";
                rec.Address := sitem."Address 2";
                rec."Post Code" := sitem."Post Code";
                rec.City := sitem.City;
                rec.County := sitem.County;
                rec."Country/Region Code" := sitem."Country/Region Code";
                rec."VAT registration No." := sitem."Vat Number";
                ;
                rec.Ori_EntryNo := rec.EntryNo;
                rec.Rectype := 'SITE';
                REC.Status := REC.Status::Draft;
                rec.Insert();
            end;
        end
        ELSE begin
            rec.Init();
            REC.ReqType := REC.ReqType::New;
            rec.Status := rec.Status::Draft;
            rec.Ori_EntryNo := rec.EntryNo;
            rec.Rectype := 'SITE';
            viscode := false;
        end;
    end;
}
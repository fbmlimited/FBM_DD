page 60111 FBM_CustomerReq_DD
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
                field(CustCode; Rec.CustSiteCode)
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
                caption = 'Envia Solicitud';

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
        rec.Rectype := 'CUST';

        fillfields(ccode);
    end;

    trigger
    OnOpenPage()
    begin

        currpage.Editable(pedit);
    end;

    var
        ccode: code[20];
        viscode: Boolean;
        custm: record FBM_Customer;
        cinfo: record "Company Information";
        pedit: Boolean;

    procedure passpar(custcode: code[20]; edit: boolean)
    begin
        pedit := edit;
        ccode := custcode;
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
            custm.SetRange(ActiveRec, true);
            custm.SetRange("No.", cust);
            if custm.FindFirst() then begin
                rec.Name := custm.Name;
                rec."Name 2" := custm."Name 2";
                rec.Address := custm."Address 2";
                rec."Post Code" := custm."Post Code";
                rec.City := custm.City;
                rec.County := custm.County;
                rec."Country/Region Code" := custm."Country/Region Code";
                rec."VAT registration No." := custm."VAT Registration No.";
                rec.FBM_Group := custm.FBM_Group;
                rec.FBM_Subgroup := custm.FBM_SubGroup;
                rec.Ori_EntryNo := rec.EntryNo;
            end;
        end;
    end;
}
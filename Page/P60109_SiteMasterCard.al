page 60109 FBM_SiteMaster_DD
{
    Caption = 'Site Master';
    PageType = Card;
    DataCaptionFields = "Site Code", "Site Name";

    ApplicationArea = All;
    SourceTable = FBM_Site;


    layout
    {
        area(Content)
        {
            group(Header)
            {
                field(maxcode; maxcode)
                {
                    caption = 'Max SiteGrCode';
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group(General)
            {

                field("Site Code"; rec."Site Code")
                {
                    ApplicationArea = All;

                }
                field("Site Name"; Rec."Site Name")
                {
                    ApplicationArea = All;


                }
                field("Site Name_New"; Rec."Site Name_New")
                {
                    ApplicationArea = All;
                    Enabled = hasreq;
                    Style = Attention;
                    StyleExpr = rec."Site Name" <> rec."Site Name_New";


                }
                field("Site Name 2"; Rec."Site Name 2")
                {
                    ApplicationArea = All;

                }
                field("Site Name 2_New"; Rec."Site Name 2_New")
                {
                    ApplicationArea = All;
                    Enabled = hasreq;
                    Style = Attention;
                    StyleExpr = rec."Site Name 2" <> rec."Site Name 2_New";
                }



                // field(Status; Rec.Status)
                // {
                //     ApplicationArea = All;

                // }
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
                field(ActiveRec; Rec.ActiveRec)
                {
                    ApplicationArea = All;

                }
                field(Version; Rec.Version)
                {
                    ApplicationArea = All;

                }
                field("Valid From"; Rec."Valid From")
                {
                    ApplicationArea = All;

                }
                field("Valid To"; Rec."Valid To")
                {
                    ApplicationArea = All;

                }
                field("Record Owner"; Rec."Record Owner")
                {
                    ApplicationArea = All;

                }
                field("Change Note"; Rec."Change Note")
                {
                    ApplicationArea = All;

                }



            }
            group("Address & Contact")
            {
                Caption = 'Address';
                group(AddressDetails)
                {
                    Caption = 'Address';
                    field(Address; Rec.Address)
                    {
                        ApplicationArea = All;

                    }
                    field(Address_New; Rec.Address_New)
                    {
                        ApplicationArea = All;
                        Enabled = hasreq;
                        Style = Attention;
                        StyleExpr = rec.Address <> rec.Address_New;

                    }
                    field("Address 2"; Rec."Address 2")
                    {
                        ApplicationArea = All;

                    }
                    field("Address 2_New"; Rec."Address 2_New")
                    {
                        ApplicationArea = All;
                        Enabled = hasreq;
                        Style = Attention;
                        StyleExpr = rec."Address 2" <> rec."Address 2_New";


                    }
                    field("Post Code"; Rec."Post Code")
                    {
                        ApplicationArea = All;

                    }
                    field("Post Code_New"; Rec."Post Code_New")
                    {
                        ApplicationArea = All;
                        Enabled = hasreq;
                        Style = Attention;
                        StyleExpr = rec."Post Code" <> rec."Post Code_New";

                    }

                    field(City; Rec.City)
                    {
                        ApplicationArea = All;

                    }
                    field(City_New; Rec.City_New)
                    {
                        ApplicationArea = All;
                        Enabled = hasreq;
                        Style = Attention;
                        StyleExpr = rec.City <> rec.City_New;

                    }
                    field(County; Rec.County)
                    {
                        ApplicationArea = All;

                    }
                    field(County_New; Rec.County_New)
                    {
                        ApplicationArea = All;
                        Enabled = hasreq;
                        Style = Attention;
                        StyleExpr = rec.County <> rec.County_New;


                    }
                    field("Country/Region Code"; Rec."Country/Region Code")
                    {
                        ApplicationArea = All;

                    }
                    field("Country/Region Code_New"; Rec."Country/Region Code_New")
                    {
                        ApplicationArea = All;
                        Enabled = hasreq;
                        Style = Attention;
                        StyleExpr = rec."Country/Region Code" <> rec."Country/Region Code_New";

                    }
                }
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                AboutTitle = 'Manage the site''s invoicing';
                field("Vat Number"; Rec."Vat Number")
                {
                    ApplicationArea = All;

                }
                field("Vat Number_New"; Rec."Vat Number_New")
                {
                    ApplicationArea = All;
                    Enabled = hasreq;
                    Style = Attention;
                    StyleExpr = rec."Vat Number" <> rec."Vat Number_New";


                }
            }

            group("Linked Site")
            {

                part(LinkedSite; FBM_LinkedSite_DD)
                {
                    ApplicationArea = Basic, Suite;
                    SubPageLink = Value = FIELD("Site Code");
                }
            }
            part(History; FBM_SiteHistory_DD)
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "Site Code" = FIELD("Site Code");
            }

        }

    }
    actions
    {
        area(Processing)
        {
            action(Reject)
            {
                ApplicationArea = all;
                image = Reject;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                enabled = hasreq;
                trigger
                OnAction()
                var
                    req: record FBM_CustSiteReq;
                begin
                    req.SetRange(CustSiteCode, rec."Site Code");
                    req.SetRange(Status, req.Status::Received);
                    if req.FindFirst() then begin
                        req.Status := req.Status::Rejected;
                        req.Modify();
                    end;
                    if req.ReqType = req.ReqType::New then
                        rec.Delete();
                end;



            }
            action(Approve)
            {
                ApplicationArea = all;
                image = Approve;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                enabled = hasreq;
                trigger
                OnAction()
                var
                    req: record FBM_CustSiteReq;
                begin
                    req.SetRange(CustSiteCode, rec."Site Code");
                    req.SetRange(Status, req.Status::Received);
                    if req.FindFirst() then begin
                        if req.ReqType = req.ReqType::Edit then begin
                            req.Status := req.Status::Approved;
                            req.Modify();
                            if rec."Site Name" <> rec."Site Name_New" then
                                rec."Site Name" := rec."Site Name_New";
                            if rec."Site Name 2" <> rec."Site Name 2_New" then
                                rec."Site Name 2" := rec."Site Name 2_New";
                            if rec.address <> rec.Address_New then
                                rec.Address := rec.Address_New;
                            if rec."Address 2" <> rec."Address 2_New" then
                                rec."Address 2" := rec."Address 2_New";
                            if rec.City <> rec.City_New then
                                rec.City := rec.City_New;
                            if rec."Post Code" <> rec."Post Code_New" then
                                rec."Post Code" := rec."Post Code_New";
                            if rec."Country/Region Code" <> rec."Country/Region Code_New" then
                                rec."Country/Region Code" := rec."Country/Region Code_New";
                            if rec.County <> rec.County_New then
                                rec.County := rec.County_New;
                            if rec."Vat Number" <> rec."Vat Number_New" then
                                rec."Vat Number" := rec."Vat Number_New";
                            rec.Modify(true);
                            CurrPage.Update();


                        end
                        else begin
                            req.Status := req.Status::Approved;
                            req.Modify();
                            if rec."Site Name" <> rec."Site Name_New" then
                                rec."Site Name" := rec."Site Name_New";
                            if rec."Site Name 2" <> rec."Site Name 2_New" then
                                rec."Site Name 2" := rec."Site Name 2_New";
                            if rec.address <> rec.Address_New then
                                rec.Address := rec.Address_New;
                            if rec."Address 2" <> rec."Address 2_New" then
                                rec."Address 2" := rec."Address 2_New";
                            if rec.City <> rec.City_New then
                                rec.City := rec.City_New;
                            if rec."Post Code" <> rec."Post Code_New" then
                                rec."Post Code" := rec."Post Code_New";
                            if rec."Country/Region Code" <> rec."Country/Region Code_New" then
                                rec."Country/Region Code" := rec."Country/Region Code_New";
                            if rec.County <> rec.County_New then
                                rec.County := rec.County_New;
                            if rec."Vat Number" <> rec."Vat Number_New" then
                                rec."Vat Number" := rec."Vat Number_New";
                            rec.Modify();
                            CurrPage.Update();

                        end;


                    end;
                end;





            }



        }


    }


    trigger
    OnNewRecord(BelowxRec: Boolean)
    var
        maxnum: integer;
    begin
        evaluate(maxnum, copystr(maxcode, 5));
        rec."Site Code" := 'SITE' + PADSTR('', 4 - strlen(FORMAT(MAXNUM + 1)), '0') + FORMAT(MAXNUM + 1);
        rec.ActiveRec := true;
    end;

    trigger
                       OnOpenPage()
    var
        usetup: record "User Setup";
    begin
        usetup.get(UserId);

        Editable := usetup.FBM_EditMaster;


        getmaxsite();

    end;

    trigger
    OnAfterGetRecord()

    begin
        req.setrange(rectype, 'SITE');
        REQ.setfilter(Status, '%1|%2', req.Status::Sent, req.status::Received);
        if REQ.FindFirst() THEN
            if (rec."Site Code" = req.CustSiteCode) then begin
                hasreq := true;
                IF REC."Site Name" <> REQ.Name THEN
                    rec."Site Name_New" := req.Name;
                IF REC."Site Name 2" <> REQ."Name 2b" THEN
                    rec."Site Name 2_New" := req."Name 2b";
                IF REC.Address <> REQ.Address THEN
                    rec.Address_New := req.Address;
                IF REC."Address 2" <> REQ."Address 2b" THEN
                    rec."Address 2_New" := req."Address 2b";
                IF REC.City <> REQ.City THEN
                    rec.City_New := req.City;
                IF REC."Post Code" <> REQ."Post Code" THEN
                    rec."Post Code_New" := req."Post Code";
                IF REC."Country/Region Code" <> REQ."Country/Region Code" THEN
                    rec."Country/Region Code_New" := req."Country/Region Code";
                IF REC."Vat Number" <> REQ."VAT registration No." THEN
                    rec."Vat Number_New" := req."VAT registration No.";

                req.Status := req.Status::Received;
                req.Modify();
                REC.Modify();
            end;
    end;

    var
        sitename: Text;
        siteaddress: Text;
        maxcode: Text;
        cos: record FBM_CustOpSite;
        site: record FBM_Site;
        companies: record Company;
        compinfo: record "Company Information";

        hasreq: Boolean;
        req: record FBM_CustSiteReq;



    procedure getmaxsite()


    begin
        site.SetFilter("Site Code", '<%1', 'SITE9990');
        site.SetCurrentKey("Site Code");
        if site.FindLast() then
            maxcode := site."Site Code";
        //CurrPage.Update();
    end;
}
page 60111 FBM_CustomerChangeReq_DD
{
    Caption = 'Customer Change Request';
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
                field("Name 2"; Rec."Name 2b")
                {
                    ApplicationArea = All;

                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;

                }
                field("Address 2"; Rec."Address 2b")
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
        rec.Rectype := 'CUST';
        rec.Sender := UserId;
        fillfields(ccode);
    end;

    trigger
    OnQueryClosePage(CloseAction: Action): Boolean
    begin
        REQ.Reset();
        req.setfilter(Status, '%1|%2', req.Status::Draft, req.Status::" ");
        req.SetRange(Sender, UserId);

        req.DeleteAll();
        REQ.Reset();
        req.setfilter(Status, '%1|%2', req.Status::Draft, req.Status::" ");
        req.SetRange(Sender, '');
        ;
        req.DeleteAll();

    end;

    trigger
    OnOpenPage()
    begin

        currpage.Editable(pedit);
    end;

    var
        scode: code[20];

        ccode: code[20];
        viscode: Boolean;
        custm: record FBM_Customer;
        cinfo: record "Company Information";
        pedit: Boolean;
        req: record FBM_CustSiteReq;
        nprogr: Integer;

    procedure passpar(custsitecode: code[20]; edit: boolean)
    begin
        pedit := edit;

        ccode := custsitecode;


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
    var

        resp: text;
    begin
        cinfo.get;
        rec.sender := UserId;
        rec.sent := CurrentDateTime;
        rec.status := rec.Status::Sent;
        rec.companyReq := cinfo."Custom System Indicator Text";
        rec.Ori_EntryNo := rec.EntryNo;
        resp := SendReq('POST', Rec);
        if copystr(resp, 1, 3) = '200' then begin

            rec.sender := UserId;
            rec.Status := rec.Status::Sent;
            rec.companyReq := cinfo."Custom System Indicator Text";
            rec.Sent := CurrentDateTime;
            rec.Modify();
        end;

    end;



    local procedure fillfields(cust: code[20])
    var
        cmaster: record FBM_Customer;
    begin
        if rec.reqtype = rec.ReqType::Edit then begin
            viscode := true;
            cmaster.SetRange(ActiveRec, true);
            cmaster.SetRange("No.", cust);
            if cmaster.FindFirst() then begin
                rec.Init();
                REC.ReqType := REC.ReqType::Edit;
                rec.CustSiteCode := cmaster."No.";
                rec.Name := cmaster.Name;
                rec."Name 2b" := cmaster."Name 2";
                rec.Address := cmaster.Address;
                rec."Address 2b" := cmaster."Address 2";
                rec."Post Code" := cmaster."Post Code";
                rec.City := cmaster.City;
                rec.County := cmaster.County;
                rec."Country/Region Code" := cmaster."Country/Region Code";
                rec."VAT registration No." := cmaster."VAT Registration No.";
                rec.FBM_Group := cmaster.FBM_Group;
                rec.FBM_Subgroup := cmaster.FBM_SubGroup;
                rec.Ori_EntryNo := rec.EntryNo;
                rec.Rectype := 'CUST';
                REC.Status := REC.Status::Draft;
                rec.Sender := UserId;
                rec.Insert();
            end;
        end
        else begin
            cmaster.SetRange(ActiveRec, true);
            cmaster.FindFirst();
            while (evaluate(nprogr, cmaster."No.")) and (cmaster.next <> 0) do begin

            end;
            nprogr += 1;
            rec.Init();
            REC.ReqType := REC.ReqType::New;
            rec.Status := rec.Status::Draft;
            rec.Ori_EntryNo := rec.EntryNo;
            rec.Rectype := 'CUST';
            rec.Sender := UserId;
            rec.CustSiteCode := PadStr(' ', 8 - strlen(format(nprogr)), '0') + format(nprogr);
            cmaster.SetRange("No.", PadStr(' ', 8 - strlen(format(nprogr)), '0') + format(nprogr));
            IF NOT cmaster.FindFirst() THEN begin
                Cmaster.init;
                cmaster.ActiveRec := true;
                cmaster.Version := 0;
                cmaster."No." := PadStr(' ', 8 - strlen(format(nprogr)), '0') + format(nprogr);
                cmaster.Insert()
            end;
            viscode := false;
        end;
    end;

    local procedure SendReq(HttpMethod: Text[6]; preq: record FBM_CustSiteReq) ResponseText: Text
    var
        Client: HttpClient;
        HttpRequestMessage: HttpRequestMessage;
        RequestHeaders: HttpHeaders;
        RequestURI: Text;
        Content: HttpContent;
        ContentHeaders: HttpHeaders;
        AuthHeaderValue: Text;
        Username: Text;
        Password: Text;
        Base64Convert: Codeunit "Base64 Convert";

        //RequestMessage: HttpRequestMessage;
        ResponseMessage: HttpResponseMessage;
        ResponseHeaders: HttpHeaders;
        jsonobject: JsonObject;
        JsonText: Text;
        resp: text;
        cont: text;
    begin
        RequestURI := 'https://dynamics-bc.com:2214/BC220/ODataV4/CustSitePostWS';

        // This shows how you can set or change HTTP content headers in your request
        ContentHeaders.Clear();
        Content.GetHeaders(ContentHeaders);
        if ContentHeaders.Contains('Content-Type') then ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/json');

        // This shows how you can set HTTP request headers in your request
        HttpRequestMessage.GetHeaders(RequestHeaders);
        RequestHeaders.Add('Accept', 'application/json');
        //RequestHeaders.Add('Accept-Encoding', 'utf-8');
        RequestHeaders.Add('Connection', 'Keep-alive');


        HttpRequestMessage.SetRequestUri(RequestURI);
        HttpRequestMessage.Method(HttpMethod);
        ;
        Username := 'API.ORION';
        Password := 'DBCAno845.40';
        AuthHeaderValue := 'Basic ' + Base64Convert.ToBase64(Username + ':' + Password);
        //HttpHeadersRequestMessage.Add('Authorization', AuthHeaderValue);
        Client.DefaultRequestHeaders.Add('Authorization', AuthHeaderValue);


        // from here on, the method must deal with calling out to the external service. 
        // see example code snippets below
        jsonobject.Add('ReqType', format(preq.ReqType));
        jsonobject.Add('CustSiteCode', preq.CustSiteCode);
        jsonobject.Add('Name', preq.Name);
        jsonobject.Add('Name_2', preq."Name 2b");
        jsonobject.Add('Address', preq.Address);
        jsonobject.Add('Address_2', preq."Address 2b");
        jsonobject.Add('City', preq.City);
        jsonobject.Add('PostCode', preq."Post Code");
        jsonobject.Add('County', preq.County);
        jsonobject.Add('Country_RegionCode', preq."Country/Region Code");
        jsonobject.Add('VATregistrationNo', preq."VAT registration No.");
        jsonobject.Add('Group', preq.FBM_Group);
        jsonobject.Add('Subgroup', preq.FBM_Subgroup);
        jsonobject.Add('Sender', preq.Sender);
        jsonobject.Add('Sent', format(preq.Sent, 0, 9));
        jsonobject.Add('Status', format(preq.Status));
        jsonobject.add('Ori_EntryNo', preq.Ori_EntryNo);
        jsonobject.Add('Rectype', preq.Rectype);
        jsonobject.Add('companyReq', preq.companyReq);
        // JsonText := format(jsonobject);
        jsonobject.WriteTo(JsonText);



        // Set the content
        Content.WriteFrom(JsonText);
        CONTENT.GetHeaders(ContentHeaders);
        if ContentHeaders.Contains('Content-Type') then ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/json');
        HTTPRequestMessage.Content := Content;
        HTTPRequestMessage.Method := HttpMethod;


        if Client.Send(HTTPRequestMessage, ResponseMessage) then begin
            // ResponseMessage.Content.ReadAs(cont);
            //MESSAGE(cont);
            if ResponseMessage.IsSuccessStatusCode() then begin
                // Handle success
                Message('Request successful. Status Code: %1', ResponseMessage.HttpStatusCode());
            end else begin
                // Handle failure
                Message('Request failed. Status Code: %1', ResponseMessage.HttpStatusCode());
            end;
        end else begin
            // Handle error in sending request
            resp := 'Error sending request.';
            Message(resp);

        end;
        exit(format(ResponseMessage.HttpStatusCode()) + resp);
    end;


}

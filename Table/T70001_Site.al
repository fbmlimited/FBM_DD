table 70001 FBM_Site
{
    DataClassification = ToBeClassified;
    DataPerCompany = false;
    DrillDownPageID = FBM_SiteMasterList_DD;
    LookupPageID = FBM_SiteMaster_DD;
    caption = 'Site';
    DataCaptionFields = "Site Code", "Site Name";

    fields
    {

        field(2; "Site Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            //Editable = false;
            caption = 'Site Code';
        }
        field(3; "Site Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            caption = 'Site Name';
            trigger
            OnValidate()
            begin
                IncVersion();
            end;

        }
        field(103; "Site Name_New"; Text[250])
        {
            DataClassification = ToBeClassified;
            caption = 'Site Name NEW';

        }
        field(4; "Site Name 2"; Text[250])
        {
            caption = 'Site Name 2';
        }
        field(104; "Site Name 2_New"; Text[250])
        {
            caption = 'Site Name 2 NEW';
        }

        field(5; Address; Text[250])
        {
            caption = 'Address';
            DataClassification = ToBeClassified;
            trigger
            OnValidate()
            begin
                IncVersion();
            end;
        }
        field(105; Address_New; Text[250])
        {
            caption = 'Address NEW';
            DataClassification = ToBeClassified;

        }
        field(6; "Address 2"; Text[250])
        {
            caption = 'Address 2';
            DataClassification = ToBeClassified;
            trigger
            OnValidate()
            begin
                IncVersion();
            end;
        }
        field(106; "Address 2_New"; Text[250])
        {
            caption = 'Address 2 NEW';
            DataClassification = ToBeClassified;

        }
        field(7; City; Text[30])
        {
            caption = 'City';
            DataClassification = ToBeClassified;
            TableRelation = IF ("Country/Region Code" = CONST()) "Post Code".City
            ELSE
            IF ("Country/Region Code" = FILTER(<> '')) "Post Code".City WHERE("Country/Region Code" = FIELD("Country/Region Code"));
            ValidateTableRelation = false;
            trigger
            OnValidate()
            begin
                IncVersion();
            end;
        }
        field(107; City_New; Text[30])
        {
            caption = 'City NEW';
            DataClassification = ToBeClassified;
            TableRelation = IF ("Country/Region Code_New" = CONST()) "Post Code".City
            ELSE
            IF ("Country/Region Code_New" = FILTER(<> '')) "Post Code".City WHERE("Country/Region Code" = FIELD("Country/Region Code_New"));
            ValidateTableRelation = false;

        }
        field(8; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            DataClassification = ToBeClassified;
            TableRelation = IF ("Country/Region Code" = CONST()) "Post Code"
            ELSE
            IF ("Country/Region Code" = FILTER(<> '')) "Post Code" WHERE("Country/Region Code" = FIELD("Country/Region Code"));
            ValidateTableRelation = FALSE;
            trigger
            OnValidate()
            begin
                IncVersion();
            end;
        }
        field(108; "Post Code_New"; Code[20])
        {
            Caption = 'Post Code NEW';
            DataClassification = ToBeClassified;
            TableRelation = IF ("Country/Region Code_New" = CONST()) "Post Code"
            ELSE
            IF ("Country/Region Code_New" = FILTER(<> '')) "Post Code" WHERE("Country/Region Code" = FIELD("Country/Region Code_New"));
            ValidateTableRelation = FALSE;

        }
        field(9; "Country/Region Code"; Code[20])
        {
            Caption = 'Country';
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";
            trigger
            OnValidate()
            begin
                IncVersion();
                case rec."Country/Region Code" of
                    'PH':
                        begin
                            rec.company1 := '';
                            rec.company2 := '';
                        end;
                    'ES':
                        rec.company1 := 'EPS';
                    'MX':
                        begin
                            rec.Company2 := 'JYM';
                            rec.Company1 := 'FBM';
                        END;
                    else
                        rec.company1 := 'FBM';
                end;
            end;
        }
        field(109; "Country/Region Code_New"; Code[20])
        {
            caption = 'Country NEW';
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";

        }
        field(10; Indent; Integer)
        {
            //this field was created to be used for indentation of pages making use if this table, if required
            DataClassification = ToBeClassified;
        }

        field(12; "Vat Number"; Code[20])
        {
            caption = 'VAT Reg. No.';
            DataClassification = ToBeClassified;
            trigger
            OnValidate()
            begin
                IncVersion();
            end;
        }
        field(112; "Vat Number_New"; Code[20])
        {
            caption = 'VAT Reg. No. NEW';
            DataClassification = ToBeClassified;

        }
        field(13; "Bank Filter"; text[2048])
        {
            DataClassification = ToBeClassified;
        }

        field(14; "Item Filter"; text[2048])
        {
            DataClassification = ToBeClassified;
        }
        // field(15; "SubGroup"; Text[100])
        // {
        //     Caption = 'SubGroup Customer';
        //     Description = 'ONETECH';
        //     FieldClass = Normal;
        //     TableRelation = FBM_CustGroup.SubGroup where("Group" = field("Group"), IsGroup = const(false));



        // }

        // field(16; "Group"; Text[100])
        // {
        //     Caption = 'Group Customer';
        //     Description = 'ONETECH';
        //     FieldClass = Normal;
        //     TableRelation = FBM_CustGroup.Group where(IsGroup = const(true));

        // }
        // field(17; Status; Enum "FBM_Site Status_DD")
        // {
        //     FieldClass = Normal;



        // }

        field(19; "Category"; Text[50])
        {
            FieldClass = Normal;
        }
        // field(20; "Operator Name"; Text[100])
        // {
        //     FieldClass = Normal;
        // }
        field(21; "Business Name"; Text[100])
        {
            FieldClass = Normal;
        }
        field(22; "Anniversary"; Date)
        {
            FieldClass = Normal;
        }
        field(23; "Cardinal Points"; Text[50])
        {
            FieldClass = Normal;
        }
        field(24; "Area"; Text[50])
        {
            FieldClass = Normal;
        }
        field(25; "Region"; Text[50])
        {
            FieldClass = Normal;
        }
        field(26; "Central Place"; Text[50])
        {
            FieldClass = Normal;
        }
        field(27; "Municipal"; Text[50])
        {
            FieldClass = Normal;
        }
        field(28; "County"; Text[50])
        {
            FieldClass = Normal;
        }
        field(128; "County_New"; Text[50])
        {
            FieldClass = Normal;
        }

        field(29; "Company1"; TEXT[3])
        {
            Caption = 'Company 1';
            trigger
            OnLookup()
            var
                company: record Company;
                compinfo: record "Company Information";
                buffer: record "Name/Value Buffer" temporary;
            begin
                company.FindFirst();
                repeat
                    compinfo.ChangeCompany(company.Name);
                    compinfo.get;
                    if compinfo.FBM_EnSiteWS then
                        buffer.AddNewEntry(compinfo."Custom System Indicator Text", '');
                until company.Next() = 0;
                if page.RunModal(page::"Name/Value Lookup", buffer) = action::LookupOK then
                    Company1 := buffer.Name;

            end;
        }
        field(30; "Company2"; TEXT[3])
        {
            Caption = 'Company 2';
            trigger
            OnLookup()
            var
                company: record Company;
                compinfo: record "Company Information";
                buffer: record "Name/Value Buffer" temporary;
            begin
                company.FindFirst();
                repeat
                    compinfo.ChangeCompany(company.Name);
                    compinfo.get;
                    if compinfo.FBM_EnSiteWS then
                        buffer.AddNewEntry(compinfo."Custom System Indicator Text", '');
                until company.Next() = 0;
                if page.RunModal(page::"Name/Value Lookup", buffer) = action::LookupOK then
                    Company2 := buffer.Name;

            end;
        }

        field(31; "Company3"; TEXT[3])
        {
            Caption = 'Company 3';
            trigger
            OnLookup()
            var
                company: record Company;
                compinfo: record "Company Information";
                buffer: record "Name/Value Buffer" temporary;
            begin
                company.FindFirst();
                repeat
                    compinfo.ChangeCompany(company.Name);
                    compinfo.get;
                    if compinfo.FBM_EnSiteWS then
                        buffer.AddNewEntry(compinfo."Custom System Indicator Text", '');
                until company.Next() = 0;
                if page.RunModal(page::"Name/Value Lookup", buffer) = action::LookupOK then
                    Company3 := buffer.Name;

            end;
        }

        field(1000; "Valid From"; Date)
        {
            Caption = 'Valid from';
        }
        field(1001; "Valid To"; Date)
        {
            Caption = 'Valid to';
        }
        field(1002; "Record Owner"; code[30])
        {
            Caption = 'Record Owner';
        }
        field(1003; "Change Note"; Text[1024])
        {
            Caption = 'Change Note';
        }
        field(1004; Version; Integer)
        {
            Caption = 'Version';
        }
        field(1005; ActiveRec; Boolean)
        {
            Caption = 'Active Record';
        }
        field(70019; FBM_LastAdquiredDate; Date)
        {
            Caption = 'Last Adquired Date';

        }
        field(70152; LastPropagated; date)
        {
            caption = 'Last Propagation date';
        }

    }
    keys
    {
        key(PK; "Site Code", Version, ActiveRec)
        {
            Clustered = true;
        }
        key(k1; Version)
        {

        }
    }
    trigger
    OnRename()
    var
        cos: record FBM_CustOpSite;
        csite: Record FBM_CustomerSite_C;
        comp: record Company;
        cinfo: record "Company Information";

    begin
        // cos.SetRange("Site Code", xrec."Site Code");
        // if cos.findfirst then
        //     cos.Rename(cos.Subsidiary, cos."Customer No.", cos."Operator No.", rec."Site Code");
        comp.FindFirst();
        repeat
            cinfo.ChangeCompany(comp.Name);
            cinfo.get;
            if cinfo.FBM_EnSiteWS then begin
                csite.SetRange(SiteGrCode, xrec."Site Code");
                if csite.FindFirst() then begin
                    csite.SiteGrCode := rec."Site Code";
                    csite.Modify();
                end;
            end;
        until comp.next = 0;

    end;

    trigger
    OnDelete()
    var
        req: record FBM_CustSiteReq;


    begin
        req.setrange(CustSiteCode, xrec."Site Code");
        if req.FindFirst() then
            req.DeleteAll();
        cos.SetRange("Site Code", xrec."Site Code");
        if cos.findfirst then
            cos.Rename(cos.Subsidiary, cos."Customer No.", cos."Operator No.", cos."Site Loc Code", cos.Version);
        comp.FindFirst();
        repeat
            cinfo.ChangeCompany(comp.Name);
            cinfo.get;
            if cinfo.FBM_EnSiteWS then begin
                csite.SetRange(SiteGrCode, xrec."Site Code");
                if csite.FindFirst() then begin
                    csite.SiteGrCode := rec."Site Code";
                    csite.Modify();
                end;
            end;
        until comp.next = 0;


    end;





    var
        //FADimMgt: Codeunit FBM_FADimMgt_DD;
        Text000: Label 'Site Code %1 already exists for Customer %2';
        Text001: Label 'Site code already exists for customer %1!';

        cos: record FBM_CustOpSite;
        csite: Record FBM_CustomerSite_C;
        comp: record Company;
        cinfo: record "Company Information";



    trigger
    OnInsert()
    begin
        rec.ActiveRec := true;

    end;



    procedure CheckUniqueSite(SiteCode: Code[20])
    var
        CustSite: Record FBM_CustomerSite_C;
    begin
        CustSite.Reset();
        CustSite.SetFilter(CustSite."Site Code", "Site Code");
        if CustSite.FindFirst() then Error(Text001, CustSite."Customer No.");
    end;

    procedure IncVersion()
    var
        site: record FBM_Site;
        site2: record FBM_Site;
        maxver: Integer;
        stop: Boolean;
    begin
        commit;
        site.setrange("Site Code", rec."Site Code");

        if site.FindLast() then begin
            maxver := site.Version;
            if site."Valid From" = Today then
                stop := true;
        end;
        if not stop then begin
            site."Valid To" := Today;



            site2.init;
            site2.TransferFields(site, true);
            site.Rename(site."Site Code", site.Version, false);
            site.Modify();
            site2.Insert(false);
            site2.Rename(site2."Site Code", maxver + 1, true);
            site2."Site Name" := rec."Site Name";
            site2.Address := rec.Address;
            site2."Address 2" := rec."Address 2";
            site2.City := rec.City;
            site2."Country/Region Code" := rec."Country/Region Code";
            site2."Post Code" := rec."Post Code";
            site2."Vat Number" := rec."Vat Number";
            site2."Valid From" := Today;
            site2."Valid To" := DMY2Date(31, 12, 2999);
            site2."Record Owner" := UserId;

            site2.Modify();
            site.setrange("Site Name", '');
            site.DeleteAll();
        end
        else begin
            site."Site Name" := rec."Site Name";
            site.Address := rec.Address;
            site."Address 2" := rec."Address 2";
            site.City := rec.City;
            site."Country/Region Code" := rec."Country/Region Code";
            site."Post Code" := rec."Post Code";
            site."Vat Number" := rec."Vat Number";
            site."Record Owner" := UserId;
        end;



    end;


}

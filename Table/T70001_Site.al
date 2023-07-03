table 70001 FBM_Site
{
    DataClassification = ToBeClassified;
    DataPerCompany = false;
    DrillDownPageID = FBM_SiteMasterList_DD;
    LookupPageID = FBM_SiteMaster_DD;

    fields
    {

        field(2; "Site Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Site Name"; Text[250])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
            begin
                // FADimMgt.ModifySiteDim(xRec, Rec);
            end;
        }
        field(4; "Site Name 2"; Text[250])
        {

        }

        field(5; Address; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Address 2"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; City; Text[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = IF ("Country/Region Code" = CONST()) "Post Code".City
            ELSE
            IF ("Country/Region Code" = FILTER(<> '')) "Post Code".City WHERE("Country/Region Code" = FIELD("Country/Region Code"));
            ValidateTableRelation = false;
        }
        field(8; "Post Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = IF ("Country/Region Code" = CONST()) "Post Code"
            ELSE
            IF ("Country/Region Code" = FILTER(<> '')) "Post Code" WHERE("Country/Region Code" = FIELD("Country/Region Code"));
            ValidateTableRelation = FALSE;
        }
        field(9; "Country/Region Code"; Code[20])
        {
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
        field(15; "SubGroup"; Text[100])
        {
            Caption = 'SubGroup Customer';
            Description = 'ONETECH';
            FieldClass = Normal;
            TableRelation = FBM_CustGroup.SubGroup where("Group" = field("Group"), IsGroup = const(false));



        }

        field(16; "Group"; Text[100])
        {
            Caption = 'Group Customer';
            Description = 'ONETECH';
            FieldClass = Normal;
            TableRelation = FBM_CustGroup.Group where(IsGroup = const(true));

        }
        field(17; Status; Text[50])
        {
            FieldClass = Normal;
        }
        field(18; "Current Status"; Text[50])
        {
            FieldClass = Normal;
        }
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
        // field(29; "Contract Code2"; Code[4])
        // {

        //     DataClassification = ToBeClassified;

        //     trigger OnValidate()
        //     begin
        //         if "Contract Code2" <> '' then FADimMgt.ContractDimension(Rec);
        //     end;
        // }
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

    }
    keys
    {
        key(PK; "Site Code")
        {
            Clustered = true;
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
        cos.SetRange("Site Code", xrec."Site Code");
        if cos.findfirst then
            cos.Rename(cos.Subsidiary, cos."Customer No.", cos."Operator No.", rec."Site Code");
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









    procedure CheckUniqueSite(SiteCode: Code[20])
    var
        CustSite: Record FBM_CustomerSite_C;
    begin
        CustSite.Reset();
        CustSite.SetFilter(CustSite."Site Code", "Site Code");
        if CustSite.FindFirst() then Error(Text001, CustSite."Customer No.");
    end;


}

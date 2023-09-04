table 70006 FBM_CustomerSite_C
{
    DataClassification = ToBeClassified;
    LookupPageId = FBM_CustSiteLookup_DD;

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
            Caption = 'Customer Code';
        }
        field(2; "SiteGrCode"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = FBM_Site;
            Caption = 'Site Group Code';

        }
        field(3; "Site Code"; Code[20])
        {
            Caption = 'Site Loc. Code';
            DataClassification = ToBeClassified;
        }
        field(4; "Site Name_FF"; Text[250])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(FBM_Site."Site Name" where("Site Code" = field(SiteGrCode), ActiveRec = const(true)));
            Caption = 'Site Name';
            Editable = false;
        }
        field(5; Address_FF; Text[250])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(FBM_Site.Address where("Site Code" = field(SiteGrCode), ActiveRec = const(true)));
            Caption = 'Address';
            Editable = false;
        }
        field(6; "Address 2_FF"; Text[250])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(FBM_Site."Address 2" where("Site Code" = field(SiteGrCode), ActiveRec = const(true)));
            Caption = 'Address 2';
            Editable = false;
        }
        field(7; City_FF; Text[30])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(FBM_Site.City where("Site Code" = field(SiteGrCode), ActiveRec = const(true)));
            Caption = 'City';
            Editable = false;
        }
        field(8; "Post Code_FF"; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(FBM_Site."Post Code" where("Site Code" = field(SiteGrCode), ActiveRec = const(true)));
            Caption = 'Post Code';
            Editable = false;
        }
        field(9; "Country/Region Code_FF"; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(FBM_Site."Country/Region Code" where("Site Code" = field(SiteGrCode), ActiveRec = const(true)));
            Caption = 'Country';
            Editable = false;
        }
        field(10; County_FF; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(FBM_Site.County where("Site Code" = field(SiteGrCode), ActiveRec = const(true)));
            Caption = 'County';
            Editable = false;
        }
        field(15; Status; enum "FBM_Site Status_DD")
        {

            Caption = 'Status';
            Editable = true;
        }
        field(11; "Contract Code"; Code[4])
        {
            Caption = 'Contract Code (Bingo)';
            DataClassification = ToBeClassified;


        }
        field(12; "Vat Number"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13; Contact; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(14; "Contract Code2"; Code[4])
        {
            Caption = 'Contract Code (Spin)';
            DataClassification = ToBeClassified;


        }

    }

    keys
    {
        key(PK; "Customer No.", "Site Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(dropdown; "Site Code", SiteGrCode, "Site Name_FF")
        {

        }
    }

    trigger
    OnModify()
    begin
        UpdateCustOpSite(rec);

    end;

    trigger

    OnDelete()
    var
        cos: record FBM_CustOpSite;
    begin
        cos.SetRange("Cust Loc Code", rec."Customer No.");
        cos.SetRange("Site Loc Code", rec."Site Code");
        if cos.FindFirst() then
            cos.Delete();


    end;


    var

        Text000: Label 'Site Code %1 already exists for Customer %2';
        Text001: Label 'Site code already exists for customer %1!';
        Text002: Label 'You cannot delete this site - it has been used in posted transactions!';
        Text003: Label 'You cannot delete this site - it is being used in %1!';









    procedure CheckUniqueSite(SiteCode: Code[20])
    var
        CustSite: Record FBM_CustomerSite_C;
    begin
        // CustSite.Reset();
        // CustSite.SetFilter(CustSite."Site Code", "Site Code");
        // if CustSite.FindFirst() then Error(Text001, CustSite."Customer No.");
    end;

    procedure UpdateCustOpSite(CustSite: Record FBM_CustomerSite_C)
    var
        COS: Record FBM_CustOpSite;
        CompanyInfo: record "Company Information";
        FASetup: Record "FA Setup";
        customer: record Customer;
        country: record "Country/Region";
    begin
        FASetup.Get();
        CompanyInfo.Get();
        //if FASetup."Enable FA Site Tracking" then begin
        if CompanyInfo.FBM_CustIsOp then begin
            //check if record already exists
            customer.get(CustSite."Customer No.");
            if country.get(customer."Country/Region Code") then
                COS.SetRange(Subsidiary, CompanyInfo.FBM_FALessee + ' ' + country.FBM_Country3);
            cos.SetRange("Customer No.", customer.FBM_GrCode);
            cos.SetRange("Operator No.", customer.FBM_GrCode);
            cos.SetRange("Site Code", CustSite.SiteGrCode);
            if not cos.FindFirst() then begin
                COS.Init();
                COS."Customer No." := customer.FBM_GrCode;
                COS."Operator No." := customer.FBM_GrCode;
                COS."Site Code" := CustSite.SiteGrCode;
                cos."Cust Loc Code" := customer."No.";
                cos.IsActive := true;
                cos.ActiveRec := true;
                cos."Op Loc Code" := customer."No.";
                cos."Record Owner" := UserId;
                cos."Site Loc Code" := CustSite."Site Code";
                cos."Valid From" := Today;
                cos."Valid To" := DMY2Date(31, 12, 2999);
                CompanyInfo.testfield(FBM_FALessee);
                if country.get(customer."Country/Region Code") then begin

                    country.testfield(FBM_Country3);
                    cos.Subsidiary := CompanyInfo.FBM_FALessee + ' ' + country.FBM_Country3;
                end;
                COS.Insert();

            end
            else begin
                COS."Customer No." := customer.FBM_GrCode;
                COS."Operator No." := customer.FBM_GrCode;
                COS."Site Code" := CustSite.SiteGrCode;
                cos."Cust Loc Code" := customer."No.";
                cos.IsActive := true;
                cos.ActiveRec := true;
                cos."Op Loc Code" := customer."No.";
                cos."Record Owner" := UserId;
                cos."Site Loc Code" := CustSite."Site Code";
                cos."Valid From" := Today;
                cos."Valid To" := DMY2Date(31, 12, 2999);
                CompanyInfo.testfield(FBM_FALessee);
                if country.get(customer."Country/Region Code") then begin

                    country.testfield(FBM_Country3);
                    cos.rename(CompanyInfo.FBM_FALessee + ' ' + country.FBM_Country3, cos."Customer No.", cos."Operator No.", cos."Site Code");
                end;
                COS.Modify();
            end;

        end;
        //end;


    end;
    //end;
}

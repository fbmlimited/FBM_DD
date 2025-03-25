table 70018 FBM_CustomerSite_Ctmp
{
    DataClassification = ToBeClassified;
    LookupPageId = FBM_CustSiteLookup_DD;
    DrillDownPageId = FBM_SiteList_DD;

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
            Caption = 'Customer Code';
            ValidateTableRelation = false;
        }
        field(2; "SiteGrCode"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = FBM_Site;
            Caption = 'Site Group Code';
            ValidateTableRelation = false;


        }
        field(3; "Site Code"; Code[20])
        {
            Caption = 'Site  Loc. Code';
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
            InitValue = 0;
            trigger
            OnValidate()
            var
                csite: record FBM_CustomerSite_C;
                cos: record FBM_CustOpSite;
            begin

                IF (REC.status = rec.status::"HOLD OPERATION") or (rec.status = rec.status::OPERATIONAL) then begin
                    csite.SetRange(SiteGrCode, rec.SiteGrCode);
                    csite.setfilter(status, '%1|%2', rec.Status::"HOLD OPERATION", rec.Status::OPERATIONAL);
                    CSITE.SetFilter("Site Code", '<>%1', REC."Site Code");
                    csite.SetRange(ActiveRec, true);
                    if csite.FindFirst() then
                        error('Found an existing active record for this site with customer %1', csite."Customer No.");
                end;
                cos.Reset();
                cos.SetRange("Site Loc Code", rec."Site Code");
                cos.SetRange("Cust Loc Code", rec."Customer No.");
                if cos.FindFirst() then begin
                    if (rec.Status <> rec.status::OPERATIONAL) and (rec.Status <> rec.status::"HOLD OPERATION") then
                        cos.IsActive := false else
                        cos.IsActive := true;
                    cos.Modify()
                end
;
            end;
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
        field(16; Typerec; enum FBM_Typerec_DD)
        {
            Caption = 'Record Type';
            DataClassification = ToBeClassified;
        }
        field(17; TypeSite; enum FBM_TypeSite_DD)
        {
            Caption = 'Site Type';
            DataClassification = ToBeClassified;
        }
        field(70000; "Valid From"; Date)
        {
            Caption = 'Valid from';
        }
        field(70001; "Valid To"; Date)
        {
            Caption = 'Valid to';
        }
        field(70002; "Record Owner"; code[30])
        {
            Caption = 'Record Owner';
        }
        field(70003; "Change Note"; Text[1024])
        {
            Caption = 'Change Note';
        }

        field(70005; ActiveRec; Boolean)
        {
            Caption = 'Active Record';
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
        fieldgroup(DropDown; "Site Code", SiteGrCode, "Site Name_FF")
        {

        }
        fieldgroup(brick; "Site Code", SiteGrCode, "Site Name_FF")
        {

        }
    }



    trigger
    OnInsert()
    begin

        rec.ActiveRec := true;



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
        if rec.ActiveRec then
            if CompanyInfo.FBM_CustIsOp then begin
                customer.get(CustSite."Customer No.");
                if country.get(customer."Country/Region Code") then
                    COS.SetRange(Subsidiary, CompanyInfo.FBM_FALessee + ' ' + country.FBM_Country3);
                cos.SetRange("Customer No.", customer.FBM_GrCode);
                cos.SetRange("Site Code", '');
                if cos.findfirst then cos.DeleteAll();
                cos.Reset();

                customer.get(CustSite."Customer No.");
                if country.get(customer."Country/Region Code") then
                    COS.SetRange(Subsidiary, CompanyInfo.FBM_FALessee + ' ' + country.FBM_Country3);
                cos.SetRange("Customer No.", customer.FBM_GrCode);
                cos.SetRange("Operator No.", customer.FBM_GrCode);
                cos.SetRange("Site Code", CustSite.SiteGrCode);
                // if (CustSite.Status = CustSite.Status::OPERATIONAL) or (CustSite.Status = CustSite.Status::"HOLD OPERATION") then
                //     cos.SetRange(ActiveRec, true)
                // else
                //     cos.SetRange(ActiveRec, false);
                //cos.SetRange(Status, xrec.Status);
                if not cos.FindFirst() then begin
                    COS.Init();
                    COS."Customer No." := customer.FBM_GrCode;
                    COS."Operator No." := customer.FBM_GrCode;
                    COS."Site Code" := CustSite.SiteGrCode;
                    cos."Cust Loc Code" := customer."No.";
                    cos.IsActive := true;
                    if (CustSite.Status = CustSite.Status::OPERATIONAL) or (CustSite.Status = CustSite.Status::"HOLD OPERATION") then
                        cos.IsActive := true
                    else
                        cos.IsActive := false;
                    cos."Op Loc Code" := customer."No.";
                    cos."Record Owner" := UserId;
                    cos."Site Loc Code" := CustSite."Site Code";
                    cos.Status := Status;
                    cos."Valid From" := Today;
                    cos."Valid To" := DMY2Date(31, 12, 2999);
                    CompanyInfo.testfield(FBM_FALessee);
                    // if country.get(customer."Country/Region Code") then begin

                    //     country.testfield(FBM_Country3);
                    cos.Subsidiary := CompanyInfo.FBM_FALessee + ' ' + country.FBM_Country3;

                    // end;
                    COS.Insert();

                end
                else begin
                    COS."Customer No." := customer.FBM_GrCode;
                    COS."Operator No." := customer.FBM_GrCode;
                    COS."Site Code" := CustSite.SiteGrCode;
                    //cos."Cust Loc Code" := customer."No.";


                    if (CustSite.Status = CustSite.Status::OPERATIONAL) or (CustSite.Status = CustSite.Status::"HOLD OPERATION") then
                        cos.IsActive := true
                    else
                        cos.IsActive := false;
                    //cos."Op Loc Code" := customer."No.";
                    cos."Record Owner" := UserId;
                    // cos."Site Loc Code" := CustSite."Site Code";
                    cos.Status := CustSite.Status;
                    //cos."Valid From" := Today;
                    //cos."Valid To" := DMY2Date(31, 12, 2999);
                    CompanyInfo.testfield(FBM_FALessee);
                    if country.get(customer."Country/Region Code") then begin

                        country.testfield(FBM_Country3);
                        cos.rename(CompanyInfo.FBM_FALessee + ' ' + country.FBM_Country3, cos."Cust Loc Code", cos."Op Loc Code", cos."Site Loc Code", cos.Version);
                    end;
                    COS.Modify();
                end;

            end;
        //end;


    end;
    //end;
    procedure GetLocationsIncludingUnspecifiedLocation(IncludeOnlyUnspecifiedLocation: Boolean; ExcludeInTransitLocations: Boolean)
    var
        Location: Record FBM_CustomerSite_C;
    begin




        if Location.FindSet() then
            repeat
                Init();
                Copy(Location);
                Insert();
            until Location.Next() = 0;
    end;

    procedure IncVersion()
    var
        csite: record FBM_CustomerSite_C;
        csite2: record FBM_CustomerSite_C;
        maxver: Integer;
        stop: Boolean;
    begin
        commit;
        csite.setrange("Site Code", rec."Site Code");
        csite.SetRange("Customer No.", rec."Customer No.");

        if csite.FindLast() then begin
            maxver := csite.Version;
            if csite."Valid From" = Today then
                stop := true;
        end;
        if not stop then begin
            csite."Valid To" := Today;



            csite2.init;
            csite2.TransferFields(csite, true);
            csite.Rename(csite."Customer No.", csite."Site Code", csite.Version, false);
            csite.Modify();
            csite2.Insert(false);
            csite2.Rename(csite2."Customer No.", csite2."Site Code", maxver + 1, true);
            csite2.SiteGrCode := rec.SiteGrCode;
            csite2.Status := rec.Status;
            csite2."Contract Code" := rec."Contract Code";
            csite2."Contract Code" := rec."Contract Code2";
            csite2."Vat Number" := rec."Vat Number";
            csite2.Contact := rec.Contact;

            csite2."valid From" := Today;
            csite2."Valid To" := DMY2Date(31, 12, 2999);
            csite2."Record Owner" := UserId;

            csite2.Modify();
            csite.setrange(SiteGrCode, '');
            csite.DeleteAll();
        end;



    end;

}

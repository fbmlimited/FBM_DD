table 70006 FBM_CustomerSite_C
{
    DataClassification = ToBeClassified;

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
            CalcFormula = lookup(FBM_Site."Site Name" where("Site Code" = field("Site Code"), ActiveRec = const(true)));
            Caption = 'Site Name';
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
        }
        field(8; "Post Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = IF ("Country/Region Code" = CONST()) "Post Code"
            ELSE
            IF ("Country/Region Code" = FILTER(<> '')) "Post Code" WHERE("Country/Region Code" = FIELD("Country/Region Code"));
        }
        field(9; "Country/Region Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";
        }
        field(10; County; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
        }
        field(11; "Contract Code"; Code[4])
        {
            Caption = 'Contract Code (Bingo)';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Contract Code" <> '' then FADimMgt.ContractDimension(Rec);
            end;
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

            trigger OnValidate()
            begin
                if "Contract Code2" <> '' then FADimMgt.ContractDimension(Rec);
            end;
        }

    }
    keys
    {
        key(PK; "Customer No.", "Site Code")
        {
            Clustered = true;
        }
    }



    var
        FADimMgt: Codeunit FBM_FADimMgt_DD;
        Text000: Label 'Site Code %1 already exists for Customer %2';
        Text001: Label 'Site code already exists for customer %1!';
        Text002: Label 'You cannot delete this site - it has been used in posted transactions!';
        Text003: Label 'You cannot delete this site - it is being used in %1!';

    trigger OnInsert()
    begin
        //check for unique site code
        // CheckUniqueSite(Rec."Site Code");
        // FADimMgt.CreateSiteDim(Rec);
        // UpdateCustOpSite(Rec);
    end;

    trigger OnModify()
    begin
        // FADimMgt.UpdateSiteDim(Rec);
    end;

    trigger OnDelete()
    var
        DimensionSetEntry: Record "Dimension Set Entry";
        DimensionValue: Record "Dimension Value";
        FASetup: Record "FA Setup";
        SalesHeader: Record "Sales Header";
    begin
        // DimensionSetEntry.Reset();
        // DimensionValue.Reset();
        // SalesHeader.Reset();
        // SalesHeader.Reset();
        // SalesHeader.SetFilter(Site, Rec."Site Code");
        // if SalesHeader.FindFirst() then Error(Text003, SalesHeader."No.");
        // DimensionSetEntry.SetFilter(DimensionSetEntry."Dimension Code", FASetup."Site Dimension");
        // DimensionSetEntry.SetFilter(DimensionSetEntry."Dimension Value Code", Rec."Site Code");
        // if DimensionSetEntry.FindFirst() then error(Text002);
        // if DimensionValue.Get(FASetup."Site Dimension", Rec."Site Code") then begin
        //     DimensionValue.Validate(Blocked, true);
        //     DimensionValue.Modify();
        // end;
    end;

    trigger OnRename()
    begin
        // FADimMgt.RenameSiteDim(xRec, Rec);
    end;

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
    begin
        // FASetup.Get();
        // CompanyInfo.Get();
        // if FASetup."Enable FA Site Tracking" then begin
        //     if CompanyInfo."Customer Is Operator" then begin
        //         //check if record already exists
        //         if not COS.get(CustSite."Customer No.", CustSite."Customer No.", CustSite."Site Code") then begin
        //             COS.Init();
        //             COS."Customer No." := CustSite."Customer No.";
        //             COS."Operator No." := CustSite."Customer No.";
        //             COS."Site Code" := CustSite."Site Code";
        //             COS.Insert();
        //         end;
        //     end;
        // end;

        //end;
        //end;
    end;
    //end;
}

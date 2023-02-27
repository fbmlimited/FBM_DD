table 70001 FBM_Site
{
    DataClassification = ToBeClassified;
    DataPerCompany = false;

    fields
    {

        field(2; "Site Code"; Code[20])
        {
            DataClassification = ToBeClassified;
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
        field(4; Operator; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value"."Code";
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
        field(10; Indent; Integer)
        {
            //this field was created to be used for indentation of pages making use if this table, if required
            DataClassification = ToBeClassified;
        }
        //DevOps #619 -- begin
        field(11; "Contract Code"; Code[4])
        {
            //this field was created to be used for indentation of pages making use if this table, if required
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // if "Contract Code" <> '' then FADimMgt.ContractDimension(Rec);
            end;
        }
    }
    keys
    {
        key(PK; "Site Code")
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
        CheckUniqueSite(Rec."Site Code");
        FADimMgt.CreateSiteDim(Rec);
        //UpdateCustOpSite(Rec);
    end;

    trigger OnModify()
    begin
        FADimMgt.UpdateSiteDim(Rec);
    end;

    trigger OnDelete()
    var
        DimensionSetEntry: Record "Dimension Set Entry";
        DimensionValue: Record "Dimension Value";
        FASetup: Record "FA Setup";
        SalesHeader: Record "Sales Header";
    begin
        DimensionSetEntry.Reset();
        DimensionValue.Reset();
        SalesHeader.Reset();
        SalesHeader.Reset();
        SalesHeader.SetFilter(Site, Rec."Site Code");
        if SalesHeader.FindFirst() then Error(Text003, SalesHeader."No.");
        DimensionSetEntry.SetFilter(DimensionSetEntry."Dimension Code", FASetup."Site Dimension");
        DimensionSetEntry.SetFilter(DimensionSetEntry."Dimension Value Code", Rec."Site Code");
        if DimensionSetEntry.FindFirst() then error(Text002);
        if DimensionValue.Get(FASetup."Site Dimension", Rec."Site Code") then begin
            DimensionValue.Validate(Blocked, true);
            DimensionValue.Modify();
        end;
    end;

    trigger OnRename()
    begin
        FADimMgt.RenameSiteDim(xRec, Rec);
    end;

    procedure CheckUniqueSite(SiteCode: Code[20])
    var
        CustSite: Record "Customer-Site";
    begin
        CustSite.Reset();
        CustSite.SetFilter(CustSite."Site Code", "Site Code");
        if CustSite.FindFirst() then Error(Text001, CustSite."Customer No.");
    end;
    // procedure UpdateCustOpSite(CustSite: Record FBM_Site)var COS: Record "Cust-Op-Site";
    // CompanyInfo: record "Company Information";
    // FASetup: Record "FA Setup";
    // begin
    //   FASetup.Get();
    //   CompanyInfo.Get();
    //   if FASetup."Enable FA Site Tracking" then begin
    //     if CompanyInfo."Customer Is Operator" then begin
    //       //check if record already exists
    //       if not COS.get(CustSite."Customer No.", CustSite."Customer No.", CustSite."Site Code")then begin
    //         COS.Init();
    //         COS."Customer No.":=CustSite."Customer No.";
    //         COS."Operator No.":=CustSite."Customer No.";
    //         COS."Site Code":=CustSite."Site Code";
    //         COS.Insert();
    //       end;
    //     end;
    //   end;
    // end;

}

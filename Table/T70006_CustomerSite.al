table 70006 FBM_CustomerSite_C
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(2; "SiteGrCode"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = FBM_Site;

        }
        field(3; "Site Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Contract Code"; Code[4])
        {
            //this field was created to be used for indentation of pages making use if this table, if required
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //if "Contract Code" <> '' then FADimMgt.ContractDimension(Rec);
            end;
        }
        field(12; Contact; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(14; "Contract Code2"; Code[4])
        {
            //this field was created to be used for indentation of pages making use if this table, if required
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //if "Contract Code2" <> '' then FADimMgt.ContractDimension(Rec);
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
        FADimMgt: Codeunit FixedAssetDimMgt;
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
        CustSite: Record "Customer-Site";
    begin
        // CustSite.Reset();
        // CustSite.SetFilter(CustSite."Site Code", "Site Code");
        // if CustSite.FindFirst() then Error(Text001, CustSite."Customer No.");
    end;

    procedure UpdateCustOpSite(CustSite: Record "Customer-Site")
    var
        COS: Record "Cust-Op-Site";
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

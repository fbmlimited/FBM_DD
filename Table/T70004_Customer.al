table 70004 FBM_Customer
{
    DataPerCompany = false;
    Caption = 'Group Customer';
    DataCaptionFields = "No.", Name;
    //DrillDownPageID = ;
    //LookupPageID = "Customer Lookup";
    Permissions = TableData "Cust. Ledger Entry" = r,
                  TableData Job = r,
                  TableData "VAT Registration Log" = rd,
                  TableData "Service Header" = r,
                  TableData "Service Ledger Entry" = r,
                  TableData "Service Item" = rm,
                  TableData "Service Contract Header" = rm,
                  TableData "Price List Header" = rd,
                  TableData "Price List Line" = rd,
#if not CLEAN19
                  TableData "Sales Price" = rd,
                  TableData "Sales Line Discount" = rd,
#endif
                  TableData "Sales Price Access" = rd,
                  TableData "Sales Discount Access" = rd,
                  tabledata "Customer Templ." = rm;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            begin
                TestNoSeries();
                if "Invoice Disc. Code" = '' then
                    "Invoice Disc. Code" := "No.";
            end;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';

            trigger OnValidate()
            begin
                if ("Search Name" = UpperCase(xRec.Name)) or ("Search Name" = '') then
                    "Search Name" := Name;
            end;
        }
        field(3; "Search Name"; Code[100])
        {
            Caption = 'Search Name';
        }
        field(4; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
        }
        field(5; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(6; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(7; City; Text[30])
        {
            Caption = 'City';
            TableRelation = IF ("Country/Region Code" = CONST('')) "Post Code".City
            ELSE
            IF ("Country/Region Code" = FILTER(<> '')) "Post Code".City WHERE("Country/Region Code" = FIELD("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                OnBeforeLookupCity(Rec, PostCode);

                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");

                OnAfterLookupCity(Rec, PostCode);
            end;

            trigger OnValidate()
            begin
                OnBeforeValidateCity(Rec, PostCode);

                PostCode.ValidateCity(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);

                OnAfterValidateCity(Rec, xRec);
            end;
        }
        field(8; Contact; Text[100])
        {
            Caption = 'Contact';

            trigger OnLookup()
            begin
                LookupContactList;
            end;


        }
        field(9; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;


        }
        field(10; "Telex No."; Text[20])
        {
            Caption = 'Telex No.';
        }
        field(11; "Document Sending Profile"; Code[20])
        {
            Caption = 'Document Sending Profile';
            TableRelation = "Document Sending Profile".Code;
        }
        field(12; "Ship-to Code"; Code[10])
        {
            Caption = 'Ship-to Code';
            TableRelation = "Ship-to Address".Code WHERE("Customer No." = FIELD("No."));
        }
        field(14; "Our Account No."; Text[20])
        {
            Caption = 'Our Account No.';
        }
        field(15; "Territory Code"; Code[10])
        {
            Caption = 'Territory Code';
            TableRelation = Territory;
        }
        field(16; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
            end;
        }
        field(17; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
            end;
        }
        field(18; "Chain Name"; Code[10])
        {
            Caption = 'Chain Name';
        }
        field(19; "Budgeted Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Budgeted Amount';
        }
        field(20; "Credit Limit (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Credit Limit (LCY)';
        }
        field(21; "Customer Posting Group"; Code[20])
        {
            Caption = 'Customer Posting Group';
            TableRelation = "Customer Posting Group";
        }
        field(22; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;

            trigger OnValidate()
            begin
                UpdateCurrencyId;
            end;
        }
        field(23; "Customer Price Group"; Code[10])
        {
            Caption = 'Customer Price Group';
            TableRelation = "Customer Price Group";
        }
        field(24; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            TableRelation = Language;
        }
        field(25; "Registration Number"; Text[50])
        {
            Caption = 'Registration No.';


        }
        field(26; "Statistics Group"; Integer)
        {
            Caption = 'Statistics Group';
        }
        field(27; "Payment Terms Code"; Code[10])
        {
            Caption = 'Payment Terms Code';
            TableRelation = "Payment Terms";

            trigger OnValidate()
            begin
                UpdatePaymentTermsId;
            end;
        }
        field(28; "Fin. Charge Terms Code"; Code[10])
        {
            Caption = 'Fin. Charge Terms Code';
            TableRelation = "Finance Charge Terms";
        }
        field(29; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";

            trigger OnValidate()
            begin
                ValidateSalesPersonCode;
            end;
        }
        field(30; "Shipment Method Code"; Code[10])
        {
            Caption = 'Shipment Method Code';
            TableRelation = "Shipment Method";

            trigger OnValidate()
            begin
                UpdateShipmentMethodId;
            end;
        }
        field(31; "Shipping Agent Code"; Code[10])
        {
            AccessByPermission = TableData "Shipping Agent Services" = R;
            Caption = 'Shipping Agent Code';
            TableRelation = "Shipping Agent";

            trigger OnValidate()
            begin
                if "Shipping Agent Code" <> xRec."Shipping Agent Code" then
                    Validate("Shipping Agent Service Code", '');
            end;
        }
        field(32; "Place of Export"; Code[20])
        {
            Caption = 'Place of Export';
        }
        field(33; "Invoice Disc. Code"; Code[20])
        {
            Caption = 'Invoice Disc. Code';
            TableRelation = Customer;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(34; "Customer Disc. Group"; Code[20])
        {
            Caption = 'Customer Disc. Group';
            TableRelation = "Customer Discount Group";
        }
        field(35; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                PostCode.CheckClearPostCodeCityCounty(City, "Post Code", County, "Country/Region Code", xRec."Country/Region Code");

                if "Country/Region Code" <> xRec."Country/Region Code" then
                    VATRegistrationValidation();
            end;
        }
        field(36; "Collection Method"; Code[20])
        {
            Caption = 'Collection Method';
        }
        field(37; Amount; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Amount';
        }

        field(39; Blocked; Enum "Customer Blocked")
        {
            Caption = 'Blocked';

            trigger OnValidate()
            begin
                if (Blocked <> Blocked::All) and "Privacy Blocked" then
                    if GuiAllowed then
                        if Confirm(ConfirmBlockedPrivacyBlockedQst) then
                            "Privacy Blocked" := false
                        else
                            Error('')
                    else
                        Error(CanNotChangeBlockedDueToPrivacyBlockedErr);
            end;
        }
        field(40; "Invoice Copies"; Integer)
        {
            Caption = 'Invoice Copies';
        }
        field(41; "Last Statement No."; Integer)
        {
            Caption = 'Last Statement No.';
        }
        field(42; "Print Statements"; Boolean)
        {
            Caption = 'Print Statements';
        }
        field(45; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            TableRelation = Customer;
        }
        field(46; Priority; Integer)
        {
            Caption = 'Priority';
        }
        field(47; "Payment Method Code"; Code[10])
        {
            Caption = 'Payment Method Code';
            TableRelation = "Payment Method";

            trigger OnValidate()
            begin
                UpdatePaymentMethodId;

                if "Payment Method Code" = '' then
                    exit;

                UpdateDirectDebitPmtTermsCode();
            end;
        }
        field(53; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
            Editable = false;
        }
        field(54; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(55; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(56; "Global Dimension 1 Filter"; Code[20])
        {
            CaptionClass = '1,3,1';
            Caption = 'Global Dimension 1 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(57; "Global Dimension 2 Filter"; Code[20])
        {
            CaptionClass = '1,3,2';
            Caption = 'Global Dimension 2 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }


        field(80; "Application Method"; Enum "Application Method")
        {
            Caption = 'Application Method';
        }
        field(82; "Prices Including VAT"; Boolean)
        {
            Caption = 'Prices Including VAT';
        }
        field(83; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location WHERE("Use As In-Transit" = CONST(false));
        }
        field(84; "Fax No."; Text[30])
        {
            Caption = 'Fax No.';
        }
        field(85; "Telex Answer Back"; Text[20])
        {
            Caption = 'Telex Answer Back';
        }
        field(86; "VAT Registration No."; Text[20])
        {
            Caption = 'VAT Registration No.';

            trigger OnValidate()
            var
                IsHandled: Boolean;
            begin
                IsHandled := false;
                OnBeforeValidateVATRegistrationNo(Rec, xRec, CurrFieldNo, IsHandled);
                if IsHandled then
                    exit;

                "VAT Registration No." := UpperCase("VAT Registration No.");
                if "VAT Registration No." <> xRec."VAT Registration No." then
                    VATRegistrationValidation();
            end;
        }
        field(87; "Combine Shipments"; Boolean)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            Caption = 'Combine Shipments';
        }
        field(88; "Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";

            trigger OnValidate()
            begin
                if xRec."Gen. Bus. Posting Group" <> "Gen. Bus. Posting Group" then
                    if GenBusPostingGrp.ValidateVatBusPostingGroup(GenBusPostingGrp, "Gen. Bus. Posting Group") then
                        Validate("VAT Bus. Posting Group", GenBusPostingGrp."Def. VAT Bus. Posting Group");
            end;
        }
        field(89; Picture; BLOB)
        {
            Caption = 'Picture';
            ObsoleteReason = 'Replaced by Image field';
            ObsoleteState = Removed;
            SubType = Bitmap;
            ObsoleteTag = '19.0';
        }
        field(90; GLN; Code[13])
        {
            Caption = 'GLN';
            Numeric = true;

            trigger OnValidate()
            var
                GLNCalculator: Codeunit "GLN Calculator";
            begin
                if GLN <> '' then
                    GLNCalculator.AssertValidCheckDigit13(GLN);
            end;
        }
        field(91; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = IF ("Country/Region Code" = CONST('')) "Post Code"
            ELSE
            IF ("Country/Region Code" = FILTER(<> '')) "Post Code" WHERE("Country/Region Code" = FIELD("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                OnBeforeLookupPostCode(Rec, PostCode);

                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");

                OnAfterLookupPostCode(Rec, PostCode);
            end;

            trigger OnValidate()
            begin
                OnBeforeValidatePostCode(Rec, PostCode);

                PostCode.ValidatePostCode(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);

                OnAfterValidatePostCode(Rec, xRec);
            end;
        }
        field(92; County; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
        }
        field(93; "EORI Number"; Text[40])
        {
            Caption = 'EORI Number';
        }
        field(95; "Use GLN in Electronic Document"; Boolean)
        {
            Caption = 'Use GLN in Electronic Documents';
        }

        field(102; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            begin
                ValidateEmail();
            end;
        }
        field(103; "Home Page"; Text[80])
        {
            Caption = 'Home Page';
            ExtendedDatatype = URL;
        }
        field(104; "Reminder Terms Code"; Code[10])
        {
            Caption = 'Reminder Terms Code';
            TableRelation = "Reminder Terms";
        }

        field(107; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(108; "Tax Area Code"; Code[20])
        {
            Caption = 'Tax Area Code';
            TableRelation = "Tax Area";

            trigger OnValidate()
            begin
                UpdateTaxAreaId;
            end;
        }
        field(109; "Tax Liable"; Boolean)
        {
            Caption = 'Tax Liable';
        }
        field(110; "VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";

            trigger OnValidate()
            begin
                UpdateTaxAreaId;
            end;
        }
        field(111; "Currency Filter"; Code[10])
        {
            Caption = 'Currency Filter';
            FieldClass = FlowFilter;
            TableRelation = Currency;
        }

        field(115; Reserve; Enum "Reserve Method")
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            Caption = 'Reserve';
            InitValue = Optional;
        }
        field(116; "Block Payment Tolerance"; Boolean)
        {
            Caption = 'Block Payment Tolerance';

            trigger OnValidate()
            begin
                UpdatePaymentTolerance((CurrFieldNo <> 0) and GuiAllowed);
            end;
        }




        field(124; "Prepayment %"; Decimal)
        {
            Caption = 'Prepayment %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }

        field(132; "Partner Type"; Enum "Partner Type")
        {
            Caption = 'Partner Type';
        }
        field(133; "Intrastat Partner Type"; Enum "Partner Type")
        {
            Caption = 'Intrastat Partner Type';
        }
        field(140; Image; Media)
        {
            Caption = 'Image';
            ExtendedDatatype = Person;
        }
        field(150; "Privacy Blocked"; Boolean)
        {
            Caption = 'Privacy Blocked';

            trigger OnValidate()
            begin
                if "Privacy Blocked" then
                    Blocked := Blocked::All
                else
                    Blocked := Blocked::" ";
            end;
        }
        field(160; "Disable Search by Name"; Boolean)
        {
            Caption = 'Disable Search by Name';
            DataClassification = SystemMetadata;
        }
        field(288; "Preferred Bank Account Code"; Code[20])
        {
            Caption = 'Preferred Bank Account Code';
            TableRelation = "Customer Bank Account".Code WHERE("Customer No." = FIELD("No."));
        }
        field(720; "Coupled to CRM"; Boolean)
        {
            Caption = 'Coupled to Dataverse';
            Editable = false;
        }
        field(840; "Cash Flow Payment Terms Code"; Code[10])
        {
            Caption = 'Cash Flow Payment Terms Code';
            TableRelation = "Payment Terms";
        }
        field(5049; "Primary Contact No."; Code[20])
        {
            Caption = 'Primary Contact No.';
            TableRelation = Contact;

            trigger OnLookup()
            begin
                LookupContactList;
            end;

            // trigger OnValidate()
            // var
            //     Cont: Record Contact;
            // begin
            //     Contact := '';
            //     if "Primary Contact No." <> '' then begin
            //         Cont.Get("Primary Contact No.");

            //         CheckCustomerContactRelation(Cont);

            //         if Cont.Type = Cont.Type::Person then begin
            //             Contact := Cont.Name;
            //             exit;
            //         end;

            //         if Cont.Image.HasValue then
            //             CopyContactPicture(Cont);

            //         if Cont."Phone No." <> '' then
            //             "Phone No." := Cont."Phone No.";
            //         if Cont."E-Mail" <> '' then
            //             "E-Mail" := Cont."E-Mail";
            //         if Cont."Mobile Phone No." <> '' then
            //             "Mobile Phone No." := Cont."Mobile Phone No.";

            //     end else
            //         if Image.HasValue then
            //             Clear(Image);
            // end;
        }
        field(5050; "Contact Type"; Enum "Contact Type")
        {
            Caption = 'Contact Type';
        }
        field(5061; "Mobile Phone No."; Text[30])
        {
            Caption = 'Mobile Phone No.';
            ExtendedDatatype = PhoneNo;


        }
        field(5700; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";
        }
        field(5750; "Shipping Advice"; Enum "Sales Header Shipping Advice")
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            Caption = 'Shipping Advice';
        }
        field(5790; "Shipping Time"; DateFormula)
        {
            AccessByPermission = TableData "Shipping Agent Services" = R;
            Caption = 'Shipping Time';
        }
        field(5792; "Shipping Agent Service Code"; Code[10])
        {
            Caption = 'Shipping Agent Service Code';
            TableRelation = "Shipping Agent Services".Code WHERE("Shipping Agent Code" = FIELD("Shipping Agent Code"));

            trigger OnValidate()
            begin
                if ("Shipping Agent Code" <> '') and
                   ("Shipping Agent Service Code" <> '')
                then
                    if ShippingAgentService.Get("Shipping Agent Code", "Shipping Agent Service Code") then
                        "Shipping Time" := ShippingAgentService."Shipping Time"
                    else
                        Evaluate("Shipping Time", '<>');
            end;
        }
        field(5900; "Service Zone Code"; Code[10])
        {
            Caption = 'Service Zone Code';
            TableRelation = "Service Zone";
        }

        field(5903; "Ship-to Filter"; Code[10])
        {
            Caption = 'Ship-to Filter';
            FieldClass = FlowFilter;
            TableRelation = "Ship-to Address".Code WHERE("Customer No." = FIELD("No."));
        }

        field(7000; "Price Calculation Method"; Enum "Price Calculation Method")
        {
            Caption = 'Price Calculation Method';

            trigger OnValidate()
            var
                PriceCalculationMgt: Codeunit "Price Calculation Mgt.";
                PriceType: Enum "Price Type";
            begin
                if "Price Calculation Method" <> "Price Calculation Method"::" " then
                    PriceCalculationMgt.VerifyMethodImplemented("Price Calculation Method", PriceType::Sale);
            end;
        }
        field(7001; "Allow Line Disc."; Boolean)
        {
            Caption = 'Allow Line Disc.';
            InitValue = true;
        }

        field(7600; "Base Calendar Code"; Code[10])
        {
            Caption = 'Base Calendar Code';
            TableRelation = "Base Calendar";
        }
        field(7601; "Copy Sell-to Addr. to Qte From"; Enum "Contact Type")
        {
            AccessByPermission = TableData Contact = R;
            Caption = 'Copy Sell-to Addr. to Qte From';
        }
        field(7602; "Validate EU Vat Reg. No."; Boolean)
        {
            Caption = 'Validate EU VAT Reg. No.';
        }
        field(8000; Id; Guid)
        {
            Caption = 'Id';
            ObsoleteState = Pending;
            ObsoleteReason = 'This functionality will be replaced by the systemID field';
            ObsoleteTag = '15.0';
        }
        field(8001; "Currency Id"; Guid)
        {
            Caption = 'Currency Id';
            TableRelation = Currency.SystemId;

            trigger OnValidate()
            begin
                UpdateCurrencyCode;
            end;
        }
        field(8002; "Payment Terms Id"; Guid)
        {
            Caption = 'Payment Terms Id';
            TableRelation = "Payment Terms".SystemId;

            trigger OnValidate()
            begin
                UpdatePaymentTermsCode;
            end;
        }
        field(8003; "Shipment Method Id"; Guid)
        {
            Caption = 'Shipment Method Id';
            TableRelation = "Shipment Method".SystemId;

            trigger OnValidate()
            begin
                UpdateShipmentMethodCode;
            end;
        }
        field(8004; "Payment Method Id"; Guid)
        {
            Caption = 'Payment Method Id';
            TableRelation = "Payment Method".SystemId;

            trigger OnValidate()
            begin
                UpdatePaymentMethodCode;
            end;
        }
        field(9003; "Tax Area ID"; Guid)
        {
            Caption = 'Tax Area ID';

            trigger OnValidate()
            begin
                UpdateTaxAreaCode;
            end;
        }

        field(9005; "Contact ID"; Guid)
        {
            Caption = 'Contact ID';
        }
        field(9006; "Contact Graph Id"; Text[250])
        {
            Caption = 'Contact Graph Id';
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
        field(70001; "FBM_Separate Halls Inv."; Boolean)
        {
            Caption = 'Separate Halls Invoice';
        }
        field(70002; "FBM_Customer Since"; Date)
        {
            Caption = 'Customer Since';
        }



        field(70030; "FBM_SubGroup"; Text[100])
        {
            Caption = 'SubGroup Customer';
            Description = 'ONETECH';
            FieldClass = Normal;
            TableRelation = FBM_CustGroup.SubGroup where("Group Name" = field("FBM_Group"), IsGroup = const(false));

            ValidateTableRelation = false;

        }

        field(70031; "FBM_Group"; Text[100])
        {
            Caption = 'Group Customer';
            Description = 'ONETECH';
            FieldClass = Normal;
            TableRelation = FBM_CustGroup.Group where(IsGroup = const(true));
            ValidateTableRelation = false;

        }
        field(70034; "FBM_Payment Bank Code"; Code[20])//no
        {
            caption = 'Payment bank code';
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No." where(FBM_IsPayment = const(true));
        }
        field(70035; "FBM_Payment Bank Code2"; Code[20])//no
        {
            caption = 'Payment bank code 2';
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No." where(FBM_IsPayment = const(true));
        }
        field(70036; "FBM_Company1"; TEXT[3])
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
                    fbm_Company1 := buffer.Name;

            end;
        }
        field(70037; "FBM_Company2"; TEXT[3])
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
                    FBM_Company2 := buffer.Name;

            end;
        }

        field(70038; "FBM_Company3"; TEXT[3])
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
                    FBM_Company3 := buffer.Name;

            end;
        }

    }

    keys
    {
        key(Key1; "No.", Version)
        {
            Clustered = true;
        }
        key(Key2; "Search Name")
        {
        }
        key(Key3; "Customer Posting Group")
        {
        }
        key(Key4; "Currency Code")
        {
        }
        key(Key5; "Country/Region Code")
        {
        }
        key(Key6; "Gen. Bus. Posting Group")
        {
        }
        key(Key7; Name, Address, City)
        {
        }
        key(Key8; "VAT Registration No.")
        {
        }
        key(Key9; Name)
        {
        }
        key(Key10; City)
        {
        }
        key(Key11; "Post Code")
        {
        }
        key(Key12; "Phone No.")
        {
        }
        key(Key13; Contact)
        {
        }
        key(Key14; Blocked)
        {
        }
        key(Key15; "Primary Contact No.")
        {
        }
        key(Key16; "Salesperson Code")
        {
        }
        key(Key17; SystemModifiedAt)
        {
        }
        key(Key20; "Partner Type", "Country/Region Code")
        {
        }
        key(Key21; "Coupled to CRM")
        {
        }

    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Name, City, "Post Code", "Phone No.", Contact)
        {
        }

    }

    trigger OnDelete()
    var
        CampaignTargetGr: Record "Campaign Target Group";
        ContactBusRel: Record "Contact Business Relation";
        Job: Record Job;
        StdCustSalesCode: Record "Standard Customer Sales Code";
        CustomReportSelection: Record "Custom Report Selection";
        MyCustomer: Record "My Customer";
        ServHeader: Record "Service Header";
        ItemReference: Record "Item Reference";
        CampaignTargetGrMgmt: Codeunit "Campaign Target Group Mgt";
        VATRegistrationLogMgt: Codeunit "VAT Registration Log Mgt.";
        ConfirmManagement: Codeunit "Confirm Management";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeOnDelete(Rec, IsHandled);
        if IsHandled then
            exit;

        //ApprovalsMgmt.OnCancelCustomerApprovalRequest(Rec);

        ServiceItem.SetRange("Customer No.", "No.");
        if ServiceItem.FindFirst() then
            if ConfirmManagement.GetResponseOrDefault(
                 StrSubstNo(Text008, TableCaption, "No.", ServiceItem.FieldCaption("Customer No.")), true)
            then
                ServiceItem.ModifyAll("Customer No.", '')
            else
                Error(Text009);

        Job.SetRange("Bill-to Customer No.", "No.");
        if not Job.IsEmpty() then
            Error(Text015, TableCaption, "No.", Job.TableCaption);

        //MoveEntries.MoveCustEntries(Rec);

        CommentLine.SetRange("Table Name", CommentLine."Table Name"::Customer);
        CommentLine.SetRange("No.", "No.");
        CommentLine.DeleteAll();

        CustBankAcc.SetRange("Customer No.", "No.");
        CustBankAcc.DeleteAll();

        ShipToAddr.SetRange("Customer No.", "No.");
        ShipToAddr.DeleteAll();

        SalesPrepmtPct.SetCurrentKey("Sales Type", "Sales Code");
        SalesPrepmtPct.SetRange("Sales Type", SalesPrepmtPct."Sales Type"::Customer);
        SalesPrepmtPct.SetRange("Sales Code", "No.");
        SalesPrepmtPct.DeleteAll();

        StdCustSalesCode.SetRange("Customer No.", "No.");
        StdCustSalesCode.DeleteAll(true);

        CheckIfSalesOrderLinesExist();

        CampaignTargetGr.SetRange("No.", "No.");
        CampaignTargetGr.SetRange(Type, CampaignTargetGr.Type::Customer);
        if CampaignTargetGr.Find('-') then begin
            ContactBusRel.SetRange("Link to Table", ContactBusRel."Link to Table"::Customer);
            ContactBusRel.SetRange("No.", "No.");
            ContactBusRel.FindFirst();
            // repeat
            //CampaignTargetGrMgmt.ConverttoContact(Rec, ContactBusRel."Contact No.");
            //until CampaignTargetGr.Next() = 0;
        end;

        ServHeader.SetCurrentKey("Customer No.", "Order Date");
        ServHeader.SetRange("Customer No.", "No.");
        if ServHeader.FindFirst() then
            Error(ServiceDocumentExistErr, "No.", ServHeader."Document Type");

        ServHeader.SetRange("Customer No.");
        ServHeader.SetRange("Bill-to Customer No.", "No.");
        if ServHeader.FindFirst() then
            Error(ServiceDocumentExistErr, "No.", ServHeader."Document Type");

        ItemReference.SetCurrentKey("Reference Type", "Reference Type No.");
        ItemReference.SetRange("Reference Type", ItemReference."Reference Type"::Customer);
        ItemReference.SetRange("Reference Type No.", Rec."No.");
        ItemReference.DeleteAll();

        //UpdateContFromCust.OnDelete(Rec);

        CustomReportSelection.SetRange("Source Type", DATABASE::Customer);
        CustomReportSelection.SetRange("Source No.", "No.");
        CustomReportSelection.DeleteAll();

        MyCustomer.SetRange("Customer No.", "No.");
        MyCustomer.DeleteAll();
        //VATRegistrationLogMgt.DeleteCustomerLog(Rec);

        DimMgt.DeleteDefaultDim(DATABASE::Customer, "No.");

        CalendarManagement.DeleteCustomizedBaseCalendarData(CustomizedCalendarChange."Source Type"::Customer, "No.");
    end;

    trigger OnInsert()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeInsert(Rec, IsHandled);
        if IsHandled then
            exit;

        if "No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("Customer Nos.");
            NoSeriesMgt.InitSeries(SalesSetup."Customer Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        if "Invoice Disc. Code" = '' then
            "Invoice Disc. Code" := "No.";

        if (not (InsertFromContact or (InsertFromTemplate and (Contact <> '')) or IsTemporary)) or ForceUpdateContact then
            //UpdateContFromCust.OnInsert(Rec);

        if "Salesperson Code" = '' then
                SetDefaultSalesperson;

        DimMgt.UpdateDefaultDim(
          DATABASE::Customer, "No.",
          "Global Dimension 1 Code", "Global Dimension 2 Code");

        UpdateReferencedIds;
        SetLastModifiedDateTime;

        OnAfterOnInsert(Rec, xRec);
    end;

    trigger OnModify()
    begin
        UpdateReferencedIds;
        SetLastModifiedDateTime;
        if IsContactUpdateNeeded then begin
            Modify;
            //UpdateContFromCust.OnModify(Rec);
            if not Find then begin
                Reset;
                if Find then;
            end;
        end;
    end;

    trigger OnRename()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeOnRename(Rec, xRec, IsHandled);
        if IsHandled then
            exit;

        ApprovalsMgmt.OnRenameRecordInApprovalRequest(xRec.RecordId, RecordId);
        DimMgt.RenameDefaultDim(DATABASE::Customer, xRec."No.", "No.");
        CommentLine.RenameCommentLine(CommentLine."Table Name"::Customer, xRec."No.", "No.");

        SetLastModifiedDateTime;
        if xRec."Invoice Disc. Code" = xRec."No." then
            "Invoice Disc. Code" := "No.";
        UpdateCustomerTemplateInvoiceDiscCodes();

        CalendarManagement.RenameCustomizedBaseCalendarData(CustomizedCalendarChange."Source Type"::Customer, "No.", xRec."No.");
    end;

    var
        Text000: Label 'You cannot delete %1 %2 because there is at least one outstanding Sales %3 for this customer.';
        Text002: Label 'Do you wish to create a contact for %1 %2?';
        SalesSetup: Record "Sales & Receivables Setup";
        CommentLine: Record "Comment Line";
        SalesOrderLine: Record "Sales Line";
        CustBankAcc: Record "Customer Bank Account";
        ShipToAddr: Record "Ship-to Address";
        PostCode: Record "Post Code";
        GenBusPostingGrp: Record "Gen. Business Posting Group";
        ShippingAgentService: Record "Shipping Agent Services";
        RMSetup: Record "Marketing Setup";
        SalesPrepmtPct: Record "Sales Prepayment %";
        ServiceItem: Record "Service Item";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        CustomizedCalendarChange: Record "Customized Calendar Change";
        PaymentToleranceMgt: Codeunit "Payment Tolerance Management";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        MoveEntries: Codeunit MoveEntries;
        UpdateContFromCust: Codeunit "CustCont-Update";
        DimMgt: Codeunit DimensionManagement;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        CalendarManagement: Codeunit "Calendar Management";
        InsertFromContact: Boolean;
        Text003: Label 'Contact %1 %2 is not related to customer %3 %4.';
        Text004: Label 'post';
        Text005: Label 'create';
        Text006: Label 'You cannot %1 this type of document when Customer %2 is blocked with type %3';
        Text008: Label 'Deleting the %1 %2 will cause the %3 to be deleted for the associated Service Items. Do you want to continue?';
        Text009: Label 'Cannot delete customer.';
        Text010: Label 'The %1 %2 has been assigned to %3 %4.\The same %1 cannot be entered on more than one %3. Enter another code.';
        Text011: Label 'Reconciling IC transactions may be difficult if you change IC Partner Code because this %1 has ledger entries in a fiscal year that has not yet been closed.\ Do you still want to change the IC Partner Code?';
        Text012: Label 'You cannot change the contents of the %1 field because this %2 has one or more open ledger entries.';
        ServiceDocumentExistErr: Label 'You cannot delete customer %1 because there is at least one outstanding Service %2 for this customer.', Comment = '%1 - customer no., %2 - service document type.';
        OnLineMapMustBeFilledMsg: Label 'To get a map with route directions, you must configure service in the Online Map Setup page.';
        Text015: Label 'You cannot delete %1 %2 because there is at least one %3 associated to this customer.';
        AllowPaymentToleranceQst: Label 'Do you want to allow payment tolerance for entries that are currently open?';
        RemovePaymentRoleranceQst: Label 'Do you want to remove payment tolerance from entries that are currently open?';
        CreateNewCustTxt: Label 'Create a new customer card for %1', Comment = '%1 is the name to be used to create the customer. ';
        SelectCustErr: Label 'You must select an existing customer.';
        CustNotRegisteredTxt: Label 'This customer is not registered. To continue, choose one of the following options:';
        SelectCustTxt: Label 'Select an existing customer';
        InsertFromTemplate: Boolean;
        LookupRequested: Boolean;
        OverrideImageQst: Label 'Override Image?';
        PrivacyBlockedActionErr: Label 'You cannot %1 this type of document when Customer %2 is blocked for privacy.', Comment = '%1 = action (create or post), %2 = customer code.';
        PrivacyBlockedGenericTxt: Label 'Privacy Blocked must not be true for customer %1.', Comment = '%1 = customer code';
        ConfirmBlockedPrivacyBlockedQst: Label 'If you change the Blocked field, the Privacy Blocked field is changed to No. Do you want to continue?';
        CanNotChangeBlockedDueToPrivacyBlockedErr: Label 'The Blocked field cannot be changed because the user is blocked for privacy reasons.';
        PhoneNoCannotContainLettersErr: Label 'must not contain letters';
        ForceUpdateContact: Boolean;

    procedure AssistEdit(OldCust: Record FBM_Customer): Boolean
    var
        Cust: Record FBM_Customer;
    begin
        with Cust do begin
            Cust := Rec;
            SalesSetup.Get();
            SalesSetup.TestField("Customer Nos.");
            if NoSeriesMgt.SelectSeries(SalesSetup."Customer Nos.", OldCust."No. Series", "No. Series") then begin
                NoSeriesMgt.SetSeries("No.");
                Rec := Cust;
                OnAssistEditOnBeforeExit(Cust);
                exit(true);
            end;
        end;
    end;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeValidateShortcutDimCode(Rec, xRec, FieldNumber, ShortcutDimCode, IsHandled);
        if IsHandled then
            exit;

        DimMgt.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        if not IsTemporary then begin
            DimMgt.SaveDefaultDim(DATABASE::Customer, "No.", FieldNumber, ShortcutDimCode);
            Modify;
        end;

        OnAfterValidateShortcutDimCode(Rec, xRec, FieldNumber, ShortcutDimCode);
    end;

    procedure ShowContact()
    var
        ContBusRel: Record "Contact Business Relation";
        Cont: Record Contact;
        OfficeContact: Record Contact;
        OfficeMgt: Codeunit "Office Management";
        ConfirmManagement: Codeunit "Confirm Management";
        ContactPageID: Integer;
    begin
        if OfficeMgt.GetContact(OfficeContact, "No.") and (OfficeContact.Count = 1) then begin
            ContactPageID := PAGE::"Contact Card";
            OnShowContactOnBeforeOpenContactCard(OfficeContact, ContactPageID);
            PAGE.Run(ContactPageID, OfficeContact);
        end else begin
            if "No." = '' then
                exit;

            ContBusRel.SetCurrentKey("Link to Table", "No.");
            ContBusRel.SetRange("Link to Table", ContBusRel."Link to Table"::Customer);
            ContBusRel.SetRange("No.", "No.");
            if not ContBusRel.FindFirst() then begin
                if not ConfirmManagement.GetResponseOrDefault(StrSubstNo(Text002, TableCaption, "No."), true) then
                    exit;
                //UpdateContFromCust.InsertNewContact(Rec, false);
                ContBusRel.FindFirst();
            end;
            Commit();

            Cont.FilterGroup(2);
            Cont.SetRange("Company No.", ContBusRel."Contact No.");
            if Cont.IsEmpty() then begin
                Cont.SetRange("Company No.");
                Cont.SetRange("No.", ContBusRel."Contact No.");
            end;
            ContactPageID := PAGE::"Contact List";
            OnShowContactOnBeforeOpenContactList(Cont, ContactPageID);
            PAGE.Run(ContactPageID, Cont);
        end;
    end;

    local procedure LookupContactList()
    var
        ContactBusinessRelation: Record "Contact Business Relation";
        Cont: Record Contact;
        TempCust: Record Customer temporary;
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeLookupContactList(Rec, IsHandled);
        if IsHandled then
            exit;

        Cont.FilterGroup(2);
        if ContactBusinessRelation.FindByRelation(ContactBusinessRelation."Link to Table"::Customer, "No.") then
            Cont.SetRange("Company No.", ContactBusinessRelation."Contact No.")
        else
            Cont.SetRange("Company No.", '');

        if "Primary Contact No." <> '' then
            if Cont.Get("Primary Contact No.") then;
        if PAGE.RunModal(0, Cont) = ACTION::LookupOK then begin
            TempCust.Copy(Rec);
            Find;
            TransferFields(TempCust, false);
            Validate("Primary Contact No.", Cont."No.");
        end;
    end;

    procedure SetInsertFromContact(FromContact: Boolean)
    begin
        InsertFromContact := FromContact;
    end;

    procedure CheckBlockedCustOnDocs(Cust2: Record FBM_Customer; DocType: Enum "Sales Document Type"; Shipment: Boolean; Transaction: Boolean)
    var
        Source: Option Journal,Document;
    begin
        if IsOnBeforeCheckBlockedCustHandled(Cust2, Source::Document, DocType, Shipment, Transaction) then
            exit;

        with Cust2 do begin
            if "Privacy Blocked" then
                CustPrivacyBlockedErrorMessage(Cust2, Transaction);

            if ((Blocked = Blocked::All) or
                ((Blocked = Blocked::Invoice) and
                 (DocType in [DocType::Quote, DocType::Order, DocType::Invoice, DocType::"Blanket Order"])) or
                ((Blocked = Blocked::Ship) and (DocType in [DocType::Quote, DocType::Order, DocType::"Blanket Order"]) and
                 (not Transaction)) or
                ((Blocked = Blocked::Ship) and (DocType in [DocType::Quote, DocType::Order, DocType::Invoice, DocType::"Blanket Order"]) and
                 Shipment and Transaction))
            then
                CustBlockedErrorMessage(Cust2, Transaction);
        end;
    end;

    procedure CheckBlockedCustOnJnls(Cust2: Record FBM_Customer; DocType: Enum "Gen. Journal Document Type"; Transaction: Boolean)
    var
        Source: Option Journal,Document;
    begin
        if IsOnBeforeCheckBlockedCustHandled(Cust2, Source::Journal, DocType, false, Transaction) then
            exit;

        with Cust2 do begin
            if "Privacy Blocked" then
                CustPrivacyBlockedErrorMessage(Cust2, Transaction);

            if (Blocked = Blocked::All) or
               ((Blocked = Blocked::Invoice) and (DocType in [DocType::Invoice, DocType::" "]))
            then
                CustBlockedErrorMessage(Cust2, Transaction)
        end;
    end;

    procedure CheckBlockedCustOnJnls(Cust2: Record FBM_Customer; var GenJnlLine: Record "Gen. Journal Line"; Transaction: Boolean)
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeCheckBlockedCustOnJnls(Cust2, GenJnlLine, Transaction, IsHandled);
        if IsHandled then
            exit;

        CheckBlockedCustOnJnls(Cust2, GenJnlLine."Document Type", Transaction);
    end;

    procedure CustBlockedErrorMessage(Cust2: Record FBM_Customer; Transaction: Boolean)
    var
        "Action": Text[30];
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeCustBlockedErrorMessage(Cust2, Transaction, IsHandled);
        if IsHandled then
            exit;

        if Transaction then
            Action := Text004
        else
            Action := Text005;
        Error(
            ErrorInfo.Create(
                StrSubstNo(
                    Text006, Action, Cust2."No.", Cust2.Blocked),
                true,
                Cust2,
                Cust2.FieldNo(Blocked)));
    end;

    procedure CustPrivacyBlockedErrorMessage(Cust2: Record FBM_Customer; Transaction: Boolean)
    var
        "Action": Text[30];
    begin
        if Transaction then
            Action := Text004
        else
            Action := Text005;

        Error(
            ErrorInfo.Create(
                StrSubstNo(
                    PrivacyBlockedActionErr, Action, Cust2."No."),
                true,
                Cust2));
    end;

    procedure GetPrivacyBlockedGenericErrorText(Cust2: Record FBM_Customer): Text[250]
    begin
        exit(StrSubstNo(PrivacyBlockedGenericTxt, Cust2."No."));
    end;

    procedure DisplayMap()
    var
        OnlineMapSetup: Record "Online Map Setup";
        OnlineMapManagement: Codeunit "Online Map Management";
    begin
        OnlineMapSetup.SetRange(Enabled, true);
        if OnlineMapSetup.FindFirst() then
            OnlineMapManagement.MakeSelection(DATABASE::Customer, GetPosition)
        else
            Message(OnLineMapMustBeFilledMsg);
    end;

    procedure GetPriceCalculationMethod() Method: Enum "Price Calculation Method";
    begin
        if "Price Calculation Method" <> Method::" " then
            Method := "Price Calculation Method"
        else begin
            Method := GetCustomerPriceGroupPriceCalcMethod();
            if Method = Method::" " then begin
                SalesSetup.Get();
                Method := SalesSetup."Price Calculation Method";
            end;
        end;
    end;

    procedure GetPrimaryContact(CustomerNo: Code[20]; var PrimaryContact: Record Contact)
    var
        Customer: Record Customer;
    begin
        Clear(PrimaryContact);
        if Customer.Get(CustomerNo) then
            if PrimaryContact.Get(Customer."Primary Contact No.") then;
    end;

    local procedure GetCustomerPriceGroupPriceCalcMethod(): Enum "Price Calculation Method";
    var
        CustomerPriceGroup: Record "Customer Price Group";
    begin
        if "Customer Price Group" <> '' then
            if CustomerPriceGroup.Get("Customer Price Group") then
                exit(CustomerPriceGroup."Price Calculation Method");
    end;







    procedure GetTopCustomerHeadlineQueryDocumentTypeFilter() DocumentTypeFilter: Text
    begin
        DocumentTypeFilter := '';

        OnAfterGetTopCustomerHeadlineQueryDocumentTypeFilter(DocumentTypeFilter);
    end;






    procedure CalcOverdueBalance() OverDueBalance: Decimal
    var
        [SecurityFiltering(SecurityFilter::Filtered)]
        CustLedgEntryRemainAmtQuery: Query "Cust. Ledg. Entry Remain. Amt.";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeCalcOverdueBalance(Rec, OverDueBalance, IsHandled);
        if IsHandled then
            exit(OverDueBalance);

        CustLedgEntryRemainAmtQuery.SetRange(Customer_No, "No.");
        CustLedgEntryRemainAmtQuery.SetFilter(Due_Date, '<%1', Today);
        CustLedgEntryRemainAmtQuery.SetFilter(Date_Filter, '..%1', Today);
        CustLedgEntryRemainAmtQuery.Open;

        if CustLedgEntryRemainAmtQuery.Read then
            OverDueBalance := CustLedgEntryRemainAmtQuery.Sum_Remaining_Amt_LCY;
    end;

    procedure GetLegalEntityType(): Text
    begin
        exit(Format("Partner Type"));
    end;

    procedure GetLegalEntityTypeLbl(): Text
    begin
        exit(FieldCaption("Partner Type"));
    end;



    procedure HasValidDDMandate(Date: Date): Boolean
    var
        SEPADirectDebitMandate: Record "SEPA Direct Debit Mandate";
    begin
        exit(SEPADirectDebitMandate.GetDefaultMandate("No.", Date) <> '');
    end;

    procedure GetReturnRcdNotInvAmountLCY(): Decimal
    var
        [SecurityFiltering(SecurityFilter::Ignored)]
        SalesLine: Record "Sales Line";
    begin
        SalesLine.SetCurrentKey("Document Type", "Bill-to Customer No.");
        SalesLine.SetRange("Document Type", SalesLine."Document Type"::"Return Order");
        SalesLine.SetRange("Bill-to Customer No.", "No.");
        SalesLine.CalcSums("Return Rcd. Not Invd. (LCY)");
        exit(SalesLine."Return Rcd. Not Invd. (LCY)");
    end;

    procedure GetInvoicedPrepmtAmountLCY() InvoicedPrepmtAmountLCY: Decimal
    var
        [SecurityFiltering(SecurityFilter::Ignored)]
        SalesLine: Record "Sales Line";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeGetInvoicedPrepmtAmountLCY(Rec, InvoicedPrepmtAmountLCY, IsHandled);
        if IsHandled then
            exit(InvoicedPrepmtAmountLCY);

        SalesLine.SetCurrentKey("Document Type", "Bill-to Customer No.");
        SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
        SalesLine.SetRange("Bill-to Customer No.", "No.");
        SalesLine.CalcSums("Prepmt. Amount Inv. (LCY)", "Prepmt. VAT Amount Inv. (LCY)");
        exit(SalesLine."Prepmt. Amount Inv. (LCY)" + SalesLine."Prepmt. VAT Amount Inv. (LCY)");
    end;



    procedure CreateAndShowNewInvoice()
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice;
        SalesHeader.SetRange("Sell-to Customer No.", "No.");
        SalesHeader.SetDefaultPaymentServices;
        SalesHeader.Insert(true);
        Commit();
        PAGE.Run(PAGE::"Sales Invoice", SalesHeader)
    end;

    procedure CreateAndShowNewOrder()
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
        SalesHeader.SetRange("Sell-to Customer No.", "No.");
        SalesHeader.SetDefaultPaymentServices;
        SalesHeader.Insert(true);
        Commit();
        PAGE.Run(PAGE::"Sales Order", SalesHeader)
    end;

    procedure CreateAndShowNewCreditMemo()
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader."Document Type" := SalesHeader."Document Type"::"Credit Memo";
        SalesHeader.SetRange("Sell-to Customer No.", "No.");
        SalesHeader.Insert(true);
        Commit();
        PAGE.Run(PAGE::"Sales Credit Memo", SalesHeader)
    end;

    procedure CreateAndShowNewQuote()
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader."Document Type" := SalesHeader."Document Type"::Quote;
        SalesHeader.SetRange("Sell-to Customer No.", "No.");
        SalesHeader.Insert(true);
        Commit();
        PAGE.Run(PAGE::"Sales Quote", SalesHeader)
    end;

    local procedure UpdatePaymentTolerance(UseDialog: Boolean)
    begin
        if "Block Payment Tolerance" then begin
            if UseDialog then
                if not Confirm(RemovePaymentRoleranceQst, false) then
                    exit;
            //PaymentToleranceMgt.DelTolCustLedgEntry(Rec);
        end else begin
            if UseDialog then
                if not Confirm(AllowPaymentToleranceQst, false) then
                    exit;
            //PaymentToleranceMgt.CalcTolCustLedgEntry(Rec);
        end;
    end;

    procedure GetBillToCustomerNo(): Code[20]
    begin
        if "Bill-to Customer No." <> '' then
            exit("Bill-to Customer No.");
        exit("No.");
    end;

    procedure HasAddressIgnoreCountryCode() Result: Boolean
    begin
        Result := (Address <> '') or
                  ("Address 2" <> '') or
                  (City <> '') or
                  (County <> '') or
                  ("Post Code" <> '') or
                  (Contact <> '');
        OnAfterHasAddressIgnoreCountryCode(Rec, Result);
    end;

    procedure HasAddress(): Boolean
    begin
        exit(HasAddressIgnoreCountryCode or ("Country/Region Code" <> ''));
    end;

    procedure HasDifferentAddress(OtherCustomer: Record FBM_Customer) Result: Boolean
    begin
        Result := (Address <> OtherCustomer.Address) or
                  ("Address 2" <> OtherCustomer."Address 2") or
                  (City <> OtherCustomer.City) or
                  (County <> OtherCustomer.County) or
                  ("Post Code" <> OtherCustomer."Post Code") or
                  ("Country/Region Code" <> OtherCustomer."Country/Region Code");
        OnAfterHasDifferentAddress(Rec, OtherCustomer, Result)
    end;

    procedure GetBalanceAsVendor(var LinkedVendorNo: Code[20]) BalanceAsVendor: Decimal;
    var
        Vendor: Record Vendor;
    begin
        BalanceAsVendor := 0;
        LinkedVendorNo := GetLinkedVendor();
        if Vendor.Get(LinkedVendorNo) then begin
            OnGetBalanceAsVendorOnBeforeCalcBalance(Vendor);
            Vendor.CalcFields("Balance (LCY)");
            BalanceAsVendor := Vendor."Balance (LCY)";
        end;
    end;

    procedure GetLinkedVendor(): Code[20];
    var
        ContBusRel: Record "Contact Business Relation";
    begin
        exit(
            ContBusRel.GetLinkedTables(
                "Contact Business Relation Link To Table"::Customer, "No.",
                "Contact Business Relation Link To Table"::Vendor))
    end;

    procedure GetCustNo(CustomerText: Text): Text
    begin
        exit(GetCustNoOpenCard(CustomerText, true, true));
    end;

    procedure GetCustNoOpenCard(CustomerText: Text; ShowCustomerCard: Boolean; ShowCreateCustomerOption: Boolean): Code[20]
    var
        Customer: Record FBM_Customer;
        CustomerNo: Code[20];
        NoFiltersApplied: Boolean;
        CustomerWithoutQuote: Text;
        CustomerFilterFromStart: Text;
        CustomerFilterContains: Text;
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeGetCustNoOpenCard(CustomerText, ShowCustomerCard, ShowCreateCustomerOption, CustomerNo, IsHandled);
        If IsHandled then
            exit(CustomerNo);

        if CustomerText = '' then
            exit('');

        if StrLen(CustomerText) <= MaxStrLen(Customer."No.") then
            if Customer.Get(CopyStr(CustomerText, 1, MaxStrLen(Customer."No."))) then
                exit(Customer."No.");

        OnGetCustNoOpenCardOnBeforeFilterCustomer(Customer);
        Customer.SetRange(Blocked, Customer.Blocked::" ");
        Customer.SetRange(Name, CustomerText);
        if Customer.FindFirst() then
            exit(Customer."No.");

        Customer.SetCurrentKey(Name);

        CustomerWithoutQuote := ConvertStr(CustomerText, '''', '?');
        Customer.SetFilter(Name, '''@' + CustomerWithoutQuote + '''');
        OnGetCustNoOpenCardOnBeforeCustomerFindSet(Customer);
        if Customer.FindFirst() then
            exit(Customer."No.");
        Customer.SetRange(Name);

        CustomerFilterFromStart := '''@' + CustomerWithoutQuote + '*''';

        Customer.FilterGroup := -1;
        Customer.SetFilter("No.", CustomerFilterFromStart);

        Customer.SetFilter(Name, CustomerFilterFromStart);
        OnGetCustNoOpenCardOnAfterOnAfterCustomerFilterFromStart(Customer);

        if Customer.FindFirst() then
            exit(Customer."No.");

        CustomerFilterContains := '''@*' + CustomerWithoutQuote + '*''';

        Customer.SetFilter("No.", CustomerFilterContains);
        Customer.SetFilter(Name, CustomerFilterContains);
        Customer.SetFilter(City, CustomerFilterContains);
        Customer.SetFilter(Contact, CustomerFilterContains);
        Customer.SetFilter("Phone No.", CustomerFilterContains);
        Customer.SetFilter("Post Code", CustomerFilterContains);
        OnGetCustNoOpenCardOnAfterSetCustomerFilters(Customer, CustomerFilterContains);

        if Customer.Count = 0 then
            MarkCustomersWithSimilarName(Customer, CustomerText);

        if Customer.Count = 1 then begin
            Customer.FindFirst();
            exit(Customer."No.");
        end;

        if not GuiAllowed then
            Error(SelectCustErr);

        if Customer.Count = 0 then begin
            if Customer.WritePermission then
                if ShowCreateCustomerOption then
                    case StrMenu(
                           StrSubstNo(
                             '%1,%2', StrSubstNo(CreateNewCustTxt, ConvertStr(CustomerText, ',', '.')), SelectCustTxt), 1, CustNotRegisteredTxt) of
                        0:
                            Error(SelectCustErr);
                        1:
                            exit(CreateNewCustomer(CopyStr(CustomerText, 1, MaxStrLen(Customer.Name)), ShowCustomerCard));
                    end
                else
                    exit('');
            Customer.Reset();
            NoFiltersApplied := true;
        end;

        if ShowCustomerCard then
            CustomerNo := PickCustomer(Customer, NoFiltersApplied)
        else begin
            LookupRequested := true;
            exit('');
        end;

        if CustomerNo <> '' then
            exit(CustomerNo);

        Error(SelectCustErr);
    end;

    local procedure MarkCustomersWithSimilarName(var Customer: Record FBM_Customer; CustomerText: Text)
    var
        TypeHelper: Codeunit "Type Helper";
        CustomerCount: Integer;
        CustomerTextLength: Integer;
        Treshold: Integer;
    begin
        if CustomerText = '' then
            exit;
        if StrLen(CustomerText) > MaxStrLen(Customer.Name) then
            exit;
        CustomerTextLength := StrLen(CustomerText);
        Treshold := CustomerTextLength div 5;
        if Treshold = 0 then
            exit;

        Customer.Reset();
        Customer.Ascending(false); // most likely to search for newest customers
        Customer.SetRange(Blocked, Customer.Blocked::" ");
        OnMarkCustomersWithSimilarNameOnBeforeCustomerFindSet(Customer);
        if Customer.FindSet() then
            repeat
                CustomerCount += 1;
                if Abs(CustomerTextLength - StrLen(Customer.Name)) <= Treshold then
                    if TypeHelper.TextDistance(UpperCase(CustomerText), UpperCase(Customer.Name)) <= Treshold then
                        Customer.Mark(true);
            until Customer.Mark or (Customer.Next() = 0) or (CustomerCount > 1000);
        Customer.MarkedOnly(true);
    end;

    procedure CreateNewCustomer(CustomerName: Text[100]; ShowCustomerCard: Boolean) NewCustomerCode: Code[20]
    var
        Customer: Record Customer;
        CustomerTemplMgt: Codeunit "Customer Templ. Mgt.";
        CustomerCard: Page "Customer Card";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeCreateNewCustomer(CustomerName, ShowCustomerCard, NewCustomerCode, IsHandled);
        IF IsHandled then
            exit(NewCustomerCode);

        Customer.Name := CustomerName;
        if not CustomerTemplMgt.InsertCustomerFromTemplate(Customer) then
            Customer.Insert(true)
        else
            if CustomerName <> Customer.Name then begin
                Customer.Name := CustomerName;
                Customer.Modify(true);
            end;

        Commit();
        if not ShowCustomerCard then
            exit(Customer."No.");
        Customer.SetRange("No.", Customer."No.");
        CustomerCard.SetTableView(Customer);
        if not (CustomerCard.RunModal = ACTION::OK) then
            Error(SelectCustErr);

        exit(Customer."No.");
    end;

    local procedure PickCustomer(var Customer: Record FBM_Customer; NoFiltersApplied: Boolean): Code[20]
    var
        CustomerList: Page "Customer List";
    begin
        if not NoFiltersApplied then
            MarkCustomersByFilters(Customer);

        CustomerList.SetTableView(Customer);
        CustomerList.SetRecord(Customer);
        CustomerList.LookupMode := true;
        if CustomerList.RunModal = ACTION::LookupOK then
            CustomerList.GetRecord(Customer)
        else
            Clear(Customer);

        exit(Customer."No.");
    end;

    procedure SelectCustomer(var Customer: Record Customer): Boolean
    begin
        exit(LookupCustomer(Customer));
    end;

    // [Scope('OnPrem')]
    procedure LookupCustomer(var Customer: Record Customer): Boolean
    var
        CustomerLookup: Page "Customer Lookup";
        Result: Boolean;
    begin
        CustomerLookup.SetTableView(Customer);
        CustomerLookup.SetRecord(Customer);
        CustomerLookup.LookupMode := true;
        Result := CustomerLookup.RunModal = ACTION::LookupOK;
        if Result then
            CustomerLookup.GetRecord(Customer)
        else
            Clear(Customer);

        exit(Result);
    end;

    local procedure MarkCustomersByFilters(var Customer: Record FBM_Customer)
    begin
        if Customer.FindSet() then
            repeat
                Customer.Mark(true);
            until Customer.Next() = 0;
        if Customer.FindFirst() then;
        Customer.MarkedOnly := true;
    end;

    procedure ToPriceSource(var PriceSource: Record "Price Source")
    begin
        PriceSource.Init();
        PriceSource."Price Type" := "Price Type"::Sale;
        PriceSource.Validate("Source Type", PriceSource."Source Type"::Customer);
        PriceSource.Validate("Source No.", "No.");
    end;

    local procedure TestNoSeries()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeTestNoSeries(Rec, xRec, IsHandled);
        if IsHandled then
            exit;

        if "No." <> xRec."No." then begin
            SalesSetup.Get();
            NoSeriesMgt.TestManual(SalesSetup."Customer Nos.");
            "No. Series" := '';
        end;
    end;

    procedure OpenCustomerLedgerEntries(FilterOnDueEntries: Boolean)
    var
        DetailedCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        CustLedgerEntry: Record "Cust. Ledger Entry";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeOpenCustomerLedgerEntries(Rec, DetailedCustLedgEntry, FilterOnDueEntries, IsHandled);
        if IsHandled then
            exit;

        DetailedCustLedgEntry.SetRange("Customer No.", "No.");
        CopyFilter("Global Dimension 1 Filter", DetailedCustLedgEntry."Initial Entry Global Dim. 1");
        CopyFilter("Global Dimension 2 Filter", DetailedCustLedgEntry."Initial Entry Global Dim. 2");
        if FilterOnDueEntries and (GetFilter("Date Filter") <> '') then begin
            CopyFilter("Date Filter", DetailedCustLedgEntry."Initial Entry Due Date");
            DetailedCustLedgEntry.SetFilter("Posting Date", '<=%1', GetRangeMax("Date Filter"));
        end;
        CopyFilter("Currency Filter", DetailedCustLedgEntry."Currency Code");
        CustLedgerEntry.DrillDownOnEntries(DetailedCustLedgEntry);
    end;

    procedure SetInsertFromTemplate(FromTemplate: Boolean)
    begin
        InsertFromTemplate := FromTemplate;
    end;

    procedure IsLookupRequested() Result: Boolean
    begin
        Result := LookupRequested;
        LookupRequested := false;
    end;

    procedure IsContactUpdateNeeded(): Boolean
    var
        CustContUpdate: Codeunit "CustCont-Update";
        UpdateNeeded: Boolean;
    begin
        UpdateNeeded :=
          (Name <> xRec.Name) or
          ("Search Name" <> xRec."Search Name") or
          ("Name 2" <> xRec."Name 2") or
          (Address <> xRec.Address) or
          ("Address 2" <> xRec."Address 2") or
          (City <> xRec.City) or
          ("Phone No." <> xRec."Phone No.") or
          ("Mobile Phone No." <> xRec."Mobile Phone No.") or
          ("Telex No." <> xRec."Telex No.") or
          ("Territory Code" <> xRec."Territory Code") or
          ("Currency Code" <> xRec."Currency Code") or
          ("Language Code" <> xRec."Language Code") or
          ("Salesperson Code" <> xRec."Salesperson Code") or
          ("Country/Region Code" <> xRec."Country/Region Code") or
          ("Fax No." <> xRec."Fax No.") or
          ("Telex Answer Back" <> xRec."Telex Answer Back") or
          ("VAT Registration No." <> xRec."VAT Registration No.") or
          ("Post Code" <> xRec."Post Code") or
          (County <> xRec.County) or
          ("E-Mail" <> xRec."E-Mail") or
          ("Home Page" <> xRec."Home Page") or
          (Contact <> xRec.Contact);

        if not UpdateNeeded and not IsTemporary then
            UpdateNeeded := CustContUpdate.ContactNameIsBlank("No.");

        if ForceUpdateContact then
            UpdateNeeded := true;

        OnBeforeIsContactUpdateNeeded(Rec, xRec, UpdateNeeded, ForceUpdateContact);
        exit(UpdateNeeded);
    end;

    procedure IsBlocked(): Boolean
    begin
        if Blocked <> Blocked::" " then
            exit(true);

        if "Privacy Blocked" then
            exit(true);

        exit(false);
    end;

    procedure HasAnyOpenOrPostedDocuments(): Boolean
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        CustLedgerEntry: Record "Cust. Ledger Entry";
        HasAnyDocs: Boolean;
    begin
        SalesHeader.SetRange("Sell-to Customer No.", "No.");
        if SalesHeader.FindFirst() then
            exit(true);

        SalesLine.SetCurrentKey("Document Type", "Bill-to Customer No.");
        SalesLine.SetRange("Bill-to Customer No.", "No.");
        if SalesLine.FindFirst() then
            exit(true);

        SalesLine.SetRange("Bill-to Customer No.");
        SalesLine.SetRange("Sell-to Customer No.", "No.");
        if SalesLine.FindFirst() then
            exit(true);

        CustLedgerEntry.SetRange("Customer No.", "No.");
        if not CustLedgerEntry.IsEmpty() then
            exit(true);

        HasAnyDocs := false;
        OnAfterHasAnyOpenOrPostedDocuments(Rec, HasAnyDocs);
        exit(HasAnyDocs);
    end;

#if not CLEAN18
    [Obsolete('Will be removed with other functionality related to "old" templates. Replaced by CopyFromNewCustomerTemplate(CustomerTemplate: Record "Customer Templ.")', '18.0')]
    procedure CopyFromCustomerTemplate(CustomerTemplate: Record "Customer Template")
    begin
        "Territory Code" := CustomerTemplate."Territory Code";
        "Global Dimension 1 Code" := CustomerTemplate."Global Dimension 1 Code";
        "Global Dimension 2 Code" := CustomerTemplate."Global Dimension 2 Code";
        "Customer Posting Group" := CustomerTemplate."Customer Posting Group";
        "Currency Code" := CustomerTemplate."Currency Code";
        "Invoice Disc. Code" := CustomerTemplate."Invoice Disc. Code";
        "Customer Price Group" := CustomerTemplate."Customer Price Group";
        "Customer Disc. Group" := CustomerTemplate."Customer Disc. Group";
        "Country/Region Code" := CustomerTemplate."Country/Region Code";
        "Allow Line Disc." := CustomerTemplate."Allow Line Disc.";
        "Gen. Bus. Posting Group" := CustomerTemplate."Gen. Bus. Posting Group";
        "VAT Bus. Posting Group" := CustomerTemplate."VAT Bus. Posting Group";
        Validate("Payment Terms Code", CustomerTemplate."Payment Terms Code");
        Validate("Payment Method Code", CustomerTemplate."Payment Method Code");
        "Prices Including VAT" := CustomerTemplate."Prices Including VAT";
        "Shipment Method Code" := CustomerTemplate."Shipment Method Code";

        OnAfterCopyFromCustomerTemplate(Rec, CustomerTemplate);
    end;
#endif

    procedure CopyFromNewCustomerTemplate(CustomerTemplate: Record "Customer Templ.")
    begin
        "Territory Code" := CustomerTemplate."Territory Code";
        "Global Dimension 1 Code" := CustomerTemplate."Global Dimension 1 Code";
        "Global Dimension 2 Code" := CustomerTemplate."Global Dimension 2 Code";
        "Customer Posting Group" := CustomerTemplate."Customer Posting Group";
        "Currency Code" := CustomerTemplate."Currency Code";
        "Invoice Disc. Code" := CustomerTemplate."Invoice Disc. Code";
        "Customer Price Group" := CustomerTemplate."Customer Price Group";
        "Customer Disc. Group" := CustomerTemplate."Customer Disc. Group";
        "Country/Region Code" := CustomerTemplate."Country/Region Code";
        "Allow Line Disc." := CustomerTemplate."Allow Line Disc.";
        "Gen. Bus. Posting Group" := CustomerTemplate."Gen. Bus. Posting Group";
        "VAT Bus. Posting Group" := CustomerTemplate."VAT Bus. Posting Group";
        Validate("Payment Terms Code", CustomerTemplate."Payment Terms Code");
        Validate("Payment Method Code", CustomerTemplate."Payment Method Code");
        "Prices Including VAT" := CustomerTemplate."Prices Including VAT";
        "Shipment Method Code" := CustomerTemplate."Shipment Method Code";

        OnAfterCopyFromNewCustomerTemplate(Rec, CustomerTemplate);
    end;

    // local procedure CopyContactPicture(var Cont: Record Contact)
    // var
    //     TempNameValueBuffer: Record "Name/Value Buffer" temporary;
    //     FileManagement: Codeunit "File Management";
    //     ConfirmManagement: Codeunit "Confirm Management";
    //     ExportPath: Text;
    // begin
    //     if Image.HasValue then
    //         if not ConfirmManagement.GetResponseOrDefault(OverrideImageQst, true) then
    //             exit;

    //     ExportPath := TemporaryPath + Cont."No." + Format(Cont.Image.MediaId);
    //     Cont.Image.ExportFile(ExportPath);
    //     FileManagement.GetServerDirectoryFilesList(TempNameValueBuffer, TemporaryPath);
    //     TempNameValueBuffer.SetFilter(Name, StrSubstNo('%1*', ExportPath));
    //     TempNameValueBuffer.FindFirst();

    //     Clear(Image);
    //     Image.ImportFile(TempNameValueBuffer.Name, '');
    //     Modify;
    //     if FileManagement.DeleteServerFile(TempNameValueBuffer.Name) then;
    // end;

    procedure GetInsertFromContact(): Boolean
    begin
        exit(InsertFromContact);
    end;

    procedure GetInsertFromTemplate(): Boolean
    begin
        exit(InsertFromTemplate);
    end;

    protected procedure SetDefaultSalesperson()
    var
        UserSetup: Record "User Setup";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeSetDefaultSalesperson(Rec, IsHandled);
        if IsHandled then
            exit;

        if not UserSetup.Get(UserId) then
            exit;

        if UserSetup."Salespers./Purch. Code" <> '' then
            Validate("Salesperson Code", UserSetup."Salespers./Purch. Code");
    end;

    protected procedure SetLastModifiedDateTime()
    begin
        "Last Modified Date Time" := CurrentDateTime();
        "Last Date Modified" := Today();
        OnAfterSetLastModifiedDateTime(Rec);
    end;

    procedure VATRegistrationValidation()
    var
        VATRegistrationNoFormat: Record "VAT Registration No. Format";
        VATRegistrationLog: Record "VAT Registration Log";
        VATRegNoSrvConfig: Record "VAT Reg. No. Srv Config";
        VATRegistrationLogMgt: Codeunit "VAT Registration Log Mgt.";
        ResultRecordRef: RecordRef;
        ApplicableCountryCode: Code[10];
        IsHandled: Boolean;
        LogNotVerified: Boolean;
    begin
        IsHandled := false;
        OnBeforeVATRegistrationValidation(Rec, IsHandled);
        if IsHandled then
            exit;

        if not VATRegistrationNoFormat.Test("VAT Registration No.", "Country/Region Code", "No.", DATABASE::Customer) then
            exit;

        LogNotVerified := true;
        if ("Country/Region Code" <> '') or (VATRegistrationNoFormat."Country/Region Code" <> '') then begin
            ApplicableCountryCode := "Country/Region Code";
            if ApplicableCountryCode = '' then
                ApplicableCountryCode := VATRegistrationNoFormat."Country/Region Code";
            if VATRegNoSrvConfig.VATRegNoSrvIsEnabled then begin
                LogNotVerified := false;
                VATRegistrationLogMgt.ValidateVATRegNoWithVIES(
                    ResultRecordRef, Rec, "No.", VATRegistrationLog."Account Type"::Customer.AsInteger(), ApplicableCountryCode);
                ResultRecordRef.SetTable(Rec);
            end;
        end;

        //if LogNotVerified then
        //VATRegistrationLogMgt.LogCustomer(Rec);
    end;

    local procedure ValidateEmail()
    var
        MailManagement: Codeunit "Mail Management";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeValidateEmail(Rec, IsHandled, xRec);
        if IsHandled then
            exit;

        if "E-Mail" = '' then
            exit;
        MailManagement.CheckValidEmailAddresses("E-Mail");
    end;

    procedure SetAddress(CustomerAddress: Text[100]; CustomerAddress2: Text[50]; CustomerPostCode: Code[20]; CustomerCity: Text[30]; CustomerCounty: Text[30]; CustomerCountryCode: Code[10]; CustomerContact: Text[100])
    begin
        Address := CustomerAddress;
        "Address 2" := CustomerAddress2;
        "Post Code" := CustomerPostCode;
        City := CustomerCity;
        County := CustomerCounty;
        "Country/Region Code" := CustomerCountryCode;
        //UpdateContFromCust.OnModify(Rec);
        Contact := CustomerContact;
    end;

    procedure FindByEmail(var Customer: Record Customer; Email: Text): Boolean
    var
        LocalContact: Record Contact;
        ContactBusinessRelation: Record "Contact Business Relation";
        MarketingSetup: Record "Marketing Setup";
    begin
        Customer.SetRange("E-Mail", Email);
        if Customer.FindFirst() then
            exit(true);

        Customer.SetRange("E-Mail");
        LocalContact.SetRange("E-Mail", Email);
        if LocalContact.FindSet() then begin
            MarketingSetup.Get();
            repeat
                if ContactBusinessRelation.Get(LocalContact."No.", MarketingSetup."Bus. Rel. Code for Customers") then begin
                    Customer.Get(ContactBusinessRelation."No.");
                    exit(true);
                end;
            until LocalContact.Next() = 0
        end;
    end;

    procedure UpdateReferencedIds()
    var
        GraphMgtGeneralTools: Codeunit "Graph Mgt - General Tools";
    begin
        if IsTemporary then
            exit;

        if not GraphMgtGeneralTools.IsApiEnabled() then
            exit;

        UpdateCurrencyId();
        UpdatePaymentTermsId();
        UpdateShipmentMethodId();
        UpdatePaymentMethodId();
        UpdateTaxAreaId();
    end;

    procedure GetReferencedIds(var TempField: Record "Field" temporary)
    var
        DataTypeManagement: Codeunit "Data Type Management";
    begin
        DataTypeManagement.InsertFieldToBuffer(TempField, DATABASE::Customer, FieldNo("Currency Id"));
        DataTypeManagement.InsertFieldToBuffer(TempField, DATABASE::Customer, FieldNo("Payment Terms Id"));
        DataTypeManagement.InsertFieldToBuffer(TempField, DATABASE::Customer, FieldNo("Payment Method Id"));
        DataTypeManagement.InsertFieldToBuffer(TempField, DATABASE::Customer, FieldNo("Shipment Method Id"));
        DataTypeManagement.InsertFieldToBuffer(TempField, DATABASE::Customer, FieldNo("Tax Area ID"));
    end;

    procedure SetForceUpdateContact(NewForceUpdateContact: Boolean)
    begin
        ForceUpdateContact := NewForceUpdateContact;
    end;

    local procedure UpdateCurrencyCode()
    var
        Currency: Record Currency;
    begin
        if not IsNullGuid("Currency Id") then
            Currency.GetBySystemId("Currency Id");

        Validate("Currency Code", Currency.Code);
    end;

    local procedure UpdatePaymentTermsCode()
    var
        PaymentTerms: Record "Payment Terms";
    begin
        if not IsNullGuid("Payment Terms Id") then
            PaymentTerms.GetBySystemId("Payment Terms Id");

        Validate("Payment Terms Code", PaymentTerms.Code);
    end;

    local procedure UpdateShipmentMethodCode()
    var
        ShipmentMethod: Record "Shipment Method";
    begin
        if not IsNullGuid("Shipment Method Id") then
            ShipmentMethod.GetBySystemId("Shipment Method Id");

        Validate("Shipment Method Code", ShipmentMethod.Code);
    end;

    local procedure UpdatePaymentMethodCode()
    var
        PaymentMethod: Record "Payment Method";
    begin
        if not IsNullGuid("Payment Method Id") then
            PaymentMethod.GetBySystemId("Payment Method Id");

        Validate("Payment Method Code", PaymentMethod.Code);
    end;

    procedure UpdateCurrencyId()
    var
        Currency: Record Currency;
    begin
        if "Currency Code" = '' then begin
            Clear("Currency Id");
            exit;
        end;

        if not Currency.Get("Currency Code") then
            exit;

        "Currency Id" := Currency.SystemId;
    end;

    procedure UpdatePaymentTermsId()
    var
        PaymentTerms: Record "Payment Terms";
    begin
        if "Payment Terms Code" = '' then begin
            Clear("Payment Terms Id");
            exit;
        end;

        if not PaymentTerms.Get("Payment Terms Code") then
            exit;

        "Payment Terms Id" := PaymentTerms.SystemId;
    end;

    procedure UpdateShipmentMethodId()
    var
        ShipmentMethod: Record "Shipment Method";
    begin
        if "Shipment Method Code" = '' then begin
            Clear("Shipment Method Id");
            exit;
        end;

        if not ShipmentMethod.Get("Shipment Method Code") then
            exit;

        "Shipment Method Id" := ShipmentMethod.SystemId;
    end;

    procedure UpdatePaymentMethodId()
    var
        PaymentMethod: Record "Payment Method";
    begin
        if "Payment Method Code" = '' then begin
            Clear("Payment Method Id");
            exit;
        end;

        if not PaymentMethod.Get("Payment Method Code") then
            exit;

        "Payment Method Id" := PaymentMethod.SystemId;
    end;

    local procedure UpdateDirectDebitPmtTermsCode()
    var
        PaymentMethod: Record "Payment Method";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeUpdateDirectDebitPmtTermsCode(Rec, IsHandled);
        if IsHandled then
            exit;

        PaymentMethod.Get("Payment Method Code");
        if PaymentMethod."Direct Debit" and ("Payment Terms Code" = '') then
            Validate("Payment Terms Code", PaymentMethod."Direct Debit Pmt. Terms Code");

    end;

    procedure UpdateTaxAreaId()
    var
        VATBusinessPostingGroup: Record "VAT Business Posting Group";
        TaxArea: Record "Tax Area";
        GeneralLedgerSetup: Record "General Ledger Setup";
    begin
        if GeneralLedgerSetup.UseVat then begin
            if "VAT Bus. Posting Group" = '' then begin
                Clear("Tax Area ID");
                exit;
            end;

            if not VATBusinessPostingGroup.Get("VAT Bus. Posting Group") then
                exit;

            "Tax Area ID" := VATBusinessPostingGroup.SystemId;
        end else begin
            if "Tax Area Code" = '' then begin
                Clear("Tax Area ID");
                exit;
            end;

            if not TaxArea.Get("Tax Area Code") then
                exit;

            "Tax Area ID" := TaxArea.SystemId;
        end;
    end;

    local procedure UpdateTaxAreaCode()
    var
        TaxArea: Record "Tax Area";
        VATBusinessPostingGroup: Record "VAT Business Posting Group";
        GeneralLedgerSetup: Record "General Ledger Setup";
    begin
        if IsNullGuid("Tax Area ID") then
            exit;

        if GeneralLedgerSetup.UseVat then begin
            VATBusinessPostingGroup.GetBySystemId("Tax Area ID");
            "VAT Bus. Posting Group" := VATBusinessPostingGroup.Code;
        end else begin
            TaxArea.GetBySystemId("Tax Area ID");
            "Tax Area Code" := TaxArea.Code;
        end;
    end;

    local procedure ValidateSalesPersonCode()
    begin
        if "Salesperson Code" <> '' then
            if SalespersonPurchaser.Get("Salesperson Code") then
                if SalespersonPurchaser.VerifySalesPersonPurchaserPrivacyBlocked(SalespersonPurchaser) then
                    Error(SalespersonPurchaser.GetPrivacyBlockedGenericText(SalespersonPurchaser, true))
    end;

    local procedure CheckCustomerContactRelation(Cont: Record Contact)
    var
        ContBusRel: Record "Contact Business Relation";
        IsHandled: Boolean;
    begin
        ContBusRel.FindOrRestoreContactBusinessRelation(Cont, Rec, ContBusRel."Link to Table"::Customer);

        IsHandled := false;
        OnBeforeCheckCustomerContactRelation(Cont, ContBusRel, IsHandled);
        if not IsHandled then
            if Cont."Company No." <> ContBusRel."Contact No." then
                Error(Text003, Cont."No.", Cont.Name, "No.", Name);
    end;

    local procedure CheckIfSalesOrderLinesExist()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeCheckIfOrderSalesLinesExist(Rec, IsHandled);
        if IsHandled then
            exit;

        SalesOrderLine.SetCurrentKey("Document Type", "Bill-to Customer No.");
        SalesOrderLine.SetRange("Bill-to Customer No.", "No.");
        if SalesOrderLine.FindFirst() then
            Error(Text000, TableCaption, "No.", SalesOrderLine."Document Type");

        SalesOrderLine.SetRange("Bill-to Customer No.");
        SalesOrderLine.SetRange("Sell-to Customer No.", "No.");
        if SalesOrderLine.FindFirst() then
            Error(Text000, TableCaption, "No.", SalesOrderLine."Document Type");
    end;

    local procedure UpdateCustomerTemplateInvoiceDiscCodes()
    var
        CustomerTempl: Record "Customer Templ.";
    begin
        CustomerTempl.SetRange("Invoice Disc. Code", xRec."No.");
        CustomerTempl.ModifyAll("Invoice Disc. Code", "No.");
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeIsContactUpdateNeeded(Customer: Record FBM_Customer; xCustomer: Record FBM_Customer; var UpdateNeeded: Boolean; ForceUpdateContact: Boolean)
    begin
    end;

#if not CLEAN18
    [Obsolete('Will be removed with other functionality related to "old" templates. Replaced by OnAfterCopyFromNewCustomerTemplate()', '18.0')]
    [IntegrationEvent(false, false)]
    local procedure OnAfterCopyFromCustomerTemplate(var Customer: Record FBM_Customer; CustomerTemplate: Record "Customer Template")
    begin
    end;
#endif

    [IntegrationEvent(false, false)]
    local procedure OnAfterCopyFromNewCustomerTemplate(var Customer: Record FBM_Customer; CustomerTemplate: Record "Customer Templ.")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetTopCustomerHeadlineQueryDocumentTypeFilter(var DocumentTypeFilter: Text)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterHasAnyOpenOrPostedDocuments(var Customer: Record FBM_Customer; var HasAnyDocs: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterHasAddressIgnoreCountryCode(Customer: Record FBM_Customer; var Result: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterHasDifferentAddress(Customer: Record FBM_Customer; OtherCustomer: Record FBM_Customer; var Result: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterLookupCity(var Customer: Record FBM_Customer; var PostCodeRec: Record "Post Code")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterLookupPostCode(var Customer: Record FBM_Customer; var PostCodeRec: Record "Post Code")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterOnInsert(var Customer: Record FBM_Customer; xCustomer: Record FBM_Customer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSetLastModifiedDateTime(var Customer: Record FBM_Customer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterValidateCity(var Customer: Record FBM_Customer; xCustomer: Record FBM_Customer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterValidatePostCode(var Customer: Record FBM_Customer; xCustomer: Record FBM_Customer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterValidateShortcutDimCode(var Customer: Record FBM_Customer; var xCustomer: Record FBM_Customer; FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAssistEditOnBeforeExit(var Customer: Record FBM_Customer)
    begin
    end;

    local procedure IsOnBeforeCheckBlockedCustHandled(Customer: Record FBM_Customer; Source: Option Journal,Document; DocType: Enum "Gen. Journal Document Type"; Shipment: Boolean; Transaction: Boolean) IsHandled: Boolean
    begin
        OnBeforeCheckBlockedCust(Customer, Source, DocType.AsInteger(), Shipment, Transaction, IsHandled)
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCheckBlockedCust(Customer: Record FBM_Customer; Source: Option Journal,Document; DocType: Option; Shipment: Boolean; Transaction: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCheckBlockedCustOnJnls(Customer: Record FBM_Customer; var GenJnlLine: Record "Gen. Journal Line"; Transaction: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCheckIfOrderSalesLinesExist(var Customer: Record FBM_Customer; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCreateNewCustomer(CustomerName: Text[100]; ShowCustomerCard: Boolean; var NewCustomerCode: Code[20]; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetCustNoOpenCard(CustomerText: Text; ShowCustomerCard: Boolean; var ShowCreateCustomerOption: Boolean; var CustomerNo: Code[20]; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCalcOverdueBalance(var Customer: Record FBM_Customer; var OverdueBalance: Decimal; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetInvoicedPrepmtAmountLCY(var Customer: Record FBM_Customer; var InvoicedPrepmtAmountLCY: Decimal; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetTotalAmountLCY(var Customer: Record FBM_Customer; var TotalAmountLCY: Decimal; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetTotalAmountLCYUI(var Customer: Record FBM_Customer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetTotalAmountLCYCommon(var Customer: Record FBM_Customer; var AdditionalAmountLCY: Decimal; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetSalesLCY(var Customer: Record FBM_Customer; var CustomerSalesYTD: Record FBM_Customer; var SalesLCY: Decimal; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInsert(var Customer: Record FBM_Customer; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeLookupCity(var Customer: Record FBM_Customer; var PostCodeRec: Record "Post Code")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeLookupContactList(var Customer: Record FBM_Customer; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeLookupPostCode(var Customer: Record FBM_Customer; var PostCodeRec: Record "Post Code")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeOpenCustomerLedgerEntries(var Customer: Record FBM_Customer; var DetailedCustLedgEntry: Record "Detailed Cust. Ledg. Entry"; FilterOnDueEntries: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeOnDelete(var Customer: Record FBM_Customer; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeOnRename(var Customer: Record FBM_Customer; xCustomer: Record FBM_Customer; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeSetDefaultSalesperson(var Customer: Record FBM_Customer; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeTestNoSeries(var Customer: Record FBM_Customer; xCustomer: Record FBM_Customer; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeUpdateDirectDebitPmtTermsCode(var Customer: Record FBM_Customer; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateCity(var Customer: Record FBM_Customer; var PostCodeRec: Record "Post Code")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateVATRegistrationNo(var Customer: Record FBM_Customer; xCustomer: Record FBM_Customer; FieldNumber: Integer; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidatePostCode(var Customer: Record FBM_Customer; var PostCodeRec: Record "Post Code")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateShortcutDimCode(var Customer: Record FBM_Customer; var xCustomer: Record FBM_Customer; FieldNumber: Integer; var ShortcutDimCode: Code[20]; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeVATRegistrationValidation(var Customer: Record FBM_Customer; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnGetCustNoOpenCardOnBeforeCustomerFindSet(var Customer: Record FBM_Customer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnGetCustNoOpenCardOnBeforeFilterCustomer(var Customer: Record FBM_Customer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnGetCustNoOpenCardOnAfterSetCustomerFilters(var Customer: Record FBM_Customer; var CustomerFilterContains: Text);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnMarkCustomersWithSimilarNameOnBeforeCustomerFindSet(var Customer: Record FBM_Customer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCheckCustomerContactRelation(Cont: Record Contact; ContBusRel: Record "Contact Business Relation"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeValidateContact(var IsHandled: Boolean; var Customer: Record FBM_Customer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateEmail(var Customer: Record FBM_Customer; var IsHandled: Boolean; xCustomer: Record FBM_Customer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnShowContactOnBeforeOpenContactCard(var Contact: Record Contact; var ContactPageID: Integer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnShowContactOnBeforeOpenContactList(var Contact: Record Contact; var ContactPageID: Integer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnGetCustNoOpenCardOnAfterOnAfterCustomerFilterFromStart(var Customer: Record FBM_Customer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCustBlockedErrorMessage(Cust2: Record FBM_Customer; Transaction: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCalcAvailableCreditCommon(var Rec: Record FBM_Customer; CalledFromUI: Boolean; var CreditLimitLCY: Decimal)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnGetBalanceAsVendorOnBeforeCalcBalance(var Vendor: Record Vendor)
    begin
    end;
}

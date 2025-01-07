tableextension 70008 FBM_SalesHeaderExt_DD extends "Sales Header"
{
    fields
    {

        modify("Sell-to Customer No.")
        {
            trigger OnAfterValidate()
            var
                Notif: Notification;
            begin
                if Cust.Get("Sell-to Customer No.") then begin
                    if Cust."FBM_Separate Halls Inv." then
                        Notif.Message := Text000
                    //Message(Text000)
                    else
                        Notif.Message := Text001;
                    //Message(Text001);
                    Notif.Send();
                end;
            end;
        }
        field(70100; FBM_Site; Code[20])
        {
            Caption = 'Site';
            TableRelation = FBM_CustomerSite_C."Site Code" where("Customer No." = field("Bill-to Customer No."));
            ValidateTableRelation = false;


            trigger OnValidate()
            begin
                CustSite.Reset();
                if CustSite.Get("Sell-to Customer No.", FBM_Site) then begin
                    if CustSite."Contract Code" <> '' then begin
                        if rec.FBM_Segment2 = rec.FBM_Segment2::Bingo then
                            Rec.Validate("FBM_Contract Code", CustSite."Contract Code")
                        else
                            if rec.FBM_Segment2 = rec.FBM_Segment2::Spin then
                                Rec.Validate("FBM_Contract Code", CustSite."Contract Code2");
                        Rec.Modify();
                    end;
                end;

                SalesLineRec.Reset();
                SalesLineRec.SetRange("Document No.", Rec."No.");
                SalesLineRec.SetRange("Document Type", Rec."Document Type");
                // SalesLineRec.SetRange(Type, SalesLineRec.Type::Item);
                IF SalesLineRec.FindSet() THEN
                    repeat
                        SalesLineRec.FBM_Site := Rec.FBM_Site;
                        SalesLineRec.Modify();
                    until SalesLineRec.Next() = 0;
            end;

        }

        field(70101; "FBM_Contract Code"; Code[4])
        {
            caption = 'Contract';

        }

        field(70102; "FBM_Period Start"; Date)
        {
            caption = 'Period Start';

            trigger OnValidate()
            begin
                UpdateDateLines(Rec);
            end;
        }
        field(70103; "FBM_Period End"; Date)
        {
            caption = 'Period End';
            trigger OnValidate()
            begin
                UpdateDateLines(Rec);
            end;
        }
        field(70104; FBM_Segment; Option)
        {
            caption = 'Segment ';
            OptionMembers = " ",Bingo,Spin,Online;
            //ObsoleteState = Removed;

        }
        field(70105; "FBM_LocalCurrAmt"; Decimal)
        {
            caption = 'Currency 2 Amount';

        }
        field(70106; FBM_Segment2; enum FBM_Segment_DD)
        {
            caption = 'Segment ';


        }



        field(70108; "FBM_Currency2"; code[10])
        {
            caption = 'Currency 2 ';
            TableRelation = Currency;

        }

        field(70109; "FBM_BeneficiaryBank"; text[100])
        {
            caption = 'Payment Bank Beneficiary ';

        }
        field(70110; "FBM_BeneficiaryBank2"; text[100])
        {
            caption = 'Payment Bank Beneficiary 2 ';

        }
        field(70112; "FBM_Cust Payment Bank Name"; Code[100])
        {
            caption = 'Payment Bank Name';


        }
        field(70114; "FBM_Cust Payment Bank Name2"; Code[100])
        {
            caption = 'payment Bank 2 Name';


        }
        field(70115; FBM_PO_Customer; Code[20])
        {
            caption = 'Customer''s PO';
            trigger
         OnLookup()
            var
                company: record Company;
                compinfo: record "Company Information";
                buffer: record "Name/Value Buffer" temporary;
                customer: record Customer;
                vendor: record vendor;
                purchheader: record "Purchase Header";
                acronym: text[3];
            begin
                compinfo.get();
                acronym := compinfo."Custom System Indicator Text";
                customer.get("Sell-to Customer No.");

                company.FindFirst();
                repeat
                    compinfo.ChangeCompany(company.Name);
                    compinfo.get;
                    if compinfo."Custom System Indicator Text" = customer.FBM_Acronym then begin
                        purchheader.ChangeCompany(company.Name);
                        vendor.ChangeCompany(company.Name);
                        vendor.SetRange(FBM_Acronym, acronym);
                        if vendor.FindFirst() then begin
                            purchheader.SetRange("Buy-from Vendor No.", vendor."No.");
                            purchheader.Setfilter(Status, '<>%1', purchheader.Status::Released);
                            purchheader.SetRange("Document Type", purchheader."Document Type"::Order);
                            if purchheader.FindFirst() then
                                repeat
                                    buffer.AddNewEntry(purchheader."No.", purchheader."Posting Description");
                                until purchheader.next = 0;
                        end;
                    end;


                until company.Next() = 0;
                if page.RunModal(page::"Name/Value Lookup", buffer) = action::LookupOK then
                    FBM_PO_Customer := buffer.Name;

            end;
        }









        field(70113; "FBM_Billing Statement"; Boolean)
        {
            Caption = 'Billing Statement';
            trigger
            OnValidate()
            var
                salessetup: record "Sales & Receivables Setup";
            begin
                salessetup.Get();
                if rec."FBM_Billing Statement" then
                    rec."Posting No. Series" := salessetup."FBM_Billing Statement Nos."
                else
                    rec."Posting No. Series" := salessetup."Posted Invoice Nos.";
            end;


        }
        field(70123; FBM_Signature_pic; MediaSet)
        {
            caption = 'Signature';


        }
        field(70124; "FBM_TotSales"; Decimal)
        {
            caption = 'Total Sales';


        }
        field(70125; "FBM_TotDeductions"; Decimal)
        {
            caption = 'Total Deductions';


        }
        field(70126; "FBM_VATable"; Decimal)
        {
            caption = 'VATable Sales';


        }
        field(70127; "FBM_VATexempt"; Decimal)
        {
            caption = 'VAT-exempt Sales';


        }
        field(70128; "FBM_ZeroRated"; Decimal)
        {
            caption = 'VATable Sales';


        }
    }
    var
        Cust: Record Customer;
        SalesLineRec: Record "Sales Line";
        Text000: Label 'This customer requires Separate Halls Invoicing.';
        Text001: Label 'This customer requires one invoice for all Halls.';
        CustSite: Record FBM_CustomerSite_C;

    local procedure UpdateDateLines(SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
        GLAccount: Record "G/L Account";
    begin
        SalesLine.Reset();
        SalesLine.SetFilter("Document Type", '%1', SalesHeader."Document Type");
        SalesLine.SetFilter("Document No.", SalesHeader."No.");

        SalesLine.SetFilter("No.", '<>%1', '');
        if SalesLine.FindSet() then begin
            repeat begin

                SalesLine.Validate("FBM_Period Start", SalesHeader."FBM_Period Start");
                SalesLine.Validate("FBM_Period End", SalesHeader."FBM_Period End");
                SalesLine.Modify();

            end;
            until (SalesLine.Next = 0);
        end;
    end;

}

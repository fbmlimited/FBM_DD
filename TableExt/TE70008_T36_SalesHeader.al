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
        field(70000; FBM_Site; Code[20])
        {
            Caption = 'Site';
            TableRelation = FBM_CustomerSite_C."Site Code" where("Customer No." = field("Bill-to Customer No."));


            trigger OnValidate()
            begin
                CustSite.Reset();
                if CustSite.Get("Sell-to Customer No.", FBM_Site) then begin
                    if CustSite."Contract Code" <> '' then begin
                        if rec.FBM_Segment = rec.FBM_Segment::Bingo then
                            Rec.Validate("FBM_Contract Code", CustSite."Contract Code")
                        else
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

        field(70001; "FBM_Contract Code"; Code[4])
        {
            caption = 'Contract';

        }

        field(70002; "FBM_Period Start"; Date)
        {
            caption = 'Period Start';

            trigger OnValidate()
            begin
                UpdateDateLines(Rec);
            end;
        }
        field(70003; "FBM_Period End"; Date)
        {
            caption = 'Period End';
            trigger OnValidate()
            begin
                UpdateDateLines(Rec);
            end;
        }
        field(70004; FBM_Segment; Option)
        {
            caption = 'Segment ';
            OptionMembers = " ",Bingo,Spin;

        }
        field(70005; "FBM_LocalCurrAmt"; Decimal)
        {
            caption = 'Local Currency Amount';

        }



        field(70008; "FBM_Currency2"; code[10])
        {
            caption = 'Local Currency ';
            TableRelation = Currency;

        }

        field(70009; "FBM_BeneficiaryBank"; text[100])
        {
            caption = 'Payment Bank Beneficiary ';

        }
        field(70010; "FBM_BeneficiaryBank2"; text[100])
        {
            caption = 'Payment Bank Beneficiary 2 ';

        }
        field(700012; "FBM_Cust Payment Bank Name"; Code[100])
        {
            caption = 'Payment Bank Name';


        }
        field(700014; "FBM_Cust Payment Bank Name2"; Code[100])
        {
            caption = 'payment Bank 2 Name';


        }








        field(70013; "FBM_Billing Statement"; Boolean)
        {
            Caption = 'Billing Statement';


        }
        field(70023; FBM_Signature_pic; MediaSet)
        {
            caption = 'Signature';


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

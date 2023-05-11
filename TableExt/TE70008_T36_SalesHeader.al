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
                    if Cust."Separate Halls Inv." then
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
            TableRelation = "Cust-Op-Site"."Site Code";

            //DevOps #619 -- begin
            trigger OnValidate()
            begin
                CustSite.Reset();
                if CustSite.Get("Sell-to Customer No.", Site) then begin
                    if CustSite."Contract Code" <> '' then begin
                        Rec.Validate("Contract Code", CustSite."Contract Code");
                        Rec.Modify();
                    end;
                end;

                SalesLineRec.Reset();
                SalesLineRec.SetRange("Document No.", Rec."No.");
                SalesLineRec.SetRange("Document Type", Rec."Document Type");
                // SalesLineRec.SetRange(Type, SalesLineRec.Type::Item);
                IF SalesLineRec.FindSet() THEN
                    repeat
                        SalesLineRec.Site := Rec.Site;
                        SalesLineRec.Modify();
                    until SalesLineRec.Next() = 0;
            end;
            //DevOps #619 -- end
        }
        //DevOps #619 -- begin
        field(70001; "FBM_Contract Code"; Code[4])
        {
            TableRelation = "Customer-Site"."Contract Code" WHERE("Customer No." = field("Sell-to Customer No."));

            trigger OnValidate()
            begin
            end;
        }
        //DevOps #619 -- end
        //DEVOPS #622 -- begin
        field(70002; "FBM_Period Start"; Date)
        {
            trigger OnValidate()
            begin
                UpdateDateLines(Rec);
            end;
        }
        field(70003; "FBM_Period End"; Date)
        {
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
        field(70006; "FBM_Cust Payment Bank Code2"; Code[100])
        {

            FieldClass = "Flowfield";
            CalcFormula = lookup(Customer."FBM_Payment Bank Code2" where("No." = field("Sell-to Customer No.")));
        }

        field(70007; "FBM_Cust Payment Bank Name2"; Code[100])
        {

            FieldClass = "Flowfield";
            CalcFormula = lookup(Customer."FBM_Payment Bank Code2" where("No." = field("Sell-to Customer No.")));
        }
        field(70011; "FBM_Cust Payment Bank Code"; Code[100])
        {

            FieldClass = "Flowfield";
            CalcFormula = lookup(Customer."FBM_Payment Bank Code2" where("No." = field("Sell-to Customer No.")));
        }

        field(700012; "FBM_Cust Payment Bank Name"; Code[100])
        {

            FieldClass = "Flowfield";
            CalcFormula = lookup(Customer."FBM_Payment Bank Code2" where("No." = field("Sell-to Customer No.")));
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





        field(70013; "FBM_Billing Statement"; Boolean)
        {


        }
    }
    var
        Cust: Record Customer;
        SalesLineRec: Record "Sales Line";
        Text000: Label 'This customer requires Separate Halls Invoicing.';
        Text001: Label 'This customer requires one invoice for all Halls.';
        CustSite: Record "Customer-Site";

    local procedure UpdateDateLines(SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
        GLAccount: Record "G/L Account";
    begin
        SalesLine.Reset();
        SalesLine.SetFilter("Document Type", '%1', SalesHeader."Document Type");
        SalesLine.SetFilter("Document No.", SalesHeader."No.");
        //SalesLine.SetFilter(Type, '%1', SalesLine.Type::"G/L Account");
        SalesLine.SetFilter("No.", '<>%1', '');
        if SalesLine.FindSet() then begin
            repeat begin
                //if GLAccount.Get(SalesLine."No.") then begin
                // if GLAccount."Periods Required" then begin
                SalesLine.Validate("FBM_Period Start", SalesHeader."Period Start");
                SalesLine.Validate("FBM_Period End", SalesHeader."Period End");
                SalesLine.Modify();
                /// end;
                // end;
            end;
            until (SalesLine.Next = 0);
        end;
    end;
    //DEVOPS #622 -- end
}

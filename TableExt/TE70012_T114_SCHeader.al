tableextension 70012 FBM_SCHeaderExt_DD extends "Sales Cr.Memo Header"
{
    fields
    {
        field(70000; FBM_Site; Code[20])
        {
            TableRelation = FBM_Site;

            trigger OnValidate()
            begin
                // CustSite.Reset();
                // if CustSite.Get("Sell-to Customer No.", Site) then begin
                //     if CustSite."Contract Code" <> '' then begin
                //         Rec.Validate("Contract Code", CustSite."Contract Code");
                //         Rec.Modify();
                //     end;
                // end;

                // SalesLineRec.Reset();
                // SalesLineRec.SetRange("Document No.", Rec."No.");
                // SalesLineRec.SetRange(Type, Rec."Document Type");
                // SalesLineRec.SetRange(Type, SalesLineRec.Type::Item);
                // IF SalesLineRec.FindSet() THEN
                //     repeat
                //         SalesLineRec.Site := Rec.Site;
                //         SalesLineRec.Modify();
                //     until SalesLineRec.Next() = 0;
            end;
        }
        //DevOps #619 -- begin
        field(70001; "FBM_Contract Code"; Code[4])
        {
            TableRelation = FBM_Site."Contract Code" WHERE("Site Code" = field(FBM_Site));

            trigger OnValidate()
            begin
            end;
        }
        //DevOps #619 -- end
        //DEVOPS #622 -- begin
        field(70002; "FBM_Period Start"; Date)
        {
        }
        field(70003; "FBM_Period End"; Date)
        {
        }
        field(70004; FBM_Segment; Option)
        {
            caption = 'Segment';
            OptionMembers = " ",Bingo,Spin;

        }
        field(70005; "FBM_LocalCurrAmt"; Decimal)
        {
            caption = 'Local Currency Amount';

        }
        field(70006; "Customer Payment Bank Code2"; Code[100])
        {

            FieldClass = "Flowfield";
            CalcFormula = lookup(Customer."FBM_Payment Bank Code2" where("No." = field("Sell-to Customer No.")));
        }

        field(70007; "Customer Payment Bank Name2"; Code[100])
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
    }

}

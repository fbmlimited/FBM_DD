tableextension 70002 FBM_CustomerExt_DD extends Customer
{
    fields
    {

        field(70101; "FBM_Separate Halls Inv."; Boolean)
        {
            Caption = 'Separate Halls Invoice';
        }
        field(70102; "FBM_Customer Since"; Date)
        {
            Caption = 'Customer Since';
        }
        field(70103; "FBM_GrCode"; Code[20])
        {
            caption = 'Group Code';
            //Editable = false;
        }
        field(70104; "FBM_Group"; Text[100])
        {
            Caption = 'Group Customer';

            FieldClass = Normal;
            TableRelation = FBM_CustGroup;
            ValidateTableRelation = false;

        }
        field(70105; "FBM_SubGroup"; Text[100])
        {
            Caption = 'SubGroup Customer';

            FieldClass = Normal;
            TableRelation = FBM_CustGroup.SubGroup where("Group" = field(FBM_Group));
            ValidateTableRelation = false;


        }




        field(71000; "FBM_Valid From"; Date)
        {
            Caption = 'Valid from';
        }
        field(71001; "FBM_Valid To"; Date)
        {
            Caption = 'Valid to';
        }
        field(71002; "FBM_Record Owner"; code[30])
        {
            Caption = 'Record Owner';
        }
        field(71003; "FBM_Change Note"; Text[1024])
        {
            Caption = 'Change Note';
        }

        field(70136; "FBM_Name 3"; text[100])
        {
            Caption = 'Group Name';

        }
        field(70134; "FBM_Payment Bank Code"; Code[20])
        {
            caption = 'Payment bank';
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No." where(FBM_IsPayment = const(true));
        }
        field(70135; "FBM_Payment Bank Code2"; Code[20])
        {
            caption = 'Payment bank 2';
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No." where(FBM_IsPayment = const(true));
        }
        field(70200; "FBM_Current Month_FF"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("No."),
                                                                                 "Initial Entry Global Dim. 1" = FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2" = FIELD("Global Dimension 2 Filter"),
                                                                                 "Currency Code" = FIELD("Currency Filter"),
                                                                                 "Posting Date" = FIELD("Date Filter"),
                                                                                 "Initial Document Type" = FILTER("Invoice"),
                                                                                 "Initial Entry Due Date" = FIELD("FBM_0D Date Filter")));
            Caption = 'Current Month';
            Description = 'Current Month-30D';
            Editable = false;
            FieldClass = FlowField;
        }

        field(70201; "FBM_1 Month_FF"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("No."),
                                                                                 "Initial Entry Global Dim. 1" = FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2" = FIELD("Global Dimension 2 Filter"),
                                                                                 "Currency Code" = FIELD("Currency Filter"),
                                                                                 "Posting Date" = FIELD("Date Filter"),
                                                                                 "Initial Document Type" = FILTER("Invoice"),
                                                                                 "Initial Entry Due Date" = FIELD("FBM_30D Date Filter")));
            Caption = '1 Month';
            Description = '30-60D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70202; "FBM_2 Months_FF"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("No."),
                                                                                 "Initial Entry Global Dim. 1" = FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2" = FIELD("Global Dimension 2 Filter"),
                                                                                 "Currency Code" = FIELD("Currency Filter"),
                                                                                 "Posting Date" = FIELD("Date Filter"),
                                                                                 "Initial Document Type" = FILTER("Invoice"),
                                                                                 "Initial Entry Due Date" = FIELD("FBM_60D Date Filter")));
            Caption = '2 Months';
            Description = '60-90D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70203; "FBM_3 Months_FF"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("No."),
                                                                                 "Initial Entry Global Dim. 1" = FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2" = FIELD("Global Dimension 2 Filter"),
                                                                                 "Currency Code" = FIELD("Currency Filter"),
                                                                                 "Posting Date" = FIELD("Date Filter"),
                                                                                 "Initial Document Type" = FILTER("Invoice"),
                                                                                 "Initial Entry Due Date" = FIELD("FBM_90D Date Filter")));
            Caption = '3 Months';
            Description = '90-120D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70204; "FBM_4 Months_FF"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("No."),
                                                                                 "Initial Entry Global Dim. 1" = FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2" = FIELD("Global Dimension 2 Filter"),
                                                                                 "Currency Code" = FIELD("Currency Filter"),
                                                                                 "Posting Date" = FIELD("Date Filter"),
                                                                                 "Initial Document Type" = FILTER("Invoice"),
                                                                                 "Initial Entry Due Date" = FIELD("FBM_120D Date Filter")));
            Caption = '4 Months';
            Description = '120-150D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70205; "FBM_5 Months_FF"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("No."),
                                                                                 "Initial Entry Global Dim. 1" = FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2" = FIELD("Global Dimension 2 Filter"),
                                                                                 "Currency Code" = FIELD("Currency Filter"),
                                                                                 "Posting Date" = FIELD("Date Filter"),
                                                                                 "Initial Document Type" = FILTER("Invoice"),
                                                                                 "Initial Entry Due Date" = FIELD("FBM_150D Date Filter")));
            Caption = '5 Months';
            Description = '150-180D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70206; "FBM_6 Months_FF"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("No."),
                                                                                 "Initial Entry Global Dim. 1" = FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2" = FIELD("Global Dimension 2 Filter"),
                                                                                 "Currency Code" = FIELD("Currency Filter"),
                                                                                 "Posting Date" = FIELD("Date Filter"),
                                                                                 "Initial Document Type" = FILTER("Invoice"),
                                                                                 "Initial Entry Due Date" = FIELD("FBM_180D Date Filter")));
            Caption = '6 Months';
            Description = '180-210D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70207; "FBM_0D Date Filter"; Date)
        {
            Caption = '0D Date Filter';

            FieldClass = FlowFilter;
        }
        field(70208; "FBM_30D Date Filter"; Date)
        {
            Caption = '30D Date Filter';

            FieldClass = FlowFilter;
        }
        field(70209; "FBM_60D Date Filter"; Date)
        {
            Caption = '60D Date Filter';

            FieldClass = FlowFilter;
        }
        field(70210; "FBM_90D Date Filter"; Date)
        {
            Caption = '90D Date Filter';

            FieldClass = FlowFilter;
        }
        field(70211; "FBM_120D Date Filter"; Date)
        {
            Caption = '120D Date Filter';

            FieldClass = FlowFilter;
        }
        field(70212; "FBM_150D Date Filter"; Date)
        {
            Caption = '150D Date Filter';

            FieldClass = FlowFilter;
        }
        field(70213; "FBM_180D Date Filter"; Date)
        {
            Caption = '180D Date Filter';

            FieldClass = FlowFilter;
        }
        field(70214; "FBM_7 Months_FF"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("No."),
                                                                                 "Initial Entry Global Dim. 1" = FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2" = FIELD("Global Dimension 2 Filter"),
                                                                                 "Currency Code" = FIELD("Currency Filter"),
                                                                                 "Posting Date" = FIELD("Date Filter"),
                                                                                 "Initial Document Type" = FILTER("Invoice"),
                                                                                 "Initial Entry Due Date" = FIELD("FBM_210D Date Filter")));
            Caption = '7 Months';
            Description = '210-240D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70215; "FBM_8 Months_FF"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("No."),
                                                                                 "Initial Entry Global Dim. 1" = FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2" = FIELD("Global Dimension 2 Filter"),
                                                                                 "Currency Code" = FIELD("Currency Filter"),
                                                                                 "Posting Date" = FIELD("Date Filter"),
                                                                                 "Initial Document Type" = FILTER("Invoice"),
                                                                                 "Initial Entry Due Date" = FIELD("FBM_240D Date Filter")));
            Caption = '8 Months';
            Description = '240-270D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70216; "FBM_9 Months_FF"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("No."),
                                                                                 "Initial Entry Global Dim. 1" = FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2" = FIELD("Global Dimension 2 Filter"),
                                                                                 "Currency Code" = FIELD("Currency Filter"),
                                                                                 "Posting Date" = FIELD("Date Filter"),
                                                                                 "Initial Document Type" = FILTER("Invoice"),
                                                                                 "Initial Entry Due Date" = FIELD("FBM_270D Date Filter")));
            Caption = '9 Months';
            Description = '270-300D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70217; "FBM_10 Months_FF"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("No."),
                                                                                 "Initial Entry Global Dim. 1" = FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2" = FIELD("Global Dimension 2 Filter"),
                                                                                 "Currency Code" = FIELD("Currency Filter"),
                                                                                 "Posting Date" = FIELD("Date Filter"),
                                                                                 "Initial Document Type" = FILTER("Invoice"),
                                                                                 "Initial Entry Due Date" = FIELD("FBM_300D Date Filter")));
            Caption = '10 Months';
            Description = '300-330D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70218; "FBM_11 Months_FF"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("No."),
                                                                                 "Initial Entry Global Dim. 1" = FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2" = FIELD("Global Dimension 2 Filter"),
                                                                                 "Currency Code" = FIELD("Currency Filter"),
                                                                                 "Posting Date" = FIELD("Date Filter"),
                                                                                 "Initial Document Type" = FILTER("Invoice"),
                                                                                 "Initial Entry Due Date" = FIELD("FBM_330D Date Filter")));
            Caption = '11 Months';
            Description = '330-360D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70219; "FBM_12 Months_FF"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("No."),
                                                                                 "Initial Entry Global Dim. 1" = FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2" = FIELD("Global Dimension 2 Filter"),
                                                                                 "Currency Code" = FIELD("Currency Filter"),
                                                                                 "Posting Date" = FIELD("Date Filter"),
                                                                                 "Initial Document Type" = FILTER("Invoice"),
                                                                                 "Initial Entry Due Date" = FIELD("FBM_360D Date Filter")));
            Caption = '12 Months';
            Description = '360-390D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70220; "FBM_210D Date Filter"; Date)
        {
            Caption = '210D Date Filter';

            FieldClass = FlowFilter;
        }
        field(70221; "FBM_240D Date Filter"; Date)
        {
            Caption = '240D Date Filter';

            FieldClass = FlowFilter;
        }
        field(70222; "FBM_270D Date Filter"; Date)
        {
            Caption = '270D Date Filter';

            FieldClass = FlowFilter;
        }
        field(70223; "FBM_300D Date Filter"; Date)
        {
            Caption = '300D Date Filter';

            FieldClass = FlowFilter;
        }
        field(70224; "FBM_330D Date Filter"; Date)
        {
            Caption = '330D Date Filter';

            FieldClass = FlowFilter;
        }
        field(70225; "FBM_360D Date Filter"; Date)
        {
            Caption = '360D Date Filter';

            FieldClass = FlowFilter;
        }


        field(70226; "FBM_Amounts Not Due_FF"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("No."),
                                                                                 "Initial Entry Global Dim. 1" = FIELD("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2" = FIELD("Global Dimension 2 Filter"),
                                                                                 "Currency Code" = FIELD("Currency Filter"),
                                                                                 "Posting Date" = FIELD("Date Filter"),
                                                                                 "Initial Document Type" = CONST("Invoice"),
                                                                                 "Initial Entry Due Date" = FIELD("FBM_Future Date Filter")));
            Caption = 'Current Month';
            Description = 'Current Month-30D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70227; "FBM_Future Date Filter"; Date)
        {
            Caption = '0D Date Filter';

            FieldClass = FlowFilter;
        }





    }
    trigger
    OnAfterDelete()
    var
        csite: record FBM_CustomerSite_C;
        cos: record FBM_CustOpSite;
    begin
        csite.SetRange("Customer No.", xrec."No.");
        csite.DeleteAll();
        cos.setrange("Cust Loc Code", xrec."No.");
        cos.DeleteAll();

    end;


}

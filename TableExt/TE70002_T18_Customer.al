tableextension 70002 FBM_CustomerExt_DD extends Customer
{
    fields
    {

        field(70001; "FBM_Separate Halls Inv."; Boolean)
        {
            Caption = 'Separate Halls Invoice';
        }
        field(70002; "FBM_Customer Since"; Date)
        {
            Caption = 'Customer Since';
        }
        field(70003; "FBM_GrCode"; Code[20])
        {
        }
        field(70004; "FBM_Current Month"; Decimal)
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
            Description = 'ONETECH Current Month-30D';
            Editable = false;
            FieldClass = FlowField;
        }

        field(70005; "FBM_1 Month"; Decimal)
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
            Description = 'ONETECH 30-60D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70006; "FBM_2 Months"; Decimal)
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
            Description = 'ONETECH 60-90D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70007; "FBM_3 Months"; Decimal)
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
            Description = 'ONETECH 90-120D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70008; "FBM_4 Months"; Decimal)
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
            Description = 'ONETECH 120-150D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70009; "FBM_5 Months"; Decimal)
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
            Description = 'ONETECH 150-180D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70010; "FBM_6 Months"; Decimal)
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
            Description = 'ONETECH 180-210D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70011; "FBM_0D Date Filter"; Date)
        {
            Caption = '0D Date Filter';
            Description = 'ONETECH';
            FieldClass = FlowFilter;
        }
        field(70012; "FBM_30D Date Filter"; Date)
        {
            Caption = '30D Date Filter';
            Description = 'ONETECH';
            FieldClass = FlowFilter;
        }
        field(70013; "FBM_60D Date Filter"; Date)
        {
            Caption = '60D Date Filter';
            Description = 'ONETECH';
            FieldClass = FlowFilter;
        }
        field(70014; "FBM_90D Date Filter"; Date)
        {
            Caption = '90D Date Filter';
            Description = 'ONETECH';
            FieldClass = FlowFilter;
        }
        field(70015; "FBM_120D Date Filter"; Date)
        {
            Caption = '120D Date Filter';
            Description = 'ONETECH';
            FieldClass = FlowFilter;
        }
        field(70016; "FBM_150D Date Filter"; Date)
        {
            Caption = '150D Date Filter';
            Description = 'ONETECH';
            FieldClass = FlowFilter;
        }
        field(70017; "FBM_180D Date Filter"; Date)
        {
            Caption = '180D Date Filter';
            Description = 'ONETECH';
            FieldClass = FlowFilter;
        }
        field(70018; "FBM_7 Months"; Decimal)
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
            Description = 'ONETECH 210-240D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70019; "FBM_8 Months"; Decimal)
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
            Description = 'ONETECH 240-270D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70020; "FBM_9 Months"; Decimal)
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
            Description = 'ONETECH 270-300D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70021; "FBM_10 Months"; Decimal)
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
            Description = 'ONETECH 300-330D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70022; "FBM_11 Months"; Decimal)
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
            Description = 'ONETECH 330-360D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70023; "FBM_12 Months"; Decimal)
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
            Description = 'ONETECH 360-390D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70024; "FBM_210D Date Filter"; Date)
        {
            Caption = '210D Date Filter';
            Description = 'ONETECH';
            FieldClass = FlowFilter;
        }
        field(70025; "FBM_240D Date Filter"; Date)
        {
            Caption = '240D Date Filter';
            Description = 'ONETECH';
            FieldClass = FlowFilter;
        }
        field(70026; "FBM_270D Date Filter"; Date)
        {
            Caption = '270D Date Filter';
            Description = 'ONETECH';
            FieldClass = FlowFilter;
        }
        field(70027; "FBM_300D Date Filter"; Date)
        {
            Caption = '300D Date Filter';
            Description = 'ONETECH';
            FieldClass = FlowFilter;
        }
        field(70028; "FBM_330D Date Filter"; Date)
        {
            Caption = '330D Date Filter';
            Description = 'ONETECH';
            FieldClass = FlowFilter;
        }
        field(70029; "FBM_360D Date Filter"; Date)
        {
            Caption = '360D Date Filter';
            Description = 'ONETECH';
            FieldClass = FlowFilter;
        }

        field(70030; "FBM_SubGroup"; Text[100])
        {
            Caption = 'SubGroup Customer';
            Description = 'ONETECH';
            FieldClass = Normal;
            TableRelation = FBM_CustGroup.SubGroup where("Group" = field("FBM_Group"), IsGroup = const(false));



        }

        field(70031; "FBM_Group"; Text[100])
        {
            Caption = 'Group Customer';
            Description = 'ONETECH';
            FieldClass = Normal;
            TableRelation = FBM_CustGroup.Group where(IsGroup = const(true));

        }
        field(70032; "FBM_Amounts Not Due"; Decimal)
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
            Description = 'ONETECH Current Month-30D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70033; "FBM_Future Date Filter"; Date)
        {
            Caption = '0D Date Filter';
            Description = 'Onetech';
            FieldClass = FlowFilter;
        }


    }


}

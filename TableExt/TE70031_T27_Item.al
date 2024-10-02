tableextension 70031 FBM_Item_DD extends Item
{
    fields
    {
        field(70000; FBM_Inventory_New; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("No."),
                                                                  "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                  "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                                  "Location Code" = FIELD("Location Filter"),
                                                                  "Drop Shipment" = FIELD("Drop Shipment Filter"),
                                                                  "Variant Code" = FIELD("Variant Filter"),
                                                                  "Lot No." = FIELD("Lot No. Filter"),
                                                                  "Serial No." = FIELD("Serial No. Filter"),
                                                                  "Unit of Measure Code" = FIELD("Unit of Measure Filter"),
                                                                  "Package No." = FIELD("Package No. Filter"),
                                                                  FBM_NewItem = const(true)));
            Caption = 'Inventory - New';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(70001; FBM_Inventory_Used; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("No."),
                                                                  "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                  "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                                  "Location Code" = FIELD("Location Filter"),
                                                                  "Drop Shipment" = FIELD("Drop Shipment Filter"),
                                                                  "Variant Code" = FIELD("Variant Filter"),
                                                                  "Lot No." = FIELD("Lot No. Filter"),
                                                                  "Serial No." = FIELD("Serial No. Filter"),
                                                                  "Unit of Measure Code" = FIELD("Unit of Measure Filter"),
                                                                  "Package No." = FIELD("Package No. Filter"),
                                                                  FBM_NewItem = const(false)));
            Caption = 'Inventory - Used';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(70002; FBM_MinStock; Decimal)
        {

            Caption = 'Min. Stock';
            DecimalPlaces = 0 : 5;
            Editable = true;

        }
        field(70023; "FBM_MultiCat"; Text[150])
        {
            Caption = 'Multiple Categories';
            DataClassification = CustomerContent;

            //Editable = false;
            /* trigger OnValidate()
             begin
                 rec.Multicat := '';
             end;*/
        }
        field(70003; FBM_MachineType; enum FBM_MachineType_DD)
        {

            Caption = 'Machine Type';


        }
        modify("Item Category Code")
        {

            TableRelation = "Item Category" where(FBM_Standard = const(true));

        }

    }
}
table 70015 FBM_Notes
{
    DataClassification = ToBeClassified;
    LookupPageId = FBM_NotesCust_DD;
    DrillDownPageId = FBM_NotesCust_DD;


    fields
    {
        field(1; Customer; code[20])
        {
            Caption = 'Customer';
            DataClassification = ToBeClassified;
        }
        field(2; SavedAt; DateTime)
        {
            Caption = 'Saved At';
            DataClassification = ToBeClassified;
        }
        field(3; User; code[30])
        {
            Caption = 'User';
            DataClassification = ToBeClassified;
        }
        field(4; Level; text[20])
        {
            Caption = 'Level';
            DataClassification = ToBeClassified;
            TableRelation = FBM_ListValues.Value where(Type = const('LEVEL'));
            ValidateTableRelation = false;
            trigger
            OnValidate()
            var
                cust: record customer;
            begin
                case level of
                    'CUSTOMER':
                        begin
                            rec.LevelValue := rec.Customer;
                        end;
                    'SUBGROUP':
                        begin
                            cust.SetRange("No.", rec.Customer);
                            if cust.FindFirst() then
                                rec.LevelValue := cust.FBM_SubGroup;
                        end;
                end;
            end;
        }
        field(5; LevelValue; text[20])
        {
            Caption = 'LevelValue';
            DataClassification = ToBeClassified;
            TableRelation = if (level = const('SITE')) FBM_CustomerSite_C WHERE("Customer No." = field(Customer))
            else
            if (level = const('CUSTOMER')) customer where("No." = field(customer))
            else
            if (level = const('SUBGROUP')) FBM_CustGroup where(Group = field(Group), SubGroup = field(SubGroup));
        }
        field(6; Group; text[100])
        {
            Caption = 'Group';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.FBM_Group where("No." = field(Customer)));

        }
        field(7; SubGroup; text[100])
        {
            Caption = 'subGroup';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.FBM_SubGroup where("No." = field(Customer)));

        }
        field(8; Note; text[2048])
        {
            Caption = 'Note';


        }
        field(9; EntryNo; Integer)
        {
            Caption = 'Entry No.';


        }
    }


    keys
    {
        key(PK; Customer, EntryNo)
        {
            Clustered = true;
        }
    }

}
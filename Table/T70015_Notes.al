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
                csite: record FBM_CustomerSite_C;
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


                rec.CalcFields(desccust, descsubgroup);
                csite.SetRange("Site Code", rec.LevelValue);
                if csite.FindFirst() then begin
                    csite.CalcFields("Site Name_FF");
                    rec.descsite := csite."Site Name_FF";
                end;
                rec.desc := rec.desccust + rec.descsite + rec.descsubgroup;
                //rec.Modify();



            end;
        }
        field(5; LevelValue; text[20])
        {
            Caption = 'LevelValue';
            DataClassification = ToBeClassified;
            TableRelation = if (level = const('SITE')) FBM_CustomerSite_C."Site Code" WHERE("Customer No." = field(Customer))
            else
            if (level = const('CUSTOMER')) customer where("No." = field(customer));
            ValidateTableRelation = false;
            // else
            // if (level = const('SUBGROUP')) FBM_CustGroup where(Group = field(Group), SubGroup = field(SubGroup));
            trigger
            OnValidate()
            var

                csite: record FBM_CustomerSite_C;
            begin



                rec.CalcFields(desccust, descsubgroup);
                csite.SetRange("Site Code", rec.LevelValue);
                if csite.FindFirst() then begin
                    csite.CalcFields("Site Name_FF");
                    rec.descsite := csite."Site Name_FF";
                end;
                rec.desc := rec.desccust + rec.descsite + rec.descsubgroup;
                rec.Modify();



            end;
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
        field(10; NoteType; Text[20])
        {
            Caption = 'Note Type';
            TableRelation = FBM_ListValues.Value where(Type = const('COMMENTTYPE'));
            ValidateTableRelation = false;


        }
        field(11; desccust; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field(LevelValue)));


        }
        field(12; descsite; Text[100])
        {



        }
        field(13; descsubgroup; Text[100])
        {

            FieldClass = FlowField;
            CalcFormula = lookup(FBM_CustGroup."SubGroup Name" where(SubGroup = field(LevelValue)));


        }
        field(14; desc; Text[100])
        {
            Caption = 'Description';

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
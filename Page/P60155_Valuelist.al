page 60155 FBM_ValueList_DD
{
    Caption = 'Value List Type';
    PageType = List;

    SourceTable = FBM_ListValues;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Ord; Rec.Ord)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Value; Rec.Value)
                {
                    ApplicationArea = All;
                }

            }
        }

    }


}
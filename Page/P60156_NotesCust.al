page 60156 FBM_NotesCust_DD
{
    Caption = 'Notes';
    PageType = Card;

    SourceTable = FBM_Notes;

    layout
    {
        area(Content)
        {

            group(GroupName)
            {
                field(EntryNo; Rec.EntryNo)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Customer; Rec.Customer)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(SavedAt; Rec.SavedAt)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(User; Rec.User)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Level; Rec.Level)
                {
                    ApplicationArea = All;
                }
                field(LevelValue; Rec.LevelValue)
                {
                    ApplicationArea = All;
                }
                field(Note; Rec.Note)
                {
                    ApplicationArea = All;
                    MultiLine = true;


                }
            }
        }
    }
    var

        ssetup: Record "Sales & Receivables Setup";

    trigger
    OnModifyRecord(): Boolean
    begin

        rec.SavedAt := CurrentDateTime;
    end;

    trigger
    OnOpenPage()
    begin

    end;

    trigger
    OnNewRecord(BelowxRec: Boolean)
    var
        note: record FBM_Notes;
    begin
        ssetup.Get();
        rec.User := UserId;
        rec.Customer := ssetup.FBM_Custtmp;
        note.setrange(Customer, ssetup.FBM_Custtmp);
        if note.findlast then
            rec.EntryNo := note.EntryNo + 1
        else
            rec.EntryNo := 1;

    end;

    trigger
 OnClosePage()
    begin
        if rec.SavedAt = 0DT then
            rec.SavedAt := CurrentDateTime;

    end;

    procedure passpar(pcust: code[20])
    begin
        ssetup.Get();

        ssetup.FBM_Custtmp := pcust;
        ssetup.Modify();
    end;
}
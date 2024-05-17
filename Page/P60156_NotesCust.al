page 60156 FBM_NotesCust_DD
{
    Caption = 'Notes';
    PageType = Card;

    SourceTable = FBM_Notes;

    layout
    {
        area(Content)
        {


            group(System)
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
            }
            group(Edit)
            {
                field(IsActive; Rec.IsActive)
                {
                    ApplicationArea = All;
                }
                field(Level; Rec.Level)
                {
                    ApplicationArea = All;
                }
                field(LevelValue; Rec.LevelValue)
                {
                    ApplicationArea = All;
                }
                field(desc; rec.desc)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(notetype; rec.notetype)
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
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(Database::FBM_Notes),
                              "No." = FIELD("No."),
                              "Document Type" = FIELD("Document Type");
            }
        }

    }
    var

        ssetup: Record "Sales & Receivables Setup";
        gdesc: text[100];

    trigger
    OnModifyRecord(): Boolean
    begin

        rec.SavedAt := CurrentDateTime;
        //  rec.CalcFields(desccust, descsubgroup);
        // csite.SetRange("Site Code", rec.LevelValue);
        // if csite.FindFirst() then begin
        //     csite.CalcFields("Site Name_FF");
        //     rec.descsite := csite."Site Name_FF";
        // end;
        // gdesc := rec.desccust + rec.descsite + rec.descsubgroup;

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
        rec."No." := copystr(rec.Customer, 1, 15) + format(rec.EntryNo);
        rec."Document Type" := rec."Document Type"::Note;
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
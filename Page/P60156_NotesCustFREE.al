// page 60156 FBM_NotesCust_DD
// {
//     Caption = 'Notes';
//     PageType = Card;

//     SourceTable = FBM_Notes;

//     layout
//     {
//         area(Content)
//         {


//             group(System)
//             {
//                 field(EntryNo; Rec.EntryNo)
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field(Customer; Rec.Customer)
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field(SavedAt; Rec.SavedAt)
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field(User; Rec.User)
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//             }
//             group(Edit)
//             {
//                 field(IsActive; Rec.IsActive)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field(Level; Rec.Level)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field(LevelValue; Rec.LevelValue)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field(desc; rec.desc)
//                 {
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field(notetype; rec.notetype)
//                 {
//                     ApplicationArea = All;
//                 }
//                 // field(Note; Rec.Note)
//                 // {
//                 //     ApplicationArea = All;
//                 //     MultiLine = true;


//                 // }
//             }
//             group(Notes)
//             {
//                 Caption = 'Notes';

//                 usercontrol(WorkDescUserControl; "Microsoft.Dynamics.Nav.Client.WebPageViewer")
//                 {
//                     ApplicationArea = All;

//                     trigger ControlAddInReady(callbackUrl: Text)
//                     begin
//                         IsReady := true;
//                         FillAddIn();
//                     end;

//                     trigger Callback(data: Text)
//                     begin
//                         MyNote := data;
//                         Rec.SetNote(MyNote);
//                     end;
//                 }
//             }

//         }

//         area(factboxes)
//         {
//             part("Attached Documents"; FBM_CRMDocAttach_DD)
//             {
//                 ApplicationArea = All;
//                 Caption = 'Attachments';
//                 SubPageLink = "Table ID" = CONST(Database::FBM_Notes),

//                               "No." = FIELD("No."),
//                               "Document Type" = field("Document Type");

//             }
//         }

//     }

//     var

//         ssetup: Record "Sales & Receivables Setup";
//         gdesc: text[100];
//         MyNote: Text;
//         IsReady: Boolean;

//     trigger
//     OnModifyRecord(): Boolean
//     begin

//         rec.SavedAt := CurrentDateTime;
//         //  rec.CalcFields(desccust, descsubgroup);
//         // csite.SetRange("Site Code", rec.LevelValue);
//         // if csite.FindFirst() then begin
//         //     csite.CalcFields("Site Name_FF");
//         //     rec.descsite := csite."Site Name_FF";
//         // end;
//         // gdesc := rec.desccust + rec.descsite + rec.descsubgroup;

//     end;

//     trigger
//     OnOpenPage()
//     begin

//     end;

//     trigger
//     OnNewRecord(BelowxRec: Boolean)
//     var
//         note: record FBM_Notes;
//     begin
//         ssetup.Get();
//         rec.User := UserId;
//         rec.Customer := ssetup.FBM_Custtmp;
//         note.setrange(Customer, ssetup.FBM_Custtmp);
//         if note.findlast then
//             rec.EntryNo := note.EntryNo + 1
//         else
//             rec.EntryNo := 1;
//         rec."No." := copystr(rec.Customer, 1, 15) + format(rec.EntryNo);
//         rec."Document Type" := rec."Document Type"::Note;
//     end;

//     trigger
//  OnClosePage()
//     begin
//         if rec.SavedAt = 0DT then
//             rec.SavedAt := CurrentDateTime;

//     end;

//     procedure passpar(pcust: code[20])
//     begin
//         ssetup.Get();

//         ssetup.FBM_Custtmp := pcust;
//         ssetup.Modify();
//     end;

//     trigger
//     OnAfterGetRecord()
//     begin
//         MyNote := Rec.GetNote();
//     end;

//     local procedure FillAddIn()
//     begin
//         CurrPage.WorkDescUserControl.SetContent(StrSubstNo('<textarea Id="TextArea" maxlength="%2" style="width:100%;height:100%;resize: none; font-family:Segoe UI Segoe WP, Segoe, device-segoe, Tahoma, Helvetica, Arial, sans-serif; font-size: 12pt;" OnChange="window.parent.WebPageViewerHelper.TriggerCallback(document.getElementById(''TextArea'').value)">%1</textarea>', MyNote, 2048));
//     end;
// }
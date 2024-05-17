pageextension 60100 FBM_DocAttachmentExt_DD extends "Document Attachment Factbox"
{
    layout
    {
        modify(Documents)
        {
            Visible = false;
        }
        addafter(Documents)
        {
            field(Documents2; NumberOfRecords)
            {
                ApplicationArea = All;
                Caption = 'Documents';
                StyleExpr = TRUE;
                ToolTip = 'Specifies the number of attachments.';

                trigger OnDrillDown()
                var
                    Notes: record FBM_Notes;
                    RecRef: RecordRef;
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                begin
                    case Rec."Table ID" of
                        0:
                            exit;
                        DATABASE::FBM_Notes:
                            begin
                                RecRef.Open(DATABASE::Customer);
                                notes.SetRange("No.", Rec."No.");
                                if notes.findfirst then
                                    RecRef.GetTable(Notes);
                            end;

                    // else
                    //     OnBeforeDrillDown(Rec, RecRef);
                    end;

                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    // OnBeforeDocumentAttachmentDetailsRunModal(Rec, RecRef, DocumentAttachmentDetails);
                    DocumentAttachmentDetails.RunModal();
                end;
            }
        }
    }


    var
        NumberOfRecords: integer;

    trigger

    OnAfterGetCurrRecord()
    begin
        NumberOfRecords := rec.Count;
    end;
}
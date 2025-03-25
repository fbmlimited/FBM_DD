

// page 60160 FBM_CRMDocAttach_DD
// {
//     Caption = 'Documents Attached Notes';
//     PageType = CardPart;
//     SourceTable = "Document Attachment";

//     layout
//     {
//         area(content)
//         {
//             group(Control2)
//             {
//                 ShowCaption = false;
//                 field(Documents; NumberOfRecords)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Documents';
//                     StyleExpr = true;
//                     ToolTip = 'Specifies the number of attachments.';

//                     trigger OnDrillDown()
//                     var
//                         Notes: record FBM_Notes;

//                         DocumentAttachmentDetails: Page FBM_CRMDocAttachDetails_DD;
//                         RecRef: RecordRef;
//                     begin
//                         case Rec."Table ID" of
//                             0:
//                                 exit;
//                             DATABASE::FBM_Notes:
//                                 begin
//                                     RecRef.Open(DATABASE::FBM_Notes);
//                                     notes.SetRange("No.", Rec."No.");
//                                     notes.SetRange("Document Type", rec."Document Type"::Note);
//                                     if notes.findfirst then
//                                         RecRef.GetTable(Notes);
//                                 end;


//                             else
//                                 OnBeforeDrillDown(Rec, RecRef);
//                         end;

//                         DocumentAttachmentDetails.OpenForRecRef(RecRef);
//                         //OnBeforeDocumentAttachmentDetailsRunModal(Rec, RecRef, DocumentAttachmentDetails);
//                         DocumentAttachmentDetails.RunModal();
//                     end;
//                 }
//             }
//         }
//     }

//     actions
//     {
//     }

//     [IntegrationEvent(false, false)]
//     local procedure OnBeforeDrillDown(DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
//     begin
//     end;

//     [IntegrationEvent(true, false)]
//     local procedure OnBeforeDocumentAttachmentDetailsRunModal(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef; var DocumentAttachmentDetails: Page "Document Attachment Details")
//     begin
//     end;

//     trigger OnAfterGetCurrRecord()

//     begin

//         NumberOfRecords := Rec.Count();


//     end;

//     var
//         NumberOfRecords: Integer;

//     [IntegrationEvent(false, false)]
//     local procedure OnBeforeOnAfterGetCurrRecord(var DocumentAttachment: Record "Document Attachment"; var AttachmentCount: Integer; var IsHandled: Boolean)
//     begin
//     end;
// }


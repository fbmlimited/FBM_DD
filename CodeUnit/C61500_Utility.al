codeunit 61500 FBM_Utility_DD
{
    permissions = tabledata "Detailed Vendor Ledg. Entry" = rimd;
    procedure updatedetvendle(rec: record "Vendor Ledger Entry")

    var
        detvenLE: record "Detailed Vendor Ledg. Entry";
    begin
        detvenle.SetRange("Vendor Ledger Entry No.", rec."Entry No.");
        if detvenLE.FindFirst() then begin
            detvenLE.FBM_approved := rec.FBM_approved1;
            detvenLE.Modify();
        end;
    end;

    procedure updatedetvendlem(rec: record FBM_VendorLEM; company: Text)

    var
        detvenLE: record "Detailed Vendor Ledg. Entry";
    begin
        detvenLE.ChangeCompany(company);
        detvenle.SetRange("Vendor Ledger Entry No.", rec."Entry No.");
        if detvenLE.FindFirst() then begin
            detvenLE.FBM_approved := rec.FBM_approved1;
            detvenLE.Modify();
        end;
    end;

    procedure getcompanyname(badge: text[3]): text[30]
    var
        comp: record Company;
        cinfo: record "Company Information";
    begin
        comp.FindFirst();
        repeat
            cinfo.ChangeCompany(comp.Name);
            if cinfo."Custom System Indicator Text" = badge then
                exit(comp.Name);
        until comp.next = 0;

    end;

}
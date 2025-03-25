table 70015 "Vendor Export Log"
{
    DataClassification = SystemMetadata;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = SystemMetadata;
        }
        field(2; "File Name"; Text[350])
        {
            DataClassification = SystemMetadata;
        }
        field(3; "File Created"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "URL"; Text[1024])
        {
            DataClassification = SystemMetadata;
            ExtendedDatatype = URL;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    var


    trigger OnInsert()
    var
        EntryNo: Integer;
    begin
        Rec."File Created" := CurrentDateTime();
    end;

    procedure InsertLog(_fileName: Text[1024]; _fullURL: Text[1024])
    var
    begin
        Rec.Init();
        Rec."Entry No." := GetLastEntryNo();
        Rec.Insert(true);
        Rec."File Name" := CopyStr(_fileName, 1, StrLen(_fileName));
        Rec.URL := CopyStr(_fullURL, 1, StrLen(_fullURL));
        Rec.Modify(true);
    end;

    procedure GetLastEntryNo(): Integer
    var
        _lastentryno: Integer;
        _rec2: Record "Vendor Export Log";
    begin
        if _rec2.FindLast() then
            exit(_rec2."Entry No." + 1)
        else
            exit(1);
    end;

    procedure SendVendorsToBlob(_outSt: OutStream; var _inSt: InStream)
    var
        _blob: Codeunit "Temp Blob";
        _vendor: Record Vendor;
    begin
        _blob.CreateOutStream(_outSt);

        if _vendor.Findset() then
            repeat
                _outSt.WriteText(Format(_vendor));
            until _vendor.next() = 0;

        _blob.CreateInStream(_inSt);
    end;
}
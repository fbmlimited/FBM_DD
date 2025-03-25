tableextension 70004 FBM_FixedAssetExt_DD extends "Fixed Asset"
{
    fields
    {
        modify("Serial No.")
        {
            trigger
                OnAfterValidate()
            begin
                IncVersion();
            end;
        }
        modify(Description)
        {
            trigger
                OnAfterValidate()
            begin
                IncVersion();
            end;
        }
        modify("FA Class Code")
        {
            trigger
                OnAfterValidate()
            begin
                IncVersion();
            end;
        }
        modify("FA Subclass Code")
        {
            trigger
                OnAfterValidate()
            begin
                IncVersion();
            end;
        }
        modify("FA Location Code")
        {
            trigger
                OnAfterValidate()
            begin
                IncVersion();
            end;
        }

        field(70101; IsActive; Boolean)
        {
            Caption = 'Is Active';

        }




        field(70107; "FBM_Site"; code[20])
        {
            Caption = 'Site';
            TableRelation = FBM_Site;
            trigger
            OnValidate()
            begin
                IncVersion();
            end;

        }






        field(70113; FBM_Status; Enum "FBM_FA Status_DD")
        {
            Caption = 'FA Status';
            InitValue = 0;
            trigger
            OnValidate()
            begin
                IncVersion();
            end;

        }
        field(70114; FBM_EGM_Property; text[3])
        {
            Caption = 'Property';

        }
        field(70115; FBM_Subsidiary; text[20])
        {
            Caption = 'Subsidiary';

        }
        // modify("Serial No.")
        // {
        // trigger OnAfterValidate()
        // var
        //     comp: record Company;
        //     count: Integer;
        // begin
        //     comp.FindFirst();
        //     count := 0;
        //     repeat
        //         fa.ChangeCompany(comp.Name);
        //         FA.Reset();
        //         FA.SetFilter("Serial No.", Rec."Serial No.");
        //         fa.SetFilter(FBM_Status, '<>%1', fa.FBM_Status::"I. Sold");
        //         fa.SetRange(IsActive, true);
        //         count += fa.Count;
        //     until comp.next = 0;
        //     if count > 0 then error(Text000, FA."No.");

        // end;
        // }

        field(70116; "FBM_DatePrepared"; Date)
        {
            Caption = 'Date Prepared';
            trigger
            OnValidate()
            begin
                IncVersion();
            end;
        }
        field(70117; FBM_Brand; Option)
        {
            Caption = 'Brand';
            OptionCaption = ' ,FBM,DINGO';
            OptionMembers = " ",FBM,DINGO;
            trigger
            OnValidate()
            begin
                IncVersion();
            end;
        }
        field(70118; FBM_Lessee; text[20])
        {
            Caption = 'Lessee';
            trigger
            OnValidate()
            begin
                IncVersion();
            end;

        }
        field(70119; FBM_Sma; DateTime)
        {
            Caption = 'SystemModifiedAt Original';

        }
        field(70120; FBM_Dupecomp; text[3])
        {
            Caption = 'Dupe';

        }
        field(70121; FBM_IsEGM; Boolean)
        {
            Caption = 'Is EGM';
            FieldClass = FlowField;
            CalcFormula = lookup("FA Subclass".FBM_EGM where(Code = field("FA Subclass Code")));

        }
        field(70122; FBM_Sca; DateTime)
        {
            Caption = 'FA Created';

        }
        field(70123; FBM_Model; text[50])
        {
            Caption = 'Model';
            TableRelation = FBM_ListValues.Value WHERE(TYPE = CONST('FAMODEL'));
            ValidateTableRelation = false;
            trigger
            OnValidate()
            begin
                IncVersion();
            end;

        }
        field(70124; FBM_Segment2; enum FBM_Segment_DD)
        {
            caption = 'Segment ';
            trigger
            OnValidate()
            begin
                IncVersion();
            end;


        }
        field(70125; FBM_IsLocalRec; Boolean)
        {
            caption = 'Local Record';


        }
        field(70126; FBM_IsTemporary; Boolean)
        {
            caption = 'Temporary Record';


        }
        field(70000; "Valid From"; Date)
        {
            Caption = 'Valid from';
        }
        field(70001; "Valid To"; Date)
        {
            Caption = 'Valid to';
        }
        field(70002; "Record Owner"; code[30])
        {
            Caption = 'Record Owner';
        }
        field(70003; "Change Note"; Text[1024])
        {
            Caption = 'Change Note';
        }
        field(70004; Version; Integer)
        {
            Caption = 'Version';
            DataClassification = ToBeClassified;
        }
        field(70005; ActiveRec; Boolean)
        {
            Caption = 'Active Record';
        }
        field(70152; LastPropagated; date)
        {
            caption = 'Last Propagation date';
        }
        field(70153; FBM_AcquisitionCost; Decimal)
        {
            caption = 'Acquisition Cost';
        }
        field(70154; FBM_AcquisitionDate; Date)
        {
            caption = 'Acquisition Date';
            trigger
            OnValidate()
            begin
                IncVersion();
            end;
        }
        field(70155; FBM_AcqCost; Decimal)
        {
            Caption = 'Acquisition Cost';
            FieldClass = FlowField;
            CalcFormula = sum("FA Ledger Entry".amount where("FA No." = field("No."), "FA Posting Type" = const("Acquisition Cost"), "FA Posting Category" = filter(<> Disposal)));

        }
        field(70156; FBM_Deprdate; Date)
        {
            Caption = 'Start Depreciation Date';
            FieldClass = FlowField;
            CalcFormula = min("FA Ledger Entry"."FA Posting Date" where("FA No." = field("No."), "FA Posting Type" = const("Depreciation")));

        }
        field(70157; FBM_DepreciationDate; Date)
        {
            caption = 'Start Depreciation Date';
        }
        field(70158; FBM_Acqdate; Date)
        {
            Caption = 'Start Depreciation Date';
            FieldClass = FlowField;
            CalcFormula = min("FA Ledger Entry"."FA Posting Date" where("FA No." = field("No."), "FA Posting Type" = const("Acquisition Cost"), "FA Posting Category" = filter(<> Disposal)));

        }
        field(70159; FBM_ReplicaStatus; enum FBM_ReplicaStatus_DD)
        {
            caption = 'Replica Status';
            ObsoleteState = Removed;

        }
        field(70160; FBM_ReplicaStatus2; enum FBM_ReplicaStatus_DD)
        {
            caption = 'Replica Status';

        }
    }
    keys
    {

        key(k1; Version)
        {

        }
    }
    trigger
    OnAfterInsert()
    begin
        IF REC.FBM_ReplicaStatus2 = REC.FBM_ReplicaStatus2::" " THEN
            rec.FBM_ReplicaStatus2 := rec.FBM_ReplicaStatus2::Pending;
        // rec.Modify();

    end;

    var
        FA: Record "Fixed Asset";
        Text000: Label 'Fixed Asset %1 has the same Serial No.!';

    procedure IncVersion()
    var
        fixass: record FBM_FAHistory_DD;
        fixass2: record FBM_FAHistory_DD;
        maxver: Integer;
        stop: Boolean;
    begin
        commit;
        fixass.setrange("No.", rec."No.");


        if fixass.FindLast() then begin
            maxver := fixass.Version;
            if fixass."Valid From" = Today then
                stop := true;
        end
        else
            stop := true;

        if not stop then begin
            fixass."Valid To" := Today;



            fixass2.init;
            fixass2.TransferFields(fixass, true);
            fixass.rename(fixass."No.", fixass.version, false);

            fixass2.Insert(false);
            fixass2.rename(fixass2."No.", maxver + 1, true);

            fixass2.Description := rec.Description;
            fixass2."Serial No." := rec."Serial No.";
            fixass2."FA Location Code" := rec."FA Location Code";
            fixass2."FA Class Code" := rec."FA Class Code";
            fixass2."FA Subclass Code" := rec."FA Subclass Code";
            fixass2.FBM_Model := rec.FBM_Model;
            fixass2.FBM_Segment2 := rec.FBM_Segment2;
            fixass2.FBM_Brand := rec.FBM_Brand;
            fixass2.FBM_Lessee := rec.FBM_Lessee;
            fixass2.FBM_Status := rec.FBM_Status;
            fixass2.FBM_Site := rec.FBM_Site;
            fixass2.FBM_DatePrepared := rec.FBM_DatePrepared;
            fixass2."Valid From" := Today;
            fixass2."Valid To" := DMY2Date(31, 12, 2999);
            fixass2."Record Owner" := UserId;
            fixass2.FBM_AcquisitionCost := rec.FBM_AcquisitionCost;
            fixass2.FBM_AcquisitionDate := rec.FBM_AcquisitionDate;

            fixass2.Modify();
            fixass2.setrange(Description, '');
            fixass2.DeleteAll();
            rec.Version := fixass2.Version;
            rec.Modify();
        end
        else
            if not fixass.IsEmpty then begin
                fixass.Description := rec.Description;
                fixass."Serial No." := rec."Serial No.";
                fixass."FA Location Code" := rec."FA Location Code";
                fixass."FA Class Code" := rec."FA Class Code";
                fixass."FA Subclass Code" := rec."FA Subclass Code";
                fixass.FBM_Model := rec.FBM_Model;
                fixass.FBM_Segment2 := rec.FBM_Segment2;
                fixass.FBM_Brand := rec.FBM_Brand;
                fixass.FBM_Lessee := rec.FBM_Lessee;
                fixass.FBM_Status := rec.FBM_Status;
                fixass.FBM_Site := rec.FBM_Site;
                fixass.FBM_DatePrepared := rec.FBM_DatePrepared;
                fixass."Record Owner" := UserId;
                fixass.FBM_AcquisitionCost := rec.FBM_AcquisitionCost;
                fixass.FBM_AcquisitionDate := rec.FBM_AcquisitionDate;
                fixass.Modify();
            end;



    end;


}

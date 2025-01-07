tableextension 70038 FBM_RevEntryExt_DD extends "Reservation Entry"
{
    fields
    {
        field(70100; FBM_Site; code[20])
        {
            Caption = 'Site';
            TableRelation = FBM_CustomerSite_C."Site Code";
            ValidateTableRelation = false;
        }
        field(70101; FBM_BinCode; Code[20])
        {
            Caption = 'Bin Code';


        }
        field(70131; "FBM_Pedimento1"; Text[2])
        {
            Caption = 'Año Validaciòn [2]';
            //ObsoleteState = Removed;


        }
        field(70132; "FBM_Pedimento2"; Text[2])
        {
            Caption = 'Aduana Despacho [2]';
            //ObsoleteState = Removed;


        }
        field(70133; "FBM_Pedimento3"; Text[4])
        {
            Caption = 'Nro Patente [4]';

        }
        field(70134; "FBM_Pedimento4"; Text[7])
        {
            Caption = 'Nro Progr. de Despacho [6]';
            ObsoleteState = Removed;

        }
        field(70135; "FBM_Pedimento"; Text[18])
        {
            Caption = 'Pedimento';
            Editable = false;
            ObsoleteState = Removed;
        }
        field(70136; "FBM_Pedimentobis"; Text[18])
        {
            Caption = 'Pedimento 2';
            Editable = false;

        }
        field(70137; "FBM_Pedimento12"; Text[3])
        {
            Caption = 'Ped Alpha [3]';


        }
        field(70138; "FBM_Pedimento34"; Text[1])
        {
            Caption = 'Ultimo digito año en curso [1]';


        }
        field(70139; "FBM_Pedimento42"; Text[6])
        {
            Caption = 'Nro Progr. de Despacho [6]';


        }
        field(70140; "FBM_Pedimento_2"; Text[22])
        {
            Caption = 'Pedimento';
            Editable = false;

        }
        field(70003; FBM_MachineType; enum FBM_MachineType_DD)
        {

            Caption = 'Machine Type';


        }
    }

}
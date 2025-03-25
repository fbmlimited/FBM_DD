// table 70016 FBM_CustSiteReq_DD
// {
//     DataClassification = ToBeClassified;
//     DataPerCompany = false;
//     ObsoleteState = Removed;

//     fields
//     {
//         field(1; EntryNo; biginteger)
//         {
//             AutoIncrement = true;
//             caption = 'Registro';
//         }
//         field(2; ReqType; Option)
//         {
//             OptionMembers = "",Edit,New;
//             OptionCaption = ',Cambio,Nuevo';
//             caption = 'Tipo';
//         }
//         field(3; CustCode; code[20])
//         {
//             TableRelation = customer.FBM_GrCode;
//             ValidateTableRelation = false;
//             caption = 'Cod. Cliente';
//         }
//         field(4; Name; Text[100])
//         {
//             caption = 'Nombre';
//         }
//         field(5; "Name 2"; Text[100])
//         {
//             caption = 'Nombre 2';
//         }
//         field(6; Address; Text[100])
//         {
//             caption = 'Direccion';
//         }
//         field(7; "Address 2"; Text[100])
//         {
//             caption = 'Direccion 2';
//         }
//         field(8; City; Text[30])
//         {
//             caption = 'Ciudad';
//         }
//         field(9; "Post Code"; Text[20])
//         {
//             caption = 'Cod. Postal';
//         }
//         field(10; County; Text[30])
//         {
//             caption = 'Estado';
//         }
//         field(11; "Country/Region Code"; code[10])
//         {
//             caption = 'Pais';
//         }
//         field(12; "VAT registration No."; Text[20])
//         {
//             caption = 'RFC';
//         }
//         field(13; FBM_Group; Text[100])
//         {
//             caption = 'Grupo';
//             TableRelation = FBM_CustGroup where(IsGroup = const(true));
//         }
//         field(14; FBM_Subgroup; Text[100])
//         {
//             caption = 'SubGrupo';
//             TableRelation = FBM_CustGroup where(Group = field(FBM_Group), IsGroup = const(false));
//         }
//         field(15; Sender; code[50])
//         {
//             caption = 'Remitente';
//         }
//         field(16; Sent; DateTime)
//         {
//             caption = 'Enviado';
//         }
//         field(17; Status; enum FBM_ReqStatus_DD)
//         {
//             caption = 'Status';
//         }
//         field(18; Rectype; code[20])
//         {
//             caption = 'Tipo';
//         }
//         field(19; companyReq; code[3])
//         {
//             caption = 'Fuente';
//         }
//         field(20; Ori_EntryNo; biginteger)
//         {

//             caption = 'Registro Original';
//         }
//     }

//     keys
//     {
//         key(PK; EntryNo)
//         {
//             Clustered = true;
//         }
//     }

// }
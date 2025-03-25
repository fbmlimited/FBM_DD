permissionset 70000 Global
{
    Assignable = true;
    Caption = 'PermSet';

    Permissions =
        tabledata FBM_ApprovalEntryM = RIMD,
        tabledata FBM_CustGroup = RIMD,
        tabledata FBM_CustLE = RIMD,
        tabledata FBM_Customer = RIMD,
        tabledata FBM_CustOpSite = RIMD,
        tabledata FBM_FinAttributes = RIMD,
        tabledata FBM_SalesInvLineTmp = RIMD,
        tabledata FBM_Site = RIMD,
        tabledata FBM_Subsidiary = RIMD,
        tabledata FBM_TermsConditions = RIMD,
        tabledata FBM_VendorLEM = RIMD,
        tabledata FBM_WSBuffer = RIMD,
        tabledata FBM_BankAccountTMP = RIMD,
        tabledata FBM_CustomerSite_C = RIMD,

        tabledata FBM_ListValues = RIMD,
        tabledata FBM_CustSiteReq = RIMD,
        tabledata FBM_CustomerSite_Ctmp = RIMD,
        tabledata FBM_FAHistory_DD = RIMD;
}
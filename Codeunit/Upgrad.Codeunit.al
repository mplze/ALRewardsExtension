codeunit 50106 RewardsUpgradeCode
{
    Subtype = Upgrade;



    trigger OnCheckPreconditionsPerCompany()
    var
        myInt: Integer;
    begin

    end;

    trigger OnUpgradePerCompany();
    var
        InstallCode: Codeunit Install;
        UpgradeHelper: Codeunit "NGA Upgrade Helper";
        UpgradeTagMgt: Codeunit "Upgrade Tag";
        Reward: Record Reward;
        Module: ModuleInfo;
    begin
        #region Base on Vertion
        //NavApp.GetCurrentModuleInfo(Module); // Get information about the current module.
        // in 2 version  upgrad BRONZE to PLATINUM reward level.
        // if Module.DataVersion.Revision = 2 then begin
        //     UpdateReward()
        // end;
        #endregion

        #region upgrade Tag with Exit
        /*  if UpgradeTagMgt.HasUpgradeTag(NGAUpgrade.GetRewardUpgradeTag()) then
             exit; */
        #endregion

        #region if not Update
        // Check whether the tag has been used before, and if so, don't run upgrade code
        if Not UpgradeTagMgt.HasUpgradeTag(UpgradeHelper.GetRewardUpgradeTag()) then begin
            UpgradeHelper.UpdatePLATINUM();
            // Insert the upgrade tag in table 9999 "Upgrade Tags" for future reference
            UpgradeTagMgt.SetUpgradeTag(UpgradeHelper.GetRewardUpgradeTag());
        end;
        #endregion

        #region Multiple Update Tag
        /* if Not UpgradeTagMgt.HasUpgradeTag(NGAUpgrade.GetRewardUpgradeTag2()) then begin
            UpgradeHelper.AddSuper();
            // Insert the upgrade tag in table 9999 "Upgrade Tags" for future reference
            UpgradeTagMgt.SetUpgradeTag(NGAUpgrade.GetRewardUpgradeTag2());
        end; */
        #endregion

    end;

    trigger OnValidateUpgradePerCompany()
    var
        myInt: Integer;
    begin

    end;

    trigger OnCheckPreconditionsPerDatabase()
    var
        myInt: Integer;
    begin

    end;

    trigger OnUpgradePerDatabase()
    var
        myInt: Integer;
    begin

    end;



    trigger OnValidateUpgradePerDatabase()
    var
        myInt: Integer;
    begin

    end;


}
codeunit 50105 Install
{
    Subtype = Install;

    trigger OnInstallAppPerCompany();
    var
        Reward: Record Reward;
        UpgradeTag: Codeunit "Upgrade Tag";
        UpgradeHelper: Codeunit "NGA Upgrade Helper";
    begin

        if not UpgradeTag.HasUpgradeTag(UpgradeHelper.GetRewardUpgradeTag()) then begin
            if Reward.IsEmpty() then begin
                UpgradeHelper.InsertDefaultRewards();
                UpgradeTag.SetUpgradeTag(UpgradeHelper.GetRewardUpgradeTag());
            end;
        end;

    end;

    trigger OnInstallAppPerDatabase()
    var
        myInt: Integer;
    begin

    end;






}
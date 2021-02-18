codeunit 50100 "NGA Upgrade Helper"
{
    // Register the new upgrade tag for new companies when they are created.
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Upgrade Tag", 'OnGetPerCompanyUpgradeTags', '', false, false)]
    local procedure OnGetPerCompanyTags(var PerCompanyUpgradeTags: List of [Code[250]]);
    begin
        PerCompanyUpgradeTags.Add(GetRewardUpgradeTag());
    end;

    // Use methods to avoid hard-coding the tags. It is easy to remove afterwards because it's compiler-driven.
    procedure GetRewardUpgradeTag(): Text
    begin
        exit('SCY-002-RewardUpgrade-20201125');
        // [CompanyPrefix]-[ID]-[Description]-[YYYYMMDD], 
        //for example, ABC-1234-MyExtensionUpgrade-20201206.
    end;

    /*  procedure GetRewardUpgradeTag2(): Text
     begin
         exit('SCY-003-RewardUpgrade-20201125');
         // [CompanyPrefix]-[ID]-[Description]-[YYYYMMDD], 
         //for example, ABC-1234-MyExtensionUpgrade-20201206.
     end; */


    procedure UpdatePLATINUM()
    var
        Reward: Record Reward;
    begin
        Reward.Get('BRONZE');
        Reward.Rename('PLATINUM');
        Reward.Description := 'platinum Level';
        Reward.Modify();
    end;

    procedure AddSuper()
    var
        Reward: Record Reward;
    begin
        Reward.Init();
        Reward."Reward ID" := 'SUPER';
        Reward.Description := 'Super Level';
        Reward.Insert();
    end;

    // Insert the GOLD, SILVER, BRONZE reward levels
    procedure InsertDefaultRewards();
    begin
        InsertRewardLevel('GOLD', 'Gold Level', 20);
        InsertRewardLevel('SILVER', 'Silver Level', 10);
        InsertRewardLevel('BRONZE', 'Bronze Level', 5);
    end;


    procedure InsertRewardLevel(ID: Code[30]; Description: Text[250]; Discount: Decimal);
    var
        Reward: Record Reward;
    begin
        Reward.Init();
        Reward."Reward ID" := ID;
        Reward.Description := Description;
        Reward."Discount Percentage" := Discount;
        Reward.Insert();
    end;



}
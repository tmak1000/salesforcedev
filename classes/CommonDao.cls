/**
 * Hack Challenge 2014
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class CommonDao {

    /**
     * 組織のアドレス取得
     */
    public static OrgWideEmailAddress getOrgWideEmailAddress(String prmDisplayName) {
        List<OrgWideEmailAddress> orgWideEmailAddresses = [
            SELECT
                 Id
            FROM
                OrgWideEmailAddress
            WHERE
                DisplayName =: prmDisplayName
            LIMIT 1
        ];
        
        return orgWideEmailAddresses.isEmpty() ? new OrgWideEmailAddress() : orgWideEmailAddresses[0];
    }
}
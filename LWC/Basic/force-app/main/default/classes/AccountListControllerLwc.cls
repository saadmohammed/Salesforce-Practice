public with sharing class AccountListControllerLwc {
    @AuraEnabled(cacheable=true)
    public static List<Account> queryAccountsByRevenue(Decimal annualRevenue) {
        return [
            SELECT Name
            FROM Account
            WHERE  AnnualRevenue >= :annualRevenue
        ];
   }
}

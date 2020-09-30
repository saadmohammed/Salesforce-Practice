public class AssetController {
    
    @AuraEnabled(cacheable=true)
    public static List<Invoice__c> getAsset() {
        return [SELECT Id, Name, ItemName__c, Weight__c,
        Mobile__c, Status__c, Total__c, ShippingDateTime__c
            FROM Invoice__c];
    }

    @AuraEnabled(cacheable=true)  
    public static List<sobject> findRecords(String searchKey, String objectName) {  
     string searchText = '\'' + String.escapeSingleQuotes(searchKey) + '%\'';  
     string query = 'SELECT Id, Name FROM ' +objectName+ ' WHERE Name LIKE '+searchText+' LIMIT 6';  
     return Database.query('SELECT Id, Name FROM ' +objectName+ ' WHERE Name LIKE '+searchText+' LIMIT 6');  
   } 
}
public class InvoiceController {
    
    @AuraEnabled
    public static void insertInvoice(Invoice__c invoice, String name){
        try{
            Driver__c driverId = [select name, id from Driver__c where name =: name];
            invoice.Driver__c =  driverId.Id;
            insert invoice;
        }
        catch(Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
    }

    @AuraEnabled(Cacheable=true)
     public static Driver__c[] getAllName() {

       return [SELECT Name, Id FROM Driver__c];

    }

    @AuraEnabled
    public static Id getDriverId(String name){
        Driver__c driverId = [select name, id from Driver__c where name =: name];
        return driverId.Id;
    }
}
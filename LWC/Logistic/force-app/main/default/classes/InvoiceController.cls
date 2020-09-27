public class InvoiceController {
    
    @AuraEnabled
    public static void insertInvoice(Invoice__c invoice){
        try{
            insert invoice;
        }
        catch(Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
    }
}

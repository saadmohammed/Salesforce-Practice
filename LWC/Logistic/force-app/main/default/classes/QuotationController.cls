public class QuotationController {
    
    @AuraEnabled(Cacheable=true)
     public static Cities__c[] getAllName() {

       return [SELECT Name FROM Cities__c];

    }

    @AuraEnabled(Cacheable=true)
    public static String getQuotationParcel(String name) {
        String qoutename = name ; 
        String parcel;
        List<Quotation__c> list_qoute = [SELECT Parcel__c FROM Quotation__c WHERE Name LIKE : qoutename];
        for(Quotation__c q : list_qoute){
            parcel = q.Parcel__c;
        }
        
        return parcel;
    }

    @AuraEnabled(Cacheable=true)
    public static String getQuotationDocument(String name) {
        String qoutename = name ; 
        String document;
        List<Quotation__c> list_qoute = [SELECT Document__c FROM Quotation__c WHERE Name LIKE : qoutename];
        for(Quotation__c q : list_qoute){
            document = q.Document__c;
        }
        
        return document;
    }




}

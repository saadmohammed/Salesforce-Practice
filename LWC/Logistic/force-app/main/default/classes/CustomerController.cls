public class CustomerController {

    @AuraEnabled
    public static void insertCustomer(Customer__c customer){
        try{
            insert customer;
        }
        catch(Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
    }

    @AuraEnabled(Cacheable=true)
    public static Customer__c[] getAllEvents() {

       return [SELECT Name, Id FROM Customer__c  ];

    }
}
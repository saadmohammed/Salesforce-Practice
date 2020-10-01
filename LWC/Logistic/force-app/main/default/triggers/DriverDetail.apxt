trigger DriverDetail on Invoice__c (after insert) {
    EmailManagerDriver.sendMail(Trigger.New);
}
public with sharing class BillTrigger2Handler {
    public BillTrigger2Handler() {
       
    }
    public void onBeforeInsertAccountCheck(List<Bill__c> lstNew) {
        system.debug('Bahar123');
        //Check the Account__c field is not null
        for( Bill__c eachBill : lstNew){
            if(eachBill.Account__c == null){
                eachBill.Account__c.addError('Please select the Account');
            }
        }
    }
   //Invoice Number Autopopulation 
   //Ensure the Invoice_Number__c field has a value when it is created. 
   public void onBeforeInsertInvoiceNumberCreation(List<Bill__c> lstNew){
    for(Bill__c eachBill : lstNew){
        if(eachBill.Invoice_Number__c == null){
            eachBill.Invoice_Number__c = String.valueOf(Integer.valueof((Math.random() * 100000)));
        }
    }
}
}
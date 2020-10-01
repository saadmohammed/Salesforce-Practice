public class GenerateInvoice {
 public Id invoiceId {get;set;}
  
  public List<SelectOption> invoices {
    get {
      if (invoices == null) {
        invoices = new List<SelectOption>();
        for(Invoice__c invoice : [SELECT Id,Name FROM Invoice__c WHERE Status__c = 'placed']){

            invoices.add(new SelectOption(invoice.Id,invoice.Name));
        }	
      }
      return invoices;
    }
    set;
  }
    
    public PageReference sendPdf() {
    
   		PageReference pdf = Page.PdfGeneratorTemplate;
    	// add parent id to the parameters for standardcontroller
    	pdf.getParameters().put('id',invoiceId);
        return pdf;
    }
}
import { LightningElement, track, wire } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import insertInvoice from '@salesforce/apex/InvoiceController.insertInvoice'
import getAllName from '@salesforce/apex/InvoiceController.getAllName';
import getDriverId from '@salesforce/apex/InvoiceController.getDriverId';
export default class Invoice extends LightningElement {

  @track error;

  value = '';
  valueText = "Select Driver";
  Total;
  driverName;

  /*
   * Field of invoice
   */
  @track
  invoiceRecord = {
    Name: '',
    Mobile__c: '',
    Email__c: '',
    Status__c: '',
    ItemName__c: '',
    Weight__c: '',
    Rateperkg__c: '',
    Total__c: this.Total,
    PickupStreet__c: '',
    PickupCity__c: '',
    PickupProvince__c: '',
    PickupPostalCode__c: '',
    PickupCountry__c: '',
    PickupDateTime__c: '',
    ShippingStreet__c: '',
    ShippingCity__c: '',
    ShippingProvince__c: '',
    ShippingPostalCode__c: '',
    ShippingCountry__c: '',
    ShippingDateTime__c: ''
  }
  hanldeName(event) {
    this.invoiceRecord.Name = event.target.value;
  }
  hanldeMobile(event) {
    this.invoiceRecord.Mobile__c = event.target.value;
  }
  hanldeEmail(event) {
    this.invoiceRecord.Email__c = event.target.value;
  }
  hanldeStatus(event) {
    this.invoiceRecord.Status__c = event.target.value;
  }
  handlePickupLocation(event) {

    this.invoiceRecord.PickupStreet__c = event.target.street;
    this.invoiceRecord.PickupCity__c = event.target.city;
    this.invoiceRecord.PickupProvince__c = event.target.province;
    this.invoiceRecord.PickupCountry__c = event.target.country;
    this.invoiceRecord.PickupPostalCode__c = event.target.postalCode;
  }
  handlePickupDateTime(event) {
    this.invoiceRecord.PickupDateTime__c = event.target.value;
  }
  handleShippingLocation(event) {
    this.invoiceRecord.ShippingStreet__c = event.target.street;
    this.invoiceRecord.ShippingCity__c = event.target.city;
    this.invoiceRecord.ShippingProvince__c = event.target.province;
    this.invoiceRecord.ShippingCountry__c = event.target.country;
    this.invoiceRecord.ShippingPostalCode__c = event.target.postalCode;
  }
  handleShippingDateTime(event) {
    this.invoiceRecord.ShippingDateTime__c = event.target.value;
  }
  handleItemName(event) {
    this.invoiceRecord.ItemName__c = event.target.value;
  }
  handleWeigth(event) {
    this.invoiceRecord.Weight__c = event.target.value;
  }
  handleRateperkg(event) {
    this.invoiceRecord.Rateperkg__c = event.target.value;
  }
  calculate() {
    this.Total = this.invoiceRecord.Weight__c * this.invoiceRecord.Rateperkg__c;

    // console.log(this.amount);  
  }

  @wire(getAllName)
  nameList

  get driverOptions(){
    var returnOptions = [];
    if (this.nameList.data) {
      this.nameList.data.forEach(ele => {
        returnOptions.push({
          label: ele.Name,
          value: ele.Name
        });
      });
    }
    // console.log(JSON.stringify(returnOptions));
    return returnOptions;
  }

  handleDriverChange(event){
    this.value = event.detail.value;
    this.valueText = "From Selected";
    this.driverName = event.detail.value;
  }

  

  handleSave() {  
    insertInvoice({invoice: this.invoiceRecord, name: this.driverName})
      .then(result => {
          console.log(JSON.stringify(result));
          // Show success messsage
          this.dispatchEvent(new ShowToastEvent({
              title: 'Success!!',
              message: 'Invoice Created Successfully!!',
              variant: 'success'
          }),);
          this.invoiceRecord = {}
      })
      .catch(error => {
          console.log(error);
      });

  }


}
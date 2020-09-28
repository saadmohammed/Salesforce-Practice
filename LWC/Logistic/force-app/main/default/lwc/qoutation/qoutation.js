import {
  LightningElement,
  track,
  wire
} from 'lwc';
import getAllName from '@salesforce/apex/QuotationController.getAllName';
import getQuotationParcel from '@salesforce/apex/QuotationController.getQuotationParcel';
import getQuotationDocument from '@salesforce/apex/QuotationController.getQuotationDocument';

export default class Qoutation extends LightningElement {

  value = '';
  valueText = "Select From";
  isDisabled = true;
  @track toOptions = [];
  fromChar;
  toChar;
  rateParcel;
  rateDocument;
  Kilogram;
  Total;
  qoutename;

  @wire(getAllName)
  nameList;


  get fromOptions() {
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

  handleFromChange(event) {
    this.value = event.detail.value;
    this.isDisabled = false;
    this.valueText = "From Selected";
    this.toOptions = this.fromOptions.filter(d => d.value != this.value);
    this.fromChar = event.detail.value;
    console.log('FROM => ' + this.fromChar.charAt(0));
  }


  handleToChange(event) {
    this.value = event.detail.value;
    this.valueText = "To Selected";
    this.toChar = event.detail.value;
    console.log('TO => ' + this.toChar.charAt(0));
    this.qoutename = this.fromChar.charAt(0) + "-" + this.toChar.charAt(0);
    console.log(this.qoutename);

    getQuotationParcel({
        name: this.qoutename
      })
      .then(result => {
        this.rateParcel = result;
        console.log(this.rateParcel);
      });
    getQuotationDocument({
        name: this.qoutename
      })
      .then(result => {
        this.rateDocument = result;
        console.log(this.rateDocument);
      });

  }

  handleKilogramChange(event) {
    this.Kilogram = event.target.value;
    console.log(this.Kilogram);

  }

  calculate() {
    this.Total = this.Kilogram * this.rateParcel;
  }









}
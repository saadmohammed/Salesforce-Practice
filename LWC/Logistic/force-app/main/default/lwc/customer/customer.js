import { LightningElement, track, wire} from 'lwc';
import getAllEvents from '@salesforce/apex/CustomerController.getAllEvents';
// Importing Apex Class method
import insertCustomer from '@salesforce/apex/CustomerController.insertCustomer';

// importing to show toast notifictions
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class Customer extends LightningElement {
    @track error;

    // this object have record information
    @track 
    customerRecord = {
        Name : '',
        Mobile__c : '',
        Door_No__c : "",
        Street__c : '',
        Area__c : '',
        City__c : '',
        Pincode__c : ''
    };


    handleNameChange(event) {
        this.customerRecord.Name = event.target.value;
        console.log('Name ==> '+this.customerRecord.Name);
    }

    handleMobileChange(event) {
        this.customerRecord.Mobile__c = event.target.value;
        console.log('Phone ==> '+this.customerRecord.Mobile);
    }

    handleDoorNoChange(event) {
        this.customerRecord.Door_No__c = event.target.value;
        window.console.log('Type ==> '+this.customerRecord.DoorNo);
    }

    handleStreetChange(event) {
        this.customerRecord.Street__c = event.target.value;
        window.console.log('Industry ==> '+this.customerRecord.Street);
    }

    handleAreaChange(event) {
      this.customerRecord.Area__c = event.target.value;
      console.log('Name ==> '+this.customerRecord.Area);
    }

    handleCityChange(event) {
      this.customerRecord.City__c = event.target.value;
      console.log('Name ==> '+this.customerRecord.City);
   }   

   handlePincodeChange(event) {
    this.customerRecord.Pincode__c = event.target.value;
    console.log('Name ==> '+this.customerRecord.Pincode);
   }
  


    handleSave() {
     
      insertCustomer({customer: this.customerRecord})
        .then(result => {
            // Clear the user enter values
            // console.log('result ===> '+result);
            
            // Show success messsage
            this.dispatchEvent(new ShowToastEvent({
                title: 'Success!!',
                message: 'Bill Created Successfully!!',
                variant: 'success'
            }),);
            this.customerRecord = {};
        })
        .catch(error => {
            this.error = error.message;
        });

    }

// value = 'inProgress';
// valueText = "Select Event";

// @wire(getAllEvents)
// eventsList;

// get eventOptions() {
//     var returnOptions = [];
//     if(this.eventsList.data){
//         this.eventsList.data.forEach(ele =>{
//             returnOptions.push({label:ele.Name , value:ele.Name});
//         }); 
//     }
//     console.log(JSON.stringify(returnOptions));
//     return returnOptions;
// }

//  handleEventMgrChange(event) {
//     this.value = event.detail.value;
//     this.valueText = "Event Selected";        
//  }
//  get hasResults() {
//     return (this.eventsList.data.length > 0);
//  }
}





import { LightningElement, wire, track, api } from 'lwc';
import getAsset from '@salesforce/apex/AssetController.getAsset';
import { refreshApex } from '@salesforce/apex';
import { updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Asset extends LightningElement {
    
    @track columns = [{
            label: 'Item name',
            fieldName: 'ItemName__c',
            type: 'text',
            sortable: true
        },
        {
            label: 'Customer Name',
            fieldName: 'Name',
            type: 'text',
            sortable: true
        },
        {
            label: 'Weight',
            fieldName: 'Weight__c',
            type: 'number',
            sortable: true
        },
        {
            label: 'Mobile',
            fieldName: 'Mobile__c',
            type: 'phone',
            sortable: true
        },
        {
            label: 'Status',
            fieldName: 'Status__c',
            type: 'text',
            sortable: true,
            editable: true
        },
        {
            label: 'Amount',
            fieldName: 'Total__c',
            type: 'number',
            sortable: true
        },
        {
            label: 'Shipping DateTime',
            fieldName: 'ShippingDateTime__c',
            type: 'date',
            editable: true,
            typeAttributes: {
                day: "numeric",
                month: "numeric",
                year: "numeric"
            }
        }
        
    ];

    error;
    assetResponse;
    @track assetList;
    draftValues = [];
    
    @wire(getAsset)
    wiredAccounts(response) {
     this.assetResponse = response;
     let data = response.data;
     let error = response.error;
        if (data) {
            this.assetList = data;
            console.log(this.assetList);
        } else if (error) {
            this.error = error;
        }
    }

    handleSave(event) {
        const recordInputs =  event.detail.draftValues.slice().map(draft => {
            const fields = Object.assign({}, draft);
            return { fields };
        });
   
        const promises = recordInputs.map(recordInput => updateRecord(recordInput));
       
        Promise.all(promises).then(contacts => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Asset updated',
                    variant: 'success'
                })
            );
             // Clear all draft values
             this.draftValues = [];
   
             // Display fresh data in the datatable
             return refreshApex(this.assetResponse);
        }).catch(error => {
            // Handle error
        });
    }
}
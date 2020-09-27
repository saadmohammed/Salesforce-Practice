import { LightningElement, wire, api, track } from 'lwc';
export default class BoatSearch extends NavigationMixin(LightningElement) {  
    @track isLoading = true;
    
    handleLoading()
    {
        this.isLoading = true;
    } 
    handleDoneLoading()
    {
        this.isLoading = false;
    }
    createNewBoat() {
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Boat__c',
                actionName: 'new'
            }
        });
    }
    searchBoats(event) { 
      const boatTypeId = event.detail.boatTypeId;
      this.template.querySelector("c-boat-search-results").searchBoats(boatTypeId);
    }
}
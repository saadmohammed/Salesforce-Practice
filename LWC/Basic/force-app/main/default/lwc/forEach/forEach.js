import { LightningElement } from 'lwc';

export default class ForEach extends LightningElement {
    contacts = [
        {
            id: 1,
            Name: "Saad",
            Title: "CEO"
        },
        {
            id: 2,
            Name: "Ammar",
            Title: "CFO"
        }
    ];
}
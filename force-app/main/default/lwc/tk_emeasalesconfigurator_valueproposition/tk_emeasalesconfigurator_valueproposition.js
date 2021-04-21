import { LightningElement } from 'lwc';

import TK_Configurator_Images from '@salesforce/resourceUrl/TKVisualConfiguratorImages';
import { NavigationMixin } from 'lightning/navigation';


export default class LightningExampleLayoutNested extends NavigationMixin(LightningElement) {
    img_url1= TK_Configurator_Images + '/placeholder.png';
     handleNavigate() {
        var compDefinition = {
            componentDef: "c:tk_emeasalesconfigurator_pagedirect1",
            attributes: {
                propertyValue: "500"
            }
        };
        var encodedCompDef = btoa(JSON.stringify(compDefinition));
        this[NavigationMixin.Navigate]({
            type: 'standard__webPage',
            attributes: {
                url: '/one/one.app#' + encodedCompDef
            }
        });
    }
    
}
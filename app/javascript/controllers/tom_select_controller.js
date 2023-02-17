import { Controller } from 'stimulus';
import TomSelect from 'tom-select';

export default class extends Controller {
  connect() {
    console.log("Tom Select Controller started")
    debugger;
    const options = {
      // Add any Tom Select options and plugins here
    };
    this.select = new TomSelect(this.element, options);
  }
}

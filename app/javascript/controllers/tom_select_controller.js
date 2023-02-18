import { Controller } from 'stimulus';
import TomSelect from 'tom-select';

export default class extends Controller {
  static values = { options: Object }

  connect() {
    // console.log("Tom Select Controller started")
    // debugger;
    // const options = {
    //   // Add any Tom Select options and plugins here
    // };
    // this.select = new TomSelect(this.element, options);


    new TomSelect(
      this.element ,
      this.optionsValue
    );
  }
}

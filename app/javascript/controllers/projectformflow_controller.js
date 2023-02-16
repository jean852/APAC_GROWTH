import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "step0", "step1", "step2", "step2a", "step2b", "step3", "option1", "option2", "option3", "option2a", "option2b", "selection1", "selection2", "continue1" ]
  connect() {
    console.log("Project Form Flow Launched");
  }


  to_level2() {
    console.log("Sending to level 2")
    this.step0Target.classList.add("d-none")

    if ( this.step0Target.value == "OPTION1" ) {
      this.step1Target.classList.remove("d-none")
      console.log("Level 2 with option 1")
    }

    if ( this.step0Target.value == "OPTION2" ) {
      this.step2Target.classList.remove("d-none")
      console.log("Level 2 with option 2")
    }

    if ( this.step0Target.value == "OPTION3" ) {
      this.step3Target.classList.remove("d-none")
      console.log("Level 2 with option 3")
    }
  }


  to_level3() {
    console.log("Sending to level 3")
    // HIDE LEVEL 2

    // CHECKED LEVEL 2 STORED VALUE


    // SHOW THE RIGHT ECTION 2A or 2B

  }


  // LEVEL 1 SELECTION
  select1() {
    console.log("Option 1 selected")
    this.step0Target.value="OPTION1"
    this.option1Target.classList.add("toggled-card")
    this.option2Target.classList.remove("toggled-card")
    this.option3Target.classList.remove("toggled-card")
    this.continue1Target.classList.remove("d-none")
    console.log( this.step0Target.value )

  }

  select2() {
    console.log("Option 2 selected")
    this.step0Target.value="OPTION2"
    this.option1Target.classList.remove("toggled-card")
    this.option2Target.classList.add("toggled-card")
    this.option3Target.classList.remove("toggled-card")
    this.continue1Target.classList.remove("d-none")
    console.log( this.step0Target.value )
  }

  select3() {
    console.log("Option 3 selected")
    this.step0Target.value="OPTION3"
    this.option1Target.classList.remove("toggled-card")
    this.option2Target.classList.remove("toggled-card")
    this.option3Target.classList.add("toggled-card")
    this.continue1Target.classList.remove("d-none")
    console.log( this.step0Target.value )
  }

  // LEVEL 2 SELECTION




  //  to_step2() {
  //    console.log("next_step")
  //    this.step1Target.classList.add("d-none")
  //    let type = document.querySelector("#challenge_activity_type")
  //    if (type.value == "RUNNING") {
  //    this.step2Target.classList.remove("d-none");
  //   } else {
  //     this.step2Target.classList.remove("d-none");
  //   }
  //  }
  // to_step3() {
  //   console.log("next_step3")
  //     this.step2Target.classList.add("d-none");
  //     this.step3Target.classList.remove("d-none");
  //    let challengeType = document.querySelector("#challenge_challenge_type")
  //    if (challengeType.value == "KM") {
  //     this.step3DistanceTarget.classList.remove("d-none");
  //    } else {
  //      this.step3SessionsTarget.classList.remove("d-none");
  //    }
  //   }
  // to_step4() {
  //   console.log("next_step4")
  //   this.step3DistanceTarget.classList.add("d-none")
  //   this.step3SessionsTarget.classList.add("d-none")
  //   this.step3Target.classList.add("d-none")
  //   this.step4Target.classList.remove("d-none")
  //   }
  }

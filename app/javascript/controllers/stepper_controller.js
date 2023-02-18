import { Controller } from "stimulus";

export default class StepperController extends Controller {
  static targets = ["formStep", "progress", "progressStep"];
  static values = { formStepsNum: Number };

  connect() {
    this.updateFormSteps();
    this.updateProgressbar();
  }

  nextStep() {
    this.formStepsNumValue++;
    this.updateFormSteps();
    this.updateProgressbar();
  }

  prevStep() {
    this.formStepsNumValue--;
    this.updateFormSteps();
    this.updateProgressbar();
  }

  updateFormSteps() {
    this.formStepTargets.forEach((formStep) => {
      formStep.classList.contains("form-step-active") &&
        formStep.classList.remove("form-step-active");
    });

    this.formStepTargets[this.formStepsNumValue].classList.add(
      "form-step-active"
    );
  }

  updateProgressbar() {
    this.progressStepTargets.forEach((progressStep, idx) => {
      if (idx < this.formStepsNumValue + 1) {
        progressStep.classList.add("progress-step-active");
      } else {
        progressStep.classList.remove("progress-step-active");
      }
    });

    const progressActive = document.querySelectorAll(".progress-step-active");

    this.progressTarget.style.width =
      ((progressActive.length - 1) / (this.progressStepTargets.length - 1)) *
      100 +
      "%";
  }
}

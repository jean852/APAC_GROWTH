import React, { useState } from "react";

const TestComponent = () => {
  const [value, setValue] = useState("");
  const [checkboxValues, setCheckboxValues] = useState({});
  const [selectedOption, setSelectedOption] = useState("");

  const handleChange = (event) => {
    setValue(event.target.value);
  };

  const handleCheckboxChange = (event) => {
    setCheckboxValues({ ...checkboxValues, [event.target.name]: event.target.checked });
  };

  const handleSelectChange = (event) => {
    setSelectedOption(event.target.value);
  };

  return (
    <form>
      <div>
        <label htmlFor="text-field">Text Field:</label>
        <input type="text" id="text-field" value={value} onChange={handleChange} />
      </div>
      <div>
        <label htmlFor="checkbox-1">Checkbox 1:</label>
        <input
          type="checkbox"
          id="checkbox-1"
          name="checkbox-1"
          checked={checkboxValues["checkbox-1"] || false}
          onChange={handleCheckboxChange}
        />
      </div>
      <div>
        <label htmlFor="checkbox-2">Checkbox 2:</label>
        <input
          type="checkbox"
          id="checkbox-2"
          name="checkbox-2"
          checked={checkboxValues["checkbox-2"] || false}
          onChange={handleCheckboxChange}
        />
      </div>
      <div>
        <label htmlFor="dropdown">Dropdown:</label>
        <select id="dropdown" value={selectedOption} onChange={handleSelectChange}>
          <option value="">Select an option</option>
          <option value="option-1">Option 1</option>
          <option value="option-2">Option 2</option>
          <option value="option-3">Option 3</option>
        </select>
      </div>
    </form>
  );
};

export default TestComponent;

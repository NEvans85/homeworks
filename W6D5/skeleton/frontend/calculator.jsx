import React from "react";

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      result: 0,
      num1: "",
      num2: ""
    };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
  }

  //your code here

  render() {
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input onChange={this.setNum1} value={this.state.num1} />
        <input onChange={this.setNum2} value={this.state.num2} />
        <br />
        <button onClick={this.add}>Add</button>
        <button onClick={this.subtract}>Subtract</button>
        <button onClick={this.multiply}>Multiply</button>
        <button onClick={this.divide}>Divide</button>
      </div>
    );
  }

  setNum1(event) {
    const num1 = event.target.value ? parseInt(event.target.value) : "";
    this.setState({ num1 });
  }

  setNum2(event) {
    const num2 = parseInt(event.target.value);
    this.setState({ num2 });
  }

  add(event) {
    event.preventDefault();
    const result = this.state.num1 + this.state.num2;
    this.setState({ result });
  }

  subtract(event) {
    event.preventDefault();
    const result = this.state.num1 - this.state.num2;
    this.setState({ result });
  }
  multiply(event) {
    event.preventDefault();
    const result = this.state.num1 * this.state.num2;
    this.setState({ result });
  }
  divide(event) {
    event.preventDefault();
    const result = this.state.num1 / this.state.num2;
    this.setState({ result });
  }
}

export default Calculator;

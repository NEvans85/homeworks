import React from "react";
import { Route, Link, NavLink } from "react-router-dom";
import Indigo from "./indigo";

class Blue extends React.Component {
  render() {
    return (
      <div>
        <h2 className="blue" />
        <NavLink to="/blue/indigo">Add Indigo</NavLink>
        <NavLink exact to="/blue">
          Just Blue
        </NavLink>

        <Route path="/blue/indigo" component={Indigo} />
      </div>
    );
  }
}

export default Blue;
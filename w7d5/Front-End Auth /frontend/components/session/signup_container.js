import {connect} from "react-redux";
import {createUser} from "../../actions/session";
import SignUp from "./signup";

const mapDispatchToProp = dispatch => ({
  createUser: user => dispatch(createUser(user))
});

export default connect(null, mapDispatchToProp)(SignUp);

import * as APIUtil from "../utils/session.js";

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";

const receiveCurrentUser = (user) => ({
  type: RECEIVE_CURRENT_USER,
  user
});

const logoutCurrentUser = () => ({
  type: LOGOUT_CURRENT_USER
});

export const createUser = (user) => (dispatch) => (
  APIUtil.createUser(user)
    .then(user => dispatch(receiveCurrentUser(user)))
);

export const login = (user) => (dispatch) => (
  APIUtil.createSession(user)
  .then(user => dispatch(receiveCurrentUser(user)))
);

export const logout = () => (dispatch) => (
  APIUtil.deleteSession()
    .then(()=> dispatch(logoutCurrentUser()))
);

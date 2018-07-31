export const allTodos = (state) => {
  return Object.keys(state.todos).map((el)=>{
    return state.todos[el];
  });
};
window.allTodos = allTodos;
window.test = 'test';

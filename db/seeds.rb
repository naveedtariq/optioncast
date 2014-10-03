Goal.create!([
  {name: "Investment Management", order: 1},
  {name: "Create A Budget", order: 2},
  {name: "Invest For Retirement", order: 3},
  {name: "Manage Debt", order: 4}
])
Question.create!([
  {text: "When is your birthday?", order: 1, goal_id: nil, kind: "Date"},
  {text: "What is your current annual income?", order: 2, goal_id: nil, kind: "Value"},
  {text: "What is your retirement account balance (401k, IRAs)?", order: 3, goal_id: nil, kind: "Value"},
  {text: "What is your savings (excluding retirement accounts)?", order: 4, goal_id: nil, kind: "Value"},
  {text: "What is your total debt outstanding (excluding mortgage)?", order: 5, goal_id: nil, kind: "Value"}
])

R = [-inf,-inf,-inf,-inf,0,-inf;
-inf,-inf,-inf,0,-inf,100;
-inf,-inf,-inf,0,-inf,-inf;
-inf,0,0,-inf,0,-inf;
0,-inf,-inf,0,-inf,100;
-inf,0,-inf,-inf,0,100];

gamma = 0.7;
goal = 6;
q = zeros(size(R));

for episode = 1:1000
  y = randperm(size(R,1));
  state = y(1);
  
  while state ~= goal
    actions = find(R(state,:)>=0);
    if size(actions, 2)>0
      i = randperm(size(actions,2));
      action = actions(i(1));
    endif
    qmax = max(q,[],2);
    q(state,action) = R(state,action) + gamma * qmax(action);
    state = action;
  endwhile
end


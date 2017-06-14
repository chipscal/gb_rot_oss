% Differentiation simulation

%% Sliding mode Differentiation simulation

C = 3; %liptshitz constant of derivative

alphaMargin = 2;
alpha = C + alphaMargin;

lambdaMargin = 4;
lambda = sqrt(4*C*(alpha + C)/(alpha - C)) + lambdaMargin;


%% High gain Differentiation simulation

K = 100;

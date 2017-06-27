%% estimation of rotation matrix using kabsh algoritmh
clear
clc

%% matrix definition

M = orth(rand(3,3)); % random rotation matrix

if det(M) < 0
    tmp = -1*V(:,3); 
    V(:,3) = tmp;
    M = V*U';
end

t = rand(3,1)*0; % random translation


%% generation of points

N = 30;
deviation = 10^-2;

W0 = rndUnitRowMatr(3, N);
W1 = zeros(3,N);


for i=1:N
   W1(:,i) = M*W0(:,i) + t + normrnd(0, deviation,3, 1);
end


%% calculation of rotation matrix with kabsh algoritm

[R, r, error] = Kabsch(W0, W1);
disp('Number of points used: ')
disp(N)
disp('Error deviation on points: ')
disp(deviation)
disp('Matrice reale: ')
disp(M);
disp('Matrice trovata: ')
disp(R);
disp('Least square error: ')
disp(error); 
disp('Rotation matrix error: ')
disp(norm(M-R))


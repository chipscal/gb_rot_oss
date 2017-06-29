%% estimation of rotation matrix using kabsh algoritmh
clear
clc

%% matrix definition
SPACESIZE = 3;


M = orth(rand(SPACESIZE,SPACESIZE)); % random rotation matrix

while det(M) < 0
    %tmp = -1*V(:,SPACESIZE); 
    %V(:,SPACESIZE) = tmp;
    %M = V*U';
    tmp = -1*M(:,SPACESIZE);
    M(:,SPACESIZE) = tmp;
    
end

t = rand(SPACESIZE,1); % random translation


%% generation of points

N = 1000;
deviation = 10^-3;

W1 = rndUnitRowMatr(SPACESIZE, N);
W0 = zeros(SPACESIZE,N);


for i=1:N
   W0(:,i) = M*W1(:,i) + t + normrnd(0, deviation,SPACESIZE, 1);
end


%% calculation of rotation matrix with kabsh algoritm

[R, r, error] = Kabsch(W1, W0); %this estimate the inverted rotation!
if (SPACESIZE == 2)
    [R1, r1] = exactTransform2D(W0, W1, 10^-2, 100);
end
disp('Number of points used: ')
disp(N)
disp('Error deviation on points: ')
disp(deviation)
disp('Matrice reale: ')
disp(M);
disp('Matrice trovata Kabsch: ')
disp(R);
disp('Least square error: ')
disp(error);
if (SPACESIZE == 2)
    disp('Matrice soluzione esatta:');
    disp(R1);
end
disp('Rotation matrix error: ')
disp(norm(M-R))
if (SPACESIZE == 2)
    disp(norm(M-R1))
end

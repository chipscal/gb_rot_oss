clear
clc

% theta = 0.5;
% psi = 0.1;
% fi = -0.3;
% 
% 
% m11 = cos(fi)*cos(theta);
% m12 = -sin(fi)*cos(psi) + cos(fi)*sin(theta)*sin(psi);
% m13 = sin(fi)*sin(psi) + cos(fi)*sin(theta)*cos(psi);
% 
% m21 = sin(fi)*cos(theta);
% m22 = cos(fi)*cos(psi) + sin(fi)*sin(theta)*sin(psi);
% m23 = -cos(fi)*sin(psi) + sin(fi)*sin(theta)*cos(psi);
% 
% m31 = -sin(theta);
% m32 = cos(theta)*sin(psi);
% m33 = cos(theta)*cos(psi);

% M = [m11, m12, m13; m21, m22, m23;m31, m32, m33];

% e1_real = 0.2;
% e2_real = 0.3;
% e3_real = 0.4;
% nn_real = sqrt(1 - e1_real^2 - e2_real^2 - e3_real^2);
% if nn_real < 0
%    disp('error'); 
% end

x1 = 0.5;
y1 = 0.9;
z1 = 0.6;

%M = rotMatrixQuad(e1_real, e2_real, e3_real, nn_real)
M = orth(rand(3,3)); % random rotation matrix

if det(M) < 0
    tmp = -1*V(:,3); 
    V(:,3) = tmp;
    M = V*U';
end

xx = [x1;y1;z1];

v = M*xx;

x0 = v(1);
y0 = v(2);
z0 = v(3);

%%

nn = 0.2;

trace = traceMatr(x0, y0, z0, x1, y1, nn);

evalue = eig(trace);

nsol = length(evalue(evalue>0)) - length(evalue(evalue<0));

cpM_e1 = compMatr_e1(x0,y0,z0,x1,y1,nn);

cpM_e2 = compMatr_e2(x0,y0,z0,x1,y1,nn);

cpM_e3 = compMatr_e3(x0,y0,z0,x1,y1,nn);

cpM_z1 = compMatr_z1(x0,y0,z0,x1,y1,nn);


%%

e1 = eig(cpM_e1);
e2 = eig(cpM_e2);
e3 = eig(cpM_e3);
zz1 = eig(cpM_z1);

bb = [];
for i1 = 1:length(e1)
    for i2 = 1:length(e2)
        for i3 = 1:length(e3)
            for i4 = 1:length(zz1)
                
                mm = [cpM_e1 - e1(i1)*eye(length(cpM_e1));
                      cpM_e2 - e2(i2)*eye(length(cpM_e2));
                      cpM_e3 - e3(i3)*eye(length(cpM_e3));
                      cpM_z1 - zz1(i4)*eye(length(cpM_z1))];
                nnn = null(mm,'r');
                if ~isempty(nnn) 
                 %if rank(mm,1e-3) < length(cpM_e1)
                    vec = [e1(i1), e2(i2), e3(i3), zz1(i4)];
                    if isempty(bb)
                        bb = [bb; e1(i1), e2(i2), e3(i3), zz1(i4)];
                    else
                        addvec = 1;
                        for kk = 1:size(bb,1)
                            if norm(vec - bb(kk,:)) < 1e-3
                                addvec = 0;
                                break;
                            end
                        end
                        if addvec == 1
                            bb = [bb; e1(i1), e2(i2), e3(i3), zz1(i4)];
                        end
                    end
                end
                
            end
            
        end
    end
end

disp(bb)

%%

for ii = 1:length(bb)
    if norm(bb(ii,4)-z1) < 1e-3
        R1 = rotMatrixQuad(bb(ii,1), bb(ii,2), bb(ii,3), nn);
        disp(norm(R1*xx-v))
        disp((R1-M));
    end
end







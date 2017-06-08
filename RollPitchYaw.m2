R = frac(QQ [y0,z0,z1,x1,y1,Ct])[Cfi,Sfi,St, Cpsi, Spsi, x0, MonomialOrder => Lex];


m11 = Cfi*Ct;
m12 = -Sfi*Cpsi + Cfi*St*Spsi;
m13 = Sfi*Spsi + Cfi*St*Cpsi;

m21 = Sfi*Ct;
m22 = Cfi*Cpsi + Sfi*St*Spsi;
m23 = -Cfi*Spsi + Sfi*St*Cpsi;

m31 = -St;
m32 = Ct*Spsi;
m33 = Ct*Cpsi;

M = matrix{{m11, m12, m13},{m21, m22, m23},{m31, m32, m33}}
           

W0 = matrix{{x0},{y0},{z0}};
W1 = matrix{{x1}, {y1}, {z1}};


Z0 = Ct^2 + St^2 -1;
Z1 = Cfi^2 + Sfi^2-1;
Z2 = Cpsi^2 + Spsi^2-1;
A = W0 - M*W1;
B = det(M) - 1;

I = ideal(Z0,Z1,Z2,A,B);
print dim I

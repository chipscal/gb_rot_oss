R = frac(QQ[x0,y0,z0,x1,y1,nn])[e_1, e_2, e_3, z1, MonomialOrder => Lex];


m11 = 2*(nn^2+e_1^2) - 1;
m12 = 2*(e_1*e_2 - nn*e_3);
m13 = 2*(e_1*e_3 + nn*e_2);

m21 = 2*(e_1*e_2+nn*e_3);
m22 = 2*(nn^2+e_2^2) - 1;
m23 = 2*(e_2*e_3 - nn*e_1);

m31 = 2*(e_1*e_3-nn*e_2);
m32 = 2*(e_2*e_3+nn*e_1);
m33 = 2*(nn^2+e_3^2) - 1;

M = matrix{{m11, m12, m13},{m21, m22, m23},{m31, m32, m33}}
           

W0 = matrix{{x0},{y0},{z0}};
W1 = matrix{{x1}, {y1}, {z1}};


A = W0 - M*W1;
B = nn^2 + e_1^2 + e_2^2 + e_3^2 - 1;

I = ideal(A,B);
print dim I
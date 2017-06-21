needsPackage "NumericSolutions";
needsPackage "MyFunction";

R = frac(QQ[x0,y0,z0,x1,y1,nn])[e1, e2, e3, z1, MonomialOrder => Lex];


m11 = 2*(nn^2+e1^2) - 1;
m12 = 2*(e1*e2 - nn*e3);
m13 = 2*(e1*e3 + nn*e2);

m21 = 2*(e1*e2+nn*e3);
m22 = 2*(nn^2+e2^2) - 1;
m23 = 2*(e2*e3 - nn*e1);

m31 = 2*(e1*e3-nn*e2);
m32 = 2*(e2*e3+nn*e1);
m33 = 2*(nn^2+e3^2) - 1;

M = matrix{{m11, m12, m13},{m21, m22, m23},{m31, m32, m33}}
           

W0 = matrix{{x0},{y0},{z0}};
W1 = matrix{{x1}, {y1}, {z1}};


A = W0 - M*W1;
B = nn^2 + e1^2 + e2^2 + e3^2 - 1;

I = ideal(A,B);

idealExtractor(I, "./Output/QuaternionIdeal.txt");
compMatrExtractor(I, "./Output/QuaternionCompMatrices.txt");





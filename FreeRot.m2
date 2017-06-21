needsPackage "NumericSolutions";
needsPackage "MyFunction";

R = frac(QQ [x0,y0,z0,y1,z1, r33])[r11,r12,r13, r21,r22,r23, r31,r32, x1, MonomialOrder => Lex];

M = matrix{{r11, r12, r13},{r21, r22, r23},{r31, r32, r33}}

W0 = matrix{{x0},{y0},{z0}};
W1 = matrix{{x1}, {y1}, {z1}};


A = W0 - M*W1;
B = transpose(M)*M - id_(R^3);
C = det(M) - 1;


I = ideal{A,B,C}

idealExtractor(I, "./Output/FreeRotIdeal.txt");
compMatrExtractor(I, "./Output/FreeRotCompMatrices.txt");
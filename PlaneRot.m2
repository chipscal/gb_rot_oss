needsPackage "NumericSolutions";
needsPackage "MyFunction";

R = frac(QQ [ax0,ay0,ax1,ay1, bx0, by0])[r11,r12, tx, ty, by1, bx1, MonomialOrder => Lex];

M = matrix{{r11, r12},{-r12, r11}}

A0 = matrix{{ax0},{ay0}};
A1 = matrix{{ax1}, {ay1}};
B0 = matrix{{bx0},{by0}};
B1 = matrix{{bx1},{by1}};
t = matrix{{tx}, {ty}};

V0 := B0 - A0;
V1 := B1 - A1;



G1 = A0 - M*A1 - t;
G2 = B0 - M*B1 - t;
G3 = transpose(M)*M - id_(R^2);
G4 = det(M) - 1;
G5 = V0_(0,0)^2 + V0_(1,0)^2 - V1_(0,0)^2 + V1_(1,0)^2; 



I = ideal{G1, G2, G3, G4, G5}

idealExtractor(I, "./Output/R2/FreeRotIdeal.txt");
compMatrExtractor(I, "./Output/R2/FreeRotCompMatrices.txt");
traceMatrExtractor(I, "./Output/R2/FreeRotTrace.txt");
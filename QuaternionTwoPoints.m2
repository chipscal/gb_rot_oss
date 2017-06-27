needsPackage "NumericSolutions";
needsPackage "MyFunction";

R = frac(QQ[x0,y0,z0,x1,y1,nn, vx0,vy0,vz0,vx1,vy1])[e1, e2, e3, z1, vz1, MonomialOrder => Lex];


g1 = z1^2-x0^2-y0^2-z0^2+x1^2+y1^2;

g2 = e3^2+((2*y0*z0*x1*nn-2*x0*z0*y1*nn)/(x0^4+2*x0^2*y0^2+y0^4+x0^2*z0^2+y0^2*z0^2+2*x0^3*x1+2*x0*y0^2*x1+2*x0*z0^2*x1+x0^2*x1^2+z0^2*x1^2+2*x0^2*y0*y1+2*y0^3*y1+2*y0*z0^2*y1+2*x0*y0*x1*y1+y0^2*y1^2+z0^2*y1^2))*e3*z1+((-2*x0^2*y0*x1*nn-2*y0^3*x1*nn-2*y0*z0^2*x1*nn-2*x0*y0*x1^2*nn+2*x0^3*y1*nn+2*x0*y0^2*y1*nn+2*x0*z0^2*y1*nn+2*x0^2*x1*y1*nn-2*y0^2*x1*y1*nn+2*x0*y0*y1^2*nn)/(x0^4+2*x0^2*y0^2+y0^4+x0^2*z0^2+y0^2*z0^2+2*x0^3*x1+2*x0*y0^2*x1+2*x0*z0^2*x1+x0^2*x1^2+z0^2*x1^2+2*x0^2*y0*y1+2*y0^3*y1+2*y0*z0^2*y1+2*x0*y0*x1*y1+y0^2*y1^2+z0^2*y1^2))*e3+((4*x0*z0*x1*nn^2+4*y0*z0*y1*nn^2-x0^2*z0-y0^2*z0-2*x0*z0*x1-z0*x1^2-2*y0*z0*y1-z0*y1^2)/(2*x0^4+4*x0^2*y0^2+2*y0^4+2*x0^2*z0^2+2*y0^2*z0^2+4*x0^3*x1+4*x0*y0^2*x1+4*x0*z0^2*x1+2*x0^2*x1^2+2*z0^2*x1^2+4*x0^2*y0*y1+4*y0^3*y1+4*y0*z0^2*y1+4*x0*y0*x1*y1+2*y0^2*y1^2+2*z0^2*y1^2))*z1+(2*x0^4*nn^2+4*x0^2*y0^2*nn^2+2*y0^4*nn^2+2*x0^2*z0^2*nn^2+2*y0^2*z0^2*nn^2-2*x0^2*x1^2*nn^2+2*z0^2*x1^2*nn^2-4*x0*y0*x1*y1*nn^2-2*y0^2*y1^2*nn^2+2*z0^2*y1^2*nn^2-x0^4-2*x0^2*y0^2-y0^4-x0^2*z0^2-y0^2*z0^2-x0^3*x1-x0*y0^2*x1-2*x0*z0^2*x1+x0^2*x1^2+y0^2*x1^2-z0^2*x1^2+x0*x1^3-x0^2*y0*y1-y0^3*y1-2*y0*z0^2*y1+y0*x1^2*y1+x0^2*y1^2+y0^2*y1^2-z0^2*y1^2+x0*x1*y1^2+y0*y1^3)/(2*x0^4+4*x0^2*y0^2+2*y0^4+2*x0^2*z0^2+2*y0^2*z0^2+4*x0^3*x1+4*x0*y0^2*x1+4*x0*z0^2*x1+2*x0^2*x1^2+2*z0^2*x1^2+4*x0^2*y0*y1+4*y0^3*y1+4*y0*z0^2*y1+4*x0*y0*x1*y1+2*y0^2*y1^2+2*z0^2*y1^2);

g3 = e2+((-y0-y1)/(x0^2+y0^2-x1^2-y1^2))*e3*z1+((y0*z0+z0*y1)/(x0^2+y0^2-x1^2-y1^2))*e3+((-x0*nn+x1*nn)/(x0^2+y0^2-x1^2-y1^2))*z1+(x0*z0*nn-z0*x1*nn)/(x0^2+y0^2-x1^2-y1^2);

g4 = e1+((-x0-x1)/(x0^2+y0^2-x1^2-y1^2))*e3*z1+((x0*z0+z0*x1)/(x0^2+y0^2-x1^2-y1^2))*e3+((y0*nn-y1*nn)/(x0^2+y0^2-x1^2-y1^2))*z1+(-y0*z0*nn+z0*y1*nn)/(x0^2+y0^2-x1^2-y1^2);

g5 = vz1^2-vx0^2-vy0^2-vz0^2+vx1^2+vy1^2;

g6 = e3^2+((2*vy0*vz0*vx1*nn-2*vx0*vz0*vy1*nn)/(vx0^4+2*vx0^2*vy0^2+vy0^4+vx0^2*vz0^2+vy0^2*vz0^2+2*vx0^3*vx1+2*vx0*vy0^2*vx1+2*vx0*vz0^2*vx1+vx0^2*vx1^2+vz0^2*vx1^2+2*vx0^2*vy0*vy1+2*vy0^3*vy1+2*vy0*vz0^2*vy1+2*vx0*vy0*vx1*vy1+vy0^2*vy1^2+vz0^2*vy1^2))*e3*vz1+((-2*vx0^2*vy0*vx1*nn-2*vy0^3*vx1*nn-2*vy0*vz0^2*vx1*nn-2*vx0*vy0*vx1^2*nn+2*vx0^3*vy1*nn+2*vx0*vy0^2*vy1*nn+2*vx0*vz0^2*vy1*nn+2*vx0^2*vx1*vy1*nn-2*vy0^2*vx1*vy1*nn+2*vx0*vy0*vy1^2*nn)/(vx0^4+2*vx0^2*vy0^2+vy0^4+vx0^2*vz0^2+vy0^2*vz0^2+2*vx0^3*vx1+2*vx0*vy0^2*vx1+2*vx0*vz0^2*vx1+vx0^2*vx1^2+vz0^2*vx1^2+2*vx0^2*vy0*vy1+2*vy0^3*vy1+2*vy0*vz0^2*vy1+2*vx0*vy0*vx1*vy1+vy0^2*vy1^2+vz0^2*vy1^2))*e3+((4*vx0*vz0*vx1*nn^2+4*vy0*vz0*vy1*nn^2-vx0^2*vz0-vy0^2*vz0-2*vx0*vz0*vx1-vz0*vx1^2-2*vy0*vz0*vy1-vz0*vy1^2)/(2*vx0^4+4*vx0^2*vy0^2+2*vy0^4+2*vx0^2*vz0^2+2*vy0^2*vz0^2+4*vx0^3*vx1+4*vx0*vy0^2*vx1+4*vx0*vz0^2*vx1+2*vx0^2*vx1^2+2*vz0^2*vx1^2+4*vx0^2*vy0*vy1+4*vy0^3*vy1+4*vy0*vz0^2*vy1+4*vx0*vy0*vx1*vy1+2*vy0^2*vy1^2+2*vz0^2*vy1^2))*vz1+(2*vx0^4*nn^2+4*vx0^2*vy0^2*nn^2+2*vy0^4*nn^2+2*vx0^2*vz0^2*nn^2+2*vy0^2*vz0^2*nn^2-2*vx0^2*vx1^2*nn^2+2*vz0^2*vx1^2*nn^2-4*vx0*vy0*vx1*vy1*nn^2-2*vy0^2*vy1^2*nn^2+2*vz0^2*vy1^2*nn^2-vx0^4-2*vx0^2*vy0^2-vy0^4-vx0^2*vz0^2-vy0^2*vz0^2-vx0^3*vx1-vx0*vy0^2*vx1-2*vx0*vz0^2*vx1+vx0^2*vx1^2+vy0^2*vx1^2-vz0^2*vx1^2+vx0*vx1^3-vx0^2*vy0*vy1-vy0^3*vy1-2*vy0*vz0^2*vy1+vy0*vx1^2*vy1+vx0^2*vy1^2+vy0^2*vy1^2-vz0^2*vy1^2+vx0*vx1*vy1^2+vy0*vy1^3)/(2*vx0^4+4*vx0^2*vy0^2+2*vy0^4+2*vx0^2*vz0^2+2*vy0^2*vz0^2+4*vx0^3*vx1+4*vx0*vy0^2*vx1+4*vx0*vz0^2*vx1+2*vx0^2*vx1^2+2*vz0^2*vx1^2+4*vx0^2*vy0*vy1+4*vy0^3*vy1+4*vy0*vz0^2*vy1+4*vx0*vy0*vx1*vy1+2*vy0^2*vy1^2+2*vz0^2*vy1^2);

g7 = e2+((-vy0-vy1)/(vx0^2+vy0^2-vx1^2-vy1^2))*e3*vz1+((vy0*vz0+vz0*vy1)/(vx0^2+vy0^2-vx1^2-vy1^2))*e3+((-vx0*nn+vx1*nn)/(vx0^2+vy0^2-vx1^2-vy1^2))*vz1+(vx0*vz0*nn-vz0*vx1*nn)/(vx0^2+vy0^2-vx1^2-vy1^2);

g8 = e1+((-vx0-vx1)/(vx0^2+vy0^2-vx1^2-vy1^2))*e3*vz1+((vx0*vz0+vz0*vx1)/(vx0^2+vy0^2-vx1^2-vy1^2))*e3+((vy0*nn-vy1*nn)/(vx0^2+vy0^2-vx1^2-vy1^2))*vz1+(-vy0*vz0*nn+vz0*vy1*nn)/(vx0^2+vy0^2-vx1^2-vy1^2);


I = ideal(g1, g2, g3, g4, g5, g6, g7, g8);

-- idealExtractor(I, "./Output/Quaternion2Ideal.txt");
-- compMatrExtractor(I, "./Output/Quaternion2CompMatrices.txt");
-- traceMatrExtractor(I, "./Output/Quaternion2Trace.txt");
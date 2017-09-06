function [R, t] = exactTransform2D(W0, W1, threshold, N)


tx = 0.0;
ty = 0.0;
r11 = 0.0;
r12 = 0.0;



Nsum = 0;
for i = 1:N
    ptrA = randi([1 N],1);
    ptrB = randi([1 N],1);
   
    
    ax0 = W0(1,ptrA);
    ay0 = W0(2,ptrA);

    bx0 = W0(1,ptrB);
    by0 = W0(2,ptrB);

    ax1 = W1(1,ptrA);
    ay1 = W1(2,ptrA);

    bx1 = W1(1,ptrB);
    by1 = W1(2,ptrB);
    
    den = ax0^2 + ay0^2 - 2*ax0*bx0 + bx0^2 - 2*ay0*by0 + by0^2;
    
    if (den >= threshold && by1^2-2*ay1*by1+ay1^2 <= threshold && bx1^2-2*ax1*bx1-ax0^2-ay0^2+ax1^2+2*ax0*bx0-bx0^2+2*ay0*by0-by0^2 <= threshold)
        
        
        
        %tty = - (((ax0*ax1-ay0*ay1-ax1*bx0+ay1*by0)/(ax0^2+ay0^2-2*ax0*bx0+bx0^2-2*ay0*by0+by0^2))*by1+((-ay0*ax1-ax0*ay1+ay1*bx0+ax1*by0)/(ax0^2+ay0^2-2*ax0*bx0+bx0^2-2*ay0*by0+by0^2))*bx1+(-ax0^2*ay0-ay0^3+ay0*ax1^2+ay0*ay1^2+2*ax0*ay0*bx0-ay0*bx0^2+2*ay0^2*by0-ax1^2*by0-ay1^2*by0-ay0*by0^2)/(ax0^2+ay0^2-2*ax0*bx0+bx0^2-2*ay0*by0+by0^2));
        tty = -(ax0^2*ay0 + ay0^3 - ay0*ay1^2 + ay0*bx0^2 - ay1*bx0*bx1 - 2*ay0^2*by0 + ay1^2*by0 + ay0*by0^2 + ax1^2*(-ay0 + by0) + ay0*ay1*by1 - ay1*by0*by1 + ax0*(-2*ay0*bx0 + ay1*bx1 - ax1*by1) + ax1*(ay0*bx1 - bx1*by0 + bx0*by1))/(den);
        
        %ttx = - (((-ay0*ax1-ax0*ay1+ay1*bx0+ax1*by0)/(ax0^2+ay0^2-2*ax0*bx0+bx0^2-2*ay0*by0+by0^2))*by1+((-ax0*ax1+ay0*ay1+ax1*bx0-ay1*by0)/(ax0^2+ay0^2-2*ax0*bx0+bx0^2-2*ay0*by0+by0^2))*bx1+(-ax0^3-ax0*ay0^2+ax0*ax1^2+ax0*ay1^2+2*ax0^2*bx0-ax1^2*bx0-ay1^2*bx0-ax0*bx0^2+2*ax0*ay0*by0-ax0*by0^2)/(ax0^2+ay0^2-2*ax0*bx0+bx0^2-2*ay0*by0+by0^2));
        ttx = (ax0^3 - 2*ax0^2*bx0 + ax1^2*bx0 + ax0*(-ax1^2 + ay0^2 - ay1^2 + bx0^2 + ax1*bx1 - 2*ay0*by0 + by0^2 + ay1*by1) + ay1*(ay1*bx0 - ay0*bx1 + bx1*by0 - bx0*by1) - ax1*(bx0*bx1 - ay0*by1 + by0*by1))/(den);
        
        
        %tr12 = - (((ax0-bx0)/(ax0^2+ay0^2-2*ax0*bx0+bx0^2-2*ay0*by0+by0^2))*by1+((-ay0+by0)/(ax0^2+ay0^2-2*ax0*bx0+bx0^2-2*ay0*by0+by0^2))*bx1+(ay0*ax1-ax0*ay1+ay1*bx0-ax1*by0)/(ax0^2+ay0^2-2*ax0*bx0+bx0^2-2*ay0*by0+by0^2));
        tr12 = ((-ay1)*bx0 + ay0*bx1 - bx1*by0 + ax1*(-ay0 + by0) + ax0*(ay1 - by1) + bx0*by1)/(den);
        
        %tr11 = - (((ay0-by0)/(ax0^2+ay0^2-2*ax0*bx0+bx0^2-2*ay0*by0+by0^2))*by1+((ax0-bx0)/(ax0^2+ay0^2-2*ax0*bx0+bx0^2-2*ay0*by0+by0^2))*bx1+(-ax0*ax1-ay0*ay1+ax1*bx0+ay1*by0)/(ax0^2+ay0^2-2*ax0*bx0+bx0^2-2*ay0*by0+by0^2));
        tr11 = (ax0*ax1 + ay0*ay1 - ax1*bx0 - ax0*bx1 + bx0*bx1 - ay1*by0 - ay0*by1 + by0*by1)/(den);
  
        if ( ~isnan(tty) && ~isnan(ttx) && ~isnan(tr12) && ~isnan(tr11))
            ty = ty + tty;
            tx = tx + ttx;
            r12 = r12 + tr12;
            r11 = r11 + tr11;

            Nsum = Nsum + 1;
           
        end
    end  
end
ty = ty/(Nsum);
tx = tx/(Nsum);
r12 = r12/(Nsum);
r11 = r11/(Nsum);


R = [[r11, r12]; [-r12, r11]];
t = [tx;ty];

end
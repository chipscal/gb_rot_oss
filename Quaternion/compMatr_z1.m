function cpMatVar_z1 = compMatr_z1(x0, y0, z0, x1, y1, nn) 

cpMatVar_z1_00 = 0;

cpMatVar_z1_01 = 0;

cpMatVar_z1_02 = 0;

cpMatVar_z1_03 = x0^2+y0^2+z0^2-x1^2-y1^2;

cpMatVar_z1_10 = 0;

cpMatVar_z1_11 = 0;

cpMatVar_z1_12 = x0^2+y0^2+z0^2-x1^2-y1^2;

cpMatVar_z1_13 = 0;

cpMatVar_z1_20 = 0;

cpMatVar_z1_21 = 1;

cpMatVar_z1_22 = 0;

cpMatVar_z1_23 = 0;

cpMatVar_z1_30 = 1;

cpMatVar_z1_31 = 0;

cpMatVar_z1_32 = 0;

cpMatVar_z1_33 = 0;

cpMatVar_z1 = [[cpMatVar_z1_00, cpMatVar_z1_01, cpMatVar_z1_02, cpMatVar_z1_03]; [cpMatVar_z1_10, cpMatVar_z1_11, cpMatVar_z1_12, cpMatVar_z1_13]; [cpMatVar_z1_20, cpMatVar_z1_21, cpMatVar_z1_22, cpMatVar_z1_23]; [cpMatVar_z1_30, cpMatVar_z1_31, cpMatVar_z1_32, cpMatVar_z1_33]];


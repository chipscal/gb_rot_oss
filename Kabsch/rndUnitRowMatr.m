function mat = rndUnitRowMatr(nrows, ncol)

mat = rand(nrows, ncol);
colsum = sum(mat,1);
mat = bsxfun(@rdivide, mat, colsum);

end
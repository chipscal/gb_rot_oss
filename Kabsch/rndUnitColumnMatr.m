function mat = rndUnitColumnMatr(nrows, ncol)

mat = rand(nrows, ncol);
rowsum = sum(mat,2);
mat = bsxfun(@rdivide, mat, rowsum);

end
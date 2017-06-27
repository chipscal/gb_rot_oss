-- -*- coding: utf-8 -*-
newPackage (
 "MyFunction",
 Version => "1.0",
 Date => "21 June, 2017",
 Headline => "some utility function",
 Authors => {
  {Name => "Luca Calacci", Email => "luca.calacci@gmail.com"}},
  
 PackageImports => {"NumericSolutions"}
)
     
export {
 "matrToFile",
 "compMatrExtractor",
 "traceMatrExtractor",
 "idealExtractor"
}


matrToFile = method();
matrToFile(Matrix, String, File) := (matrix, matrixName, file) -> (
	-- stores a matrix into a file. 
	 
	 -- inputs: a matrix,
	 --         a matrix name,
	 --			an opened file.
	 
	 
	 -- output: void.
	 --     


	 
	-- Extract number of columns
	NCol := numColumns matrix;
	if NCol == 0 then (
		error "Malformed matrix: the number of columns cannot be zero!";
	);

	-- Extract number of rows
	NRow := numRows matrix;
	if NRow == 0 then (
		error "Malformed matrix: the number of rows cannot be zero!";
	);
	
	for rr from 0 to NRow-1 do (
		for cc from 0 to NCol-1 do(
		
			file << matrixName << "_" << rr << cc << " = " << toExternalString matrix_(rr,cc) << ";" << endl;
			file << newline;
		);
	);
	
	file << matrixName << " = " << "{";
	
	for rr from 0 to NRow-1 do (
		file << "{";
		for cc from 0 to NCol-1 do(
		
			file << matrixName << "_" << rr << cc;
			
			if cc != NCol-1 then (
				file << ", ";
			);
		);
		file << "}";
		if rr != NRow-1 then (
				file << ", ";
			);
	);
	file << "};" << endl;
	file << newline;
);

compMatrExtractor = method();
compMatrExtractor(Ideal, String) := (I, filename) -> (
	 -- computes the companion matrix respect of all variables of the ideal I 
	 -- and stores them into a file.
	 
	 -- inputs: the ideal I,
	 --         the filename of the file where to write matrices
	 
	 
	 -- output: void.
	 --         
	 
	 -- find the ring
	 R := ring I;
	 
	 -- check that the ideal I is zero dimensional.
	 if dim I != 0 then 
	  error "the ideal is not zero dimensional";
	 
	  -- define the variables vector.
	 var := gens R;
	 
	 -- define the coefficient ring. 
	 coeffRing := coefficientRing(R);
	 
	 -- n denotes the number of variables to be considered
	 n := length var;
	 
	 --open/create file
	 myFile := openOut filename;
	 
	 --compute all the companin matrices and store them into a file readable from Wolfram Mathematica
	 for kk from 1 to n do (
	 
		tmpCompMat := substitute(compMatr(I,var_(kk-1)),coeffRing);
		tmpName := "cpMatVar_" | toString var_(kk-1);
		
		myFile << "Companion matrix respect to: " | toString var_(kk-1) << newline << endl;
		matrToFile(tmpCompMat, tmpName, myFile);
		myFile << newline << "-------------------------------------------------------------------------------------------------" << newline << newline << endl;
	 
	 );
	 
	 myFile << close;
);


traceMatrExtractor = method();
traceMatrExtractor(Ideal, String) := (I, filename) -> (
	 -- computes the companion matrix respect of all variables of the ideal I 
	 -- and stores them into a file.
	 
	 -- inputs: the ideal I,
	 --         the filename of the file where to write matrices
	 
	 
	 -- output: void.
	 --         
	 
	
	 
	 --open/create file
	 myFile := openOut filename;
	 
	--calculate trace matrix of ideal I
	traceMat := traceForm(I);
	
	myFile << "Trace form matrix: " << newline << endl;
	matrToFile(traceMat, "trace", myFile);
	myFile << newline << "-------------------------------------------------------------------------------------------------" << newline << newline << endl;
	 
	
	 
	 myFile << close;
);

idealExtractor = method();
idealExtractor(Ideal, String) := (I, filename) -> (
	 -- stores the ideal into a file.
	 
	 -- inputs: the ideal I,
	 --         the filename of the file where to write matrices
	 
	 
	 -- output: void.
	 --         
	
	 -- find the ring
	 R := ring I;
	 -- define the variables vector.
	 var := gens R;
	 
	 -- define the coefficient ring. 
	 coeffRing := coefficientRing(R);
	 
	 -- n denotes the number of variables to be considered
	 n := length var;
	
	 --open/create file
	 myFile := openOut filename;
	 
	 --stores the ideal into a file
	 myFile << "------------------ Ideal information ------------------" << endl;
	 myFile << "Number of generators: " | toString numgens I << endl;
	 myFile << "Ideal dimension: " | toString dim I << endl;
	 myFile << "Ideal vars: " | toString var << endl;
	 myFile << "Ideal coefficient: " | toString coeffRing << endl;
	 
	 myFile << newline << endl;
	 myFile << "Ideal generators: " << endl;
	 
	 genPols := first entries gens I;
	 for kk from 1 to numgens I do (
		
		myFile << newline << endl;
		myFile << "q" << kk << " = " << toString genPols_(kk-1);
		
	 );
	 
	 myFile << newline << endl;
	 myFile << "------------------ Groebner base information ------------------" << endl;
	 
	 gbPols := first entries gens gb I;
	 
	 myFile << "Base size: " << length gbPols << endl;
	 myFile << "Groebner base: " << endl;
	 for kk from 1 to length gbPols do (
		
		myFile << newline << endl;
		myFile << "g" << kk << " = " << toString gbPols_(kk-1);
		
	 );
	 
	 myFile << close;

);




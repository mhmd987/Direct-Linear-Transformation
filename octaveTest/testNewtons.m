%Testing Newton's method to solve a group of equations
%https://en.wikipedia.org/wiki/Newton%27s_method
%http://math.stackexchange.com/questions/466809/solving-a-set-of-equations-with-newton-raphson
%https://en.wikipedia.org/wiki/Jacobian_matrix_and_determinant
%Example taken from https://en.wikipedia.org/wiki/Jacobian_matrix_and_determinant

%f(x,y) = [x^2*y;5*x+sin(y)]
%Therefore
%f1(x,y) = x^2*y
%f2(x,y) = 5*x+sin(y)
%Derivatives
%df1(x,y)/dx = 2yx
%df1(x,y)/dy = x^2
%df2(x,y)/dx = 5
%df2(x,y)/dy = cos(y)
%Jacobian
%f'(x,y) = [2*y*x x^2;5 cos(y)]

%Newton's method
%x1 = x0 - f(x0) / f '(x0)
%x(k)=x(k−1)−J(x(k−1))^−1*F(x(k−1)). 

%Start solving from x = 1, y = 1 or some other alternative e.g. (0.1,0.1)
x = 0.1;
y = 0.1;
xy = [x;y]
fXY = [xy(1)^2*xy(2);5*xy(1)+sin(xy(2))]
diffXY = 100;
iterations = 0;
while diffXY > 0.001
	xy1 = xy-inv([2*xy(1)*xy(2) xy(1)^2;5 cos(xy(2))])*[xy(1)^2*xy(2);5*xy(1)+sin(xy(2))];
	fXY1 = [xy1(1)^2*xy1(2);5*xy1(1)+sin(xy1(2))];
	diffXY = sqrt(sum((xy1-xy).^2));
	xy = xy1;
	iterations = iterations+1;
end

disp(['iterations ' num2str(iterations) ' x, y '])%
% num2str(xy) ' f(x,y) ' num2str(fXY1)])
xy
fXY1

%For non-square Jacobian we'd need a pseudoinverse 
%http://people.revoledu.com/kardi/tutorial/LinearAlgebra/MatrixGeneralizedInverse.html
%I'll test the (AtA)^(-1)At (= generalized left inverse)
%Eigen values ane vectors
%http://people.revoledu.com/kardi/tutorial/LinearAlgebra/EigenValueEigenVector.html
%Singular value decomposition http://people.revoledu.com/kardi/tutorial/LinearAlgebra/SVD.html
%SVD; A = UDVt
%U = eigen-vectors of AAt concatenated
%V = eigen-vectors of AtA concatenated
%D = UtAV or eigenvalues of AAt squared in the diagonal
%Moore-Pentrose Pseudo-Inverse A+ calculated from SVD matrices
%A+ = VD-1Ut



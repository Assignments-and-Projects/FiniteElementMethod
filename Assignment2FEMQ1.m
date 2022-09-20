clear
close all
clc


##----------------------------------FUNCTION DEFINATIONS-------------------------##

function x = GetNodePoints(n,end_point,starting_point)
  for i = 1:n
    x(i) = (end_point-starting_point) * (i-1)/(n-1) + starting_point;
  end
endfunction

function icon = GetConnectivityMatrix(n)
  for i=1:n
    icon(i,1) = i;
    icon(i,2) = i+1;
  end
endfunction

function [kg, fg] = InitializeForceStiffnessMatrices(n)
  kg = zeros(n,n);
  fg = zeros(n,1);
endfunction

function [wgp,egp] = InitializeGaussPoints
  wgp = [1 1];
  egp = [-1 1]/sqrt(3);
endfunction

function u = GetDisplacementVector(kg,fg)
  u = inv(kg)*fg;
endfunction

function xx = GetNodePointsAssociatedWithElement(icon,element,approximation)
  for i = 1:(approximation+1)
    xx(i) = icon(element,i);
  end
endfunction

function [xx,Nmat,Bmat] = GetShapeFunctionLinearApproximation(x,n,gaussPoint)
  xx = (x(n(1))+x(n(end)))/2 + (x(n(1))-x(n(end)))/2 * gaussPoint;
  Bmat = [-1/(x(n(2))-x(n(1)))   1/(x(n(2))-x(n(1)))];
  Nmat = [(x(n(2))-xx)/(x(n(2))-x(n(1)))    (xx-x(n(1)))/(x(n(2))-x(n(1)))];
endfunction

function [kg,fg] = BoundaryConditionProcessOfElimination(kg,fg,ibc,bc)
  fg = fg - kg(:,ibc)*bc;
  fg(ibc) = bc;
  kg(:,ibc) = 0;
  kg(ibc,:) = 0;
  kg(ibc , ibc) = 1;
endfunction

function iv = GetAssemblyVector(n)
  for i = 1:length(n)
    iv(i) = n(i);
  end
endfunction

##------------------------------------------------------------------------------##

function rootMeanSquare = GetRootMeanSquareErrorInDisplacement(x,u,n)
  rootMeanSquare = 0;
  for i = 1:n
    y(i) = ((401 - x(i)*x(i))*log(2) - 317*log(x(i)))/log(16);
    rootMeanSquare+=(u(i) - y(i))*(u(i) - y(i));
  end
  rootMeanSquare = sqrt(rootMeanSquare/n);
  analytical_temperature = y'
endfunction

##--------------------------------MAIN FUNCTION---------------------------------##

numberOfElements = 20;
numberOfNodes = numberOfElements + 1;

x = GetNodePoints(numberOfNodes,2,1)

connectivityMatrix = GetConnectivityMatrix(numberOfElements);

[weightOfGaussPoints,gaussPoints] = InitializeGaussPoints();

[globalStiffnessMatrix , forceVector] = InitializeForceStiffnessMatrices(numberOfNodes);


for element = 1:numberOfElements
  n = GetNodePointsAssociatedWithElement(connectivityMatrix,element,1);
  [kloc,floc] = InitializeForceStiffnessMatrices(2);
  for igp = 1:length(weightOfGaussPoints)
    [xx,Nmat,Bmat] = GetShapeFunctionLinearApproximation(x,n,gaussPoints(igp));
    kloc = kloc + (Bmat'*Bmat*xx) * (x(n(end))-x(n(1)))/2 * weightOfGaussPoints(igp);
    floc = floc + xx*Nmat'*(x(n(end))-x(n(1)))/2 * weightOfGaussPoints(igp);
  end
  iv = GetAssemblyVector(n);
  forceVector(iv) = forceVector(iv) + floc;
  globalStiffnessMatrix(iv,iv) = globalStiffnessMatrix(iv,iv) + kloc;
end

[globalStiffnessMatrix,forceVector] = BoundaryConditionProcessOfElimination(globalStiffnessMatrix,forceVector,1,100);
[globalStiffnessMatrix,forceVector] = BoundaryConditionProcessOfElimination(globalStiffnessMatrix,forceVector,numberOfNodes,20);
numerical_temperature = GetDisplacementVector(globalStiffnessMatrix,forceVector)
rootMeanSquare = GetRootMeanSquareErrorInDisplacement(x,numerical_temperature,numberOfNodes)
plot(x,numerical_temperature,'-o')
  ##--------------------------------------------------------------------------------##




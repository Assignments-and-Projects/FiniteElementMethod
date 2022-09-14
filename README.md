




[Github](https://github.com/notcamelcase01/FiniteElementMethod/blob/main/README.md) 

# FemAssignments

## Assigment 1

### Question 1

![image](https://user-images.githubusercontent.com/26081294/189519867-3e9d27a2-85e2-4da8-bac6-70783382399c.png)



### Solution 1 

- Code File:  [Question 1 Mfile](https://github.com/notcamelcase01/FemAssignments/blob/master/AssignmentFEMQ1.m)

## **Deriving Governing Equation**

Force Balance on an arbitrary element at distance $x$ from bar

![image](https://i.imgur.com/GRpeUuq.png)




$F(x +\Delta x) - F(x) - k\Delta x  u(x) = 0$ 	 

Dividing whole Equation by $\Delta x$

$\frac{ F(x + \Delta x) - F(\Delta x) }{ \Delta x } - k u(x)$ = 0

Take limit as $\Delta x \to 0$

$\frac{dF} {dx} - ku = 0$        {Note : Here $u = u(x)$} 

$\sigma = \frac{F}{A}$ also $\sigma = E\frac{du}{dx}$  

**E** = Elasticity modulus, **A**= Cross Sectional Area
Thus,

$F = EA\frac{du}{dx}$

Known Boundary Conditions

$u(0) = 0$

$EA\left.\frac{du}{dx} \right|_{x=l} = F$

and, Finally putting value of **F** in our governing equation

$\frac{d}{dx}[EA\frac{du}{dx}] - ku =0$

Finally Putting values of constants in our equations, questions have asked us to take all constants as unity, so be it.

--------------------------------------------------------------------
$\frac{d^2u}{dx^2} - u =0$ for $x \in (0,1)$
 
$u(0) = 0$
 
$\frac{du}{dx} = 1$ at $x = 1$

---------------------------------------------------------------------


Solving   $\frac{d^2u}{dx^2} - u =0$ for $x \in (0,1)$

with Boundary conditions

$u(0) = 0$
 
$\frac{du}{dx} = 1$ at $x = 1$

We get 

$=>$  $u(x) = \frac{e^x - e^{-x}}{e + e^{-1}}$
<br>

Finally we get our analytical solution any any $x$.



$=>$  $u(x) = \frac{e}{e^2+1}(e^x-e^{-x})$ 
-

<br>


## **Deriving Weak Form**

$\int_{1}^{2}\delta u(\frac{d^2u}{dx^2} - u)dx = 0$

$\delta u$ is weight function that varies linearly like u since we are going to take linear approximation for our calculations  

Evaluating further

$\int_{1}^{2}(\frac{d}{dx}(\delta u \frac{du}{dx}) -  \frac{d\delta u}{dx}\frac{du}{dx} -\delta u u)dx = 0$

According to our method our $u$ varies linearly and it will be according to the following equation.

$u = N_{1}u_{1} + N_{2}u_{2}$

$N_{1} = \frac{(x - x_{2})}{(x_{1}-x_{2})}$

$N_{2} = \frac{(x - x_{1})}{(x_{2}-x_{1})}$

$\mathbf N =   \begin{bmatrix} N_{1} \   \  N_{2}\end{bmatrix}$

$\mathbf B = \mathbf N^{'} =  \begin{bmatrix} N_{1}^{'} \   \  N_{2}^{'}\end{bmatrix}$

$\delta u = \mathbf N\delta u$

$u = \mathbf N u$

$\frac{du}{dx} = \mathbf Bu$

Putting above equations in our integral and simplifying 

$\left. \delta u \frac{du}{dx} \right|_{1}^{2} = \int \delta u^{T} \mathbf B^{T} \mathbf B u dx + \int  \delta u^T \mathbf N^T \mathbf N  u dx$

<br>


$F^N \delta u^T =  \delta u^T u ( \int \mathbf B^T \mathbf B + \mathbf N^T \mathbf N )dx$

<br>

We can very conveniently compare above expression to $F=Kx$ as we write

$\mathbf K = \int( \mathbf B^T \mathbf B + \mathbf N^T \mathbf N )dx$

there by leading to

$F^N = \mathbf Ku$

For integrating above expression numerically we will be using **Gauss Quadrature** method and we will take **2** gauss points as 2 points will be sufficient to accurately give our answer to polynomial integration.

Analysis Procedure
- We will run [This code](https://github.com/notcamelcase01/FemAssignments/blob/master/AssignmentFEMQ1.m) on octave to get values of displacements and stresses.
- We will also compare numerically calculated stresses and displacement with our analytical solution i.e $=>$  $u(x) = \frac{e}{e^2+1}(e^x-e^{-x})$ 
- We will plot graph of displacement for each node.
- Additionally, we will also see how difference in values of displacements from analytical and numerical solution varies with changing number of elements.

Observations 

- Number of Elements : 10
- Root Mean Square Error (Displacements)  = $9.8160*10^{-05}$

----

| x   | analytical displacement | numerical displacement | numerical stress | analytical stress |
|-----|-------------------------|------------------------|------------------|-------------------|
|   0 |                       0 |                      0 |           0.6489 |            0.6489 |
| 0.1 |                  0.0649 |                 0.0649 |           0.6554 |            0.6554 |
| 0.2 |                  0.1305 |                 0.1304 |           0.6685 |            0.6684 |
| 0.3 |                  0.1973 |                 0.1973 |           0.6883 |            0.6882 |
| 0.4 |                  0.2662 |                 0.2661 |           0.7149 |            0.7148 |
| 0.5 |                  0.3377 |                 0.3376 |           0.7487 |            0.7486 |
| 0.6 |                  0.4126 |                 0.4125 |             0.79 |            0.7898 |
| 0.7 |                  0.4916 |                 0.4915 |           0.8393 |             0.839 |
| 0.8 |                  0.5755 |                 0.5754 |           0.8969 |            0.8966 |
| 0.9 |                  0.6652 |                 0.6651 |           0.9635 |            0.9632 |
|   1 |                  0.7616 |                 0.7615 |                1 |                 1 |


---

- Graph of Displacement vs x

![image](https://i.imgur.com/0UPaWtr.png)

-----

| Number Of Elements | RMS Error in Displacement  |   
|--------------------|-------------------|
| 10                 | 9.82E-05          |  
| 20                 | 2.45E-05          |   
| 30                 | 1.09E-05          |   
| 40                 | 6.13E-06          |   
| 50                 | 3.92E-06          | 
---

![Graph](https://i.imgur.com/N27VYBR.png)

------------------

### Question 2

![image](https://i.imgur.com/d2YvLTp.png)



### Solution 2 

- Code File:  [Question 2 Mfile](https://github.com/notcamelcase01/FemAssignments/blob/master/AssignmentFEMQ2.m)

## **Deriving Governing Equation**

Force Balance on an arbitrary element at distance $x$ from bar

![image](https://i.imgur.com/GRpeUuq.png)


Total Displacement at position $x$ on bar is ($u(x) + \alpha \Delta T x$)

Total Displacement : $u(x) + \alpha \Delta T x$  Displacement because of force and spring separately


Also, $\sigma = E(\epsilon)$ note the strain is not due to thermal displacements

$F(x +\Delta x) - F(x) - k\Delta x( u(x) + x \alpha \Delta T)= 0$ 	 

Dividing whole Equation by $\Delta x$

$\frac{(F(x +\Delta x) - F(x))}{\Delta x} -  k u(x) - x \alpha \Delta T = 0$ 	 



Take limit as $\Delta x \to 0$

Now;


$\frac{dF} {dx} - ku - x = 0$        {Note : Here $u = u(x)$} 

$\sigma = \frac{F}{A}$ also $\sigma = E(\frac{du}{dx})$  

**E** = Elasticity modulus, **A**= Cross Sectional Area 
Thus,

$F = EA(\frac{du}{dx}-\alpha \Delta T)$

Known Boundary Conditions

$u(0) = 0$

$\left.\frac{du}{dx} \right|_{x=l} = 1$ 

and, Finally putting value of **F** in our governing equation

$\frac{d}{dx}[EA(\frac{du}{dx}-\alpha \Delta T)] - ku  -x=0$

Finally Putting values of constants in our equations, questions have asked us to take all constants as unity, so be it.

--------------------------------------------------------------------
$\frac{d^2u}{dx^2} - u -x =0$ for $x \in (0,1)$
 
$u(0) = 0$
 
$\frac{du}{dx} = 1$ at $x = 1$ 


---------------------------------------------------------------------


Solving  $\frac{d^2u}{dx^2} - u -x =0$ for $x \in (0,1)$

with Boundary conditions

$u(0) = 0$
 
$\frac{du}{dx} = 1$ at $x = 1$

We get 

$=>$  $u(x) = -\frac{e^2x+x+2e^{1-x}-2e^{x+1}}{1+e^2}$
<br>

Finally we get our analytical solution any any $x$.



$=>$  $=>$  $u(x) = -\frac{e^2x+x+2e^{1-x}-2e^{x+1}}{1+e^2}$
-

<br>


## **Deriving Weak Form**

$\int_{1}^{2}\delta u( \frac{d^2u}{dx^2} - u -x)dx = 0$

$\delta u$ is weight function that varies linearly like u since we are going to take linear approximation for our calculations  

Evaluating further

$\int_{1}^{2}(\frac{d}{dx}(\delta u \frac{du}{dx}) -  \frac{d\delta u}{dx}\frac{du}{dx} -\delta u u - \delta ux)dx = 0$

According to our method our $u$ varies linearly and it will be according to the following equation.

$u = N_{1}u_{1} + N_{2}u_{2}$

$N_{1} = \frac{(x - x_{2})}{(x_{1}-x_{2})}$

$N_{2} = \frac{(x - x_{1})}{(x_{2}-x_{1})}$

$\mathbf N =   \begin{bmatrix} N_{1} \   \  N_{2}\end{bmatrix}$

$\mathbf B = \mathbf N^{'} =  \begin{bmatrix} N_{1}^{'} \   \  N_{2}^{'}\end{bmatrix}$

$\delta u = \mathbf N\delta u$

$u = \mathbf N u$

$\frac{du}{dx} = \mathbf Bu$

Putting above equations in our integral and simplifying 

$=\left. \delta u \frac{du}{dx} \right|_{1}^{2} = \int \delta u^{T} \mathbf B^{T} \mathbf B u dx + \int  \delta u^T \mathbf N^T \mathbf N  u dx + \int \delta u^T  \mathbf N^Txdx$

<br>


$=>F^N \delta u^T =  \delta u^T u ( \int \mathbf B^T \mathbf B + \mathbf N^T \mathbf N )dx + \int \delta u^T  \mathbf N^Txdx$

<br>

We can very conveniently compare above expression to $F=Kx$ as we write

$\mathbf K = \int( \mathbf B^T \mathbf B + \mathbf N^T \mathbf N )dx$

and

 $F^B =\int \delta u^T  \mathbf N^Txdx$

there by leading to

$F^N - F^B= \mathbf Ku$

For integrating above expression numerically we will be using **Gauss Quadrature** method and we will take **2** gauss points as 2 points will be sufficient to accurately give our answer to polynomial integration.

Analysis Procedure
- We will run [This code](https://github.com/notcamelcase01/FemAssignments/blob/master/AssignmentFEMQ2.m) on octave to get values of displacements and stresses.
- We will also compare numerically calculated stresses and displacement with our analytical solution i.e $=>$ $=>$  $u(x) = -\frac{e^2x+x+2e^{1-x}-2e^{x+1}}{1+e^2}$
- We will plot graph of displacement for each node.

Observations 

- Number of Elements : 10
- Root Mean Square Error (Displacements)  = $1.994*10^{-04}$

---
| x   | analytical displacement | numerical displacement | stress | analytical stress |
|-----|-------------------------|------------------------|--------|-------------------|
|   0 |                       0 |                      0 | 0.2979 |            0.2977 |
| 0.1 |                  0.1298 |                 0.1298 | 0.3109 |            0.3107 |
| 0.2 |                   0.261 |                 0.2609 |  0.337 |            0.3368 |
| 0.3 |                  0.3947 |                 0.3946 | 0.3765 |            0.3763 |
| 0.4 |                  0.5324 |                 0.5322 | 0.4298 |            0.4296 |
| 0.5 |                  0.6754 |                 0.6752 | 0.4975 |            0.4971 |
| 0.6 |                  0.8252 |                  0.825 | 0.5801 |            0.5797 |
| 0.7 |                  0.9832 |                  0.983 | 0.6786 |            0.6781 |
| 0.8 |                  1.1511 |                 1.1508 | 0.7938 |            0.7932 |
| 0.9 |                  1.3305 |                 1.3302 | 0.9271 |            0.9263 |
|   1 |                  1.5232 |                 1.5229 |      1 |                 1 |
---

- Graph of Displacement vs x

![image](https://i.imgur.com/6JUappJ.png)

----------

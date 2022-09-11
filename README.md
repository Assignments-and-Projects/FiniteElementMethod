


[Assignment uploaded on Github](https://github.com/notcamelcase01/FiniteElementMethod/edit/main/README.md) 

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

$\int_{1}^{2}\delta u(\frac{d^2u}{dx^2} - u) = 0$

$\delta u$ is weight function that varies linearly like u since we are going to take linear approximation for our calculations  

Evaluating further

$\int_{1}^{2}(\frac{d}{dx}(\delta u \frac{du}{dx}) -  \frac{\delta u}{dx}\frac{du}{dx} -\delta u u) = 0$

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

For integrating above expression numerically we will be using **Gauss Quadrature** method and we will tak **2** gauss points as 2 points will be sufficient to accurately give our answer to polynomial integration.

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


$u(x)$ is total displacement including temperature expansion.

$F(x +\Delta x) - F(x) - k\Delta x  u(x) = 0$ 	 

Dividing whole Equation by $\Delta x$

$\frac{ F(x + \Delta x) - F(\Delta x) }{ \Delta x } - k u(x)$ = 0

Take limit as $\Delta x \to 0$

$\frac{dF} {dx} - ku = 0$        {Note : Here $u = u(x)$} 

$\sigma = \frac{F}{A}$ also $\sigma = E(\frac{du}{dx}-\alpha \Delta T)$  

**E** = Elasticity modulus, **A**= Cross Sectional Area 
Thus,

$F = EA(\frac{du}{dx}-\alpha \Delta T)$

Known Boundary Conditions

$u(0) = 0$

$\left.\frac{du}{dx} \right|_{x=l} = \frac{F}{EA} + \alpha \Delta T$

and, Finally putting value of **F** in our governing equation

$\frac{d}{dx}[EA\frac{du}{dx}-\alpha \Delta T] - ku =0$

Finally Putting values of constants in our equations, questions have asked us to take all constants as unity, so be it.

--------------------------------------------------------------------
$\frac{d^2u}{dx^2} - u =0$ for $x \in (0,1)$
 
$u(0) = 0$
 
$\frac{du}{dx} = 2$ at $x = 1$

---------------------------------------------------------------------


Solving   $\frac{d^2u}{dx^2} - u =0$ for $x \in (0,1)$

with Boundary conditions

$u(0) = 0$
 
$\frac{du}{dx} = 2$ at $x = 1$

We get 

$=>$  $u(x) = \frac{2e}{1+e^2}(e^x - e^{-x})$
<br>

Finally we get our analytical solution any any $x$.



$=>$  $u(x) = \frac{2e}{e^2+1}(e^x-e^{-x})$ 
-

<br>


## **Deriving Weak Form**

$\int_{1}^{2}\delta u(\frac{d^2u}{dx^2} - u) = 0$

$\delta u$ is weight function that varies linearly like u since we are going to take linear approximation for our calculations  

Evaluating further

$\int_{1}^{2}(\frac{d}{dx}(\delta u \frac{du}{dx}) -  \frac{\delta u}{dx}\frac{du}{dx} -\delta u u) = 0$

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

For integrating above expression numerically we will be using **Gauss Quadrature** method and we will tak **2** gauss points as 2 points will be sufficient to accurately give our answer to polynomial integration.

Analysis Procedure
- We will run [This code](https://github.com/notcamelcase01/FemAssignments/blob/master/AssignmentFEMQ1.m) on octave to get values of displacements and stresses.
- We will also compare numerically calculated stresses and displacement with our analytical solution i.e $=>$  $u(x) = \frac{2e}{e^2+1}(e^x-e^{-x})$ 
- We will plot graph of displacement for each node.

Observations 

- Number of Elements : 10
- Root Mean Square Error (Displacements)  = $1.9632*10^{-04}$

---

| x   | analytical displacement | numerical displacement | numerical stress | analytical stress |
|-----|--------------|-------------|--------|-------------------|
|   0 |            0 |           0 | 1.2979 |            1.2977 |
| 0.1 |       0.1298 |      0.1298 | 1.3109 |            1.3107 |
| 0.2 |        0.261 |      0.2609 |  1.337 |            1.3368 |
| 0.3 |       0.3947 |      0.3946 | 1.3765 |            1.3763 |
| 0.4 |       0.5324 |      0.5322 | 1.4298 |            1.4296 |
| 0.5 |       0.6754 |      0.6752 | 1.4975 |            1.4971 |
| 0.6 |       0.8252 |       0.825 | 1.5801 |            1.5797 |
| 0.7 |       0.9832 |       0.983 | 1.6786 |            1.6781 |
| 0.8 |       1.1511 |      1.1508 | 1.7938 |            1.7932 |
| 0.9 |       1.3305 |      1.3302 | 1.9271 |            1.9263 |
|   1 |       1.5232 |      1.5229 |      2 |                 2 |


---

- Graph of Displacement vs x

![image](https://i.imgur.com/vDixAWs.png)

----------

k1,k2,k3,p1,p2,u,v,x,y = var('k1, k2, k3, p1, p2, u, v, x, y')
0==u*(1+k1*(u^2+v^2)^2+k2*(u^2+v^2)^4+k3*(u^2+v^2)^6)+2*p1*u*v+p2*((u^2+v^2)^2+2*u^2)-x
0==v*(1+k1*(u^2+v^2)^2+k2*(u^2+v^2)^4+k3*(u^2+v^2)^6)+p1*((u^2+v^2)^2+2*v^2)+2*p2*u*v-y

diff(0==u*(1+k1*(u^2+v^2)^2+k2*(u^2+v^2)^4+k3*(u^2+v^2)^6)+2*p1*u*v+p2*((u^2+v^2)^2+2*u^2)-x,u)
diff(0==u*(1+k1*(u^2+v^2)^2+k2*(u^2+v^2)^4+k3*(u^2+v^2)^6)+2*p1*u*v+p2*((u^2+v^2)^2+2*u^2)-x,v)
diff(0==v*(1+k1*(u^2+v^2)^2+k2*(u^2+v^2)^4+k3*(u^2+v^2)^6)+p1*((u^2+v^2)^2+2*v^2)+2*p2*u*v-y,u)
diff(0==v*(1+k1*(u^2+v^2)^2+k2*(u^2+v^2)^4+k3*(u^2+v^2)^6)+p1*((u^2+v^2)^2+2*v^2)+2*p2*u*v-y,v)


Solutions (in the same order)
0 == (u^2 + v^2)^6*k3 + (u^2 + v^2)^4*k2 + (u^2 + v^2)^2*k1 + 4*((u^2 + v^2)*u + u)*p2 + 4*(3*(u^2 + v^2)^5*k3*u + 2*(u^2 + v^2)^3*k2*u + (u^2 + v^2)*k1*u)*u + 2*p1*v + 1

0 == 4*(u^2 + v^2)*p2*v + 4*(3*(u^2 + v^2)^5*k3*v + 2*(u^2 + v^2)^3*k2*v + (u^2 + v^2)*k1*v)*u + 2*p1*u

0 == 4*(u^2 + v^2)*p1*u + 4*(3*(u^2 + v^2)^5*k3*u + 2*(u^2 + v^2)^3*k2*u + (u^2 + v^2)*k1*u)*v + 2*p2*v

0 == (u^2 + v^2)^6*k3 + (u^2 + v^2)^4*k2 + (u^2 + v^2)^2*k1 + 4*((u^2 + v^2)*v + v)*p1 + 2*p2*u + 4*(3*(u^2 + v^2)^5*k3*v + 2*(u^2 + v^2)^3*k2*v + (u^2 + v^2)*k1*v)*v + 1

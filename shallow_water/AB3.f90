

SUBROUTINE AB3(u,v,eta,flux_u1,flux_u2,flux_u3,flux_v1,flux_v2,flux_v3,flux_h1,&
     flux_h2, flux_h3, masqueX, masqueY)

  USE Parametres

  IMPLICIT NONE

  REAL ::  u(n,Ny+1,Nx+1), v(n,Ny+1,Nx+1), eta(n,Ny+1,Nx+1)
  
  REAL :: flux_u1(n,Ny+1,Nx+1), flux_u2(n,Ny+1,Nx+1), flux_u3(n,Ny+1,Nx+1)
  REAL :: flux_v1(n,Ny+1,Nx+1), flux_v2(n,Ny+1,Nx+1), flux_v3(n,Ny+1,Nx+1)
  REAL :: flux_h1(n,Ny+1,Nx+1), flux_h2(n,Ny+1,Nx+1), flux_h3(n,Ny+1,Nx+1)

  REAL :: masqueX(Ny+1,Nx+1), masqueY(Ny+1,Nx+1)


  INTEGER :: i,j
  
  DO j = 1,Nx+1
     DO i = 1,Ny+1
     
        u(1,i,j) = u(1,i,j) + (dt/12.0)*(23.0*flux_u3(1,i,j) &
             - 16.0*flux_u2(1,i,j) + 5.0*flux_u1(1,i,j))
     
        v(1,i,j) = v(1,i,j) + (dt/12.0)*(23.0*flux_v3(1,i,j) &
             - 16.0*flux_v2(1,i,j) + 5.0*flux_v1(1,i,j))
     
        eta(1,i,j) = eta(1,i,j) + (dt/12.0)*(23.0*flux_h3(1,i,j) &
             - 16.0*flux_h2(1,i,j) + 5.0*flux_h1(1,i,j))


     

        u(2,i,j) = u(2,i,j) + (dt/12.0)*(23.0*flux_u3(2,i,j) &
             - 16.0*flux_u2(2,i,j) + 5.0*flux_u1(2,i,j))

        v(2,i,j) = v(2,i,j) + (dt/12.0)*(23.0*flux_v3(2,i,j) &
             - 16.0*flux_v2(2,i,j) + 5.0*flux_v1(2,i,j))
     
        eta(2,i,j) = eta(2,i,j) + (dt/12.0)*(23.0*flux_h3(2,i,j) &
             - 16.0*flux_h2(2,i,j) + 5.0*flux_h1(2,i,j))
    
     END DO
  END DO

  u(1,:,:) = masqueX*u(1,:,:)
  u(2,:,:) = masqueX*u(2,:,:)

  v(1,:,:) = masqueY*v(1,:,:)
  v(2,:,:) = masqueY*v(2,:,:)

END SUBROUTINE AB3

function  [reconstructed_image, PSNR_Final, FSIM_Final, SSIM_Final, All_PSNR, Outloop,Err_or] = Inpainting_JPG_SR(y,Options,  difff)


mask            =              Options.A;

A               =              @(x) mask.*x;

AT              =              @(x) mask.*x;

ATy             =              AT(y);

%mu = Options.mu;
mu             =              Options.mu; % Parameter for PSR

Thr             =              Options.Thr;

x               =              Options.initial;

IterNums        =              Options.IterNums;

true            =              Options.true;

b               =              zeros(size(y));

y1              =              zeros(size(y));

%w               =              zeros(size(y));

muinv           =              1/mu;

invAAT          =             1./( mu + mask);


fprintf('Initial PSNR = %0.2f\n',csnr(x,true,0,0));

    All_PSNR             =              zeros(1,IterNums);

 JPG_SR_Results          =                      cell (1,IterNums);   
 
 

     

for Outloop = 1:IterNums
    
    
          
        z                =                  Solver_PSR(x-y1-b,Thr);  %\alpha
        
        
        w                =                  Solve_GSR(x-z-b,Options); %\beta
        
        
        r                =                  ATy + mu* (z+w+b);
        
        
        x                =                  muinv*(r - AT(invAAT.*A(r)));
        
        
        b                =                  b + (z + w - x);
        
        y1               =                  w;
        
           
       % b                =                  b + (z - x);
    
    %    c                =                  c + (w - x);
        
   All_PSNR(Outloop)     =              csnr(x,true,0,0);
   
      JPG_SR_Results{Outloop}      =                      x;
    
    fprintf('iter number = %d, PSNR = %f\n',Outloop,csnr(x,true,0,0));

    
    if Outloop>2
        
      Err_or      =  norm(abs(JPG_SR_Results{Outloop}) - abs(JPG_SR_Results{Outloop-1}),'fro')/norm(abs(JPG_SR_Results{Outloop-1}), 'fro');

        
        if  Err_or <difff
            
            break;
            
        end
        
    end
    
    
end

reconstructed_image             =                 x;

PSNR_Final                      =                 csnr(reconstructed_image,true,0,0);

FSIM_Final                      =                 FeatureSIM(reconstructed_image,true);

SSIM_Final                      =                 cal_ssim(reconstructed_image,true,0,0);

end


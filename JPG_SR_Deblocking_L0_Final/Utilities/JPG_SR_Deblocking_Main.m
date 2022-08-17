function       [reconstructed_image,PSN_Result, FSIM_Result, SSIM_Result, All_PSNR, diff, i]  =  JPG_SR_Deblocking_Main(Inoi, par, Options, JPEG_Quality)


ori_im                 =                par.I;

n_im                   =                Inoi;

[h1, w1]               =                size(ori_im);

IterNum                =                par.IterNum;

d_im                   =                Inoi;

v                      =                par.nSig;

cnt                    =                1;

All_PSNR               =                 zeros(1,IterNum);

GSR_NLS_Results        =                 cell (1,IterNum);   

b                      =                zeros(size(d_im));

y1                      =                zeros(size(d_im));

rou                    =                par.rou; % mu2



%w                      =                d_im;

%f                      =                d_im;


if  JPEG_Quality <=1
    
    err_or  = 0.0031;

    
elseif  JPEG_Quality <=5
    
   err_or = 0.0031;

elseif  JPEG_Quality <=10
    
   err_or = 0.0027;
       
elseif  JPEG_Quality <=20
    
    err_or = 0.0008;
    
elseif  JPEG_Quality <=30
    
       err_or = 0.00079;
       
else
    
       err_or =0.0008;
end

for i                  =                1 : IterNum %
    
   %               PSR Operator...............................
        
    r                  =               d_im - y1-b;  
   
    f                  =               Solver_PSR(r,8); %Pach_based sparse coding
   
%    f                  =               BDCT_project_onto_QCS(f, par.C_q, par.QTable, par.Qfactor, par.blockSize);
    
    %               GSR Operator...............................
    
    g                  =               d_im - f- b;  
   
   [w]                 =               Solve_GSR(g, Options);
   
 %   w                  =               BDCT_project_onto_QCS(w, par.C_q, par.QTable, par.Qfactor, par.blockSize);   
    

    
    dif                =               d_im - n_im;
    
    vd                 =               v^2-(mean(mean(dif.^2)));
    
    if (i ==1)
        
    par.nSig           =               sqrt(abs(vd));
    
    else
        
    par.nSig           =               sqrt(abs(vd))*par.lamada;
        
    end  
    
    
%d_im = (n_im*rou*par.nSig^2* beta * par.nSig^2 + v^2*rou*par.nSig^2* (f+b) + v^2*beta * par.nSig^2*(w+c))/...
%    (rou*par.nSig^2*v^2 + beta * par.nSig^2 * v^2 + rou*par.nSig^2* beta * par.nSig^2);  


d_im    =  (n_im*rou*par.nSig^2 +v^2*(f+w+b))/(rou*par.nSig^2 +v^2);

d_im                  =               BDCT_project_onto_QCS(d_im, par.C_q, par.QTable, par.Qfactor, par.blockSize);   

       
    
    b                  =               b + (f +w - d_im);

    
      y1               =               w;

    
     fprintf('IterNum = %d, PSNR = %f\n', i, csnr( d_im(1:h1,1:w1), ori_im, 0, 0) );
    
    All_PSNR(cnt) = csnr( d_im(1:h1,1:w1), ori_im, 0, 0 );   
    
    GSR_NLS_Results{i}      =                      d_im;
    
    
    
    
     if i>6
         
   diff      =  norm(abs(GSR_NLS_Results{i}) - abs(GSR_NLS_Results{i-1}),'fro')/norm(abs(GSR_NLS_Results{i-1}), 'fro');    
   
        if diff < err_or
            
            break;
            
        end
        
     end
    
 cnt   =  cnt + 1;      
end

reconstructed_image                      =                   d_im;

PSN_Result                               =                   csnr(reconstructed_image,ori_im,0,0);

FSIM_Result                              =                   FeatureSIM(reconstructed_image,ori_im);

SSIM_Result                              =                   cal_ssim(reconstructed_image,ori_im,0,0);

end


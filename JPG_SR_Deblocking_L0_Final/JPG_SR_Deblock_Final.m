clc
clear
m_10_1=0; 
m_10_2=0; 
m_10_3=0; 
m_20_1=0; 
m_20_2=0; 
m_20_3=0; 
m_30_1=0; 
m_30_2=0; 
m_30_3=0; 
m_40_1=0;
m_40_2=0; 
m_40_3=0; 
m_50_1=0;
m_50_2=0; 
m_50_3=0; 
m_75_1=0;
m_75_2=0; 
m_75_3=0; 
m_100_1=0;
m_100_2=0; 
m_100_3=0; 

All_data_Results_10_1 = cell(1,200);
All_data_Results_10_2 = cell(1,200);
All_data_Results_10_3 = cell(1,200);

All_data_Results_20_1 = cell(1,200);
All_data_Results_20_2 = cell(1,200);
All_data_Results_20_3 = cell(1,200);

All_data_Results_30_1 = cell(1,200);
All_data_Results_30_2 = cell(1,200);
All_data_Results_30_3 = cell(1,200);

All_data_Results_40_1 = cell(1,200);
All_data_Results_40_2 = cell(1,200);
All_data_Results_40_3 = cell(1,200);

All_data_Results_50_1 = cell(1,200);
All_data_Results_50_2 = cell(1,200);
All_data_Results_50_3 = cell(1,200);

All_data_Results_75_1 = cell(1,200);
All_data_Results_75_2 = cell(1,200);
All_data_Results_75_3 = cell(1,200);

All_data_Results_100_1 = cell(1,200);
All_data_Results_100_2 = cell(1,200);
All_data_Results_100_3 = cell(1,200);


filename = 'Barbara256';   
            

for j  =  1:10
    
randn ('seed',0);

filename

JPEG_Quality_Num        =       [1, 5, 10, 20, 30, 40, 50, 60, 70, 80]; 



JPEG_Quality             =       JPEG_Quality_Num(j)

QF                      =    JPEG_Quality;



 IterNum                =    200;
  


 if  JPEG_Quality== 1

       lambda  =   0.04;   rou  =  0.1; c = 1.4;  qfactor  = 0.35;
     
  [Ori, QF,   lambda,  c, rou, qfactor, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final, jj, diff, Time_s]= Deblocking_JPG_SR_Test(filename, QF, IterNum, lambda,  c, rou,  qfactor);
 
 m_10_1= m_10_1+1;
 
 s=strcat('A',num2str(m_10_1));
 
 All_data_Results_10_1{m_10_1}={Ori, QF,   qfactor,    lambda,  c, rou,   Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,jj, diff, Time_s};
 
 xlswrite('NEW_JPG_SR_Deblock_1_final.xls', All_data_Results_10_1{m_10_1},'sheet1',s);
 
 
 elseif  JPEG_Quality== 5
     
         
       lambda  =   0.03;   rou  =  0.2;  c = 0.6;  qfactor  = 0.30;
     
 [Ori, QF,   lambda,  c, rou, qfactor, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final, jj, diff, Time_s]= Deblocking_JPG_SR_Test(filename, QF, IterNum, lambda,  c, rou,  qfactor);
 
 m_20_1= m_20_1+1;
 
 s=strcat('A',num2str(m_20_1));
 
 All_data_Results_20_1{m_20_1}={Ori, QF,   qfactor,    lambda,  c, rou,   Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,jj, diff, Time_s};
 
 xlswrite('NEW_JPG_SR_Deblock_5_final.xls', All_data_Results_20_1{m_20_1},'sheet1',s);
 
 

 
 
  elseif  JPEG_Quality== 10
 
         
         
 lambda  =   0.02;   rou  = 0.4;  c = 1;   qfactor  = 0.25;
     
 [Ori, QF,   lambda,  c, rou, qfactor, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final, jj, diff, Time_s]= Deblocking_JPG_SR_Test(filename, QF, IterNum, lambda,  c, rou,  qfactor);
 
 m_30_1= m_30_1+1;
 
 s=strcat('A',num2str(m_30_1));
 
 All_data_Results_30_1{m_30_1}={Ori, QF,   qfactor,    lambda,  c, rou,   Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,jj, diff, Time_s};
 
 xlswrite('NEW_JPG_SR_Deblock_10_final.xls', All_data_Results_30_1{m_30_1},'sheet1',s);
 

   elseif  JPEG_Quality==20
     

         
   lambda  =   0.09;   rou  =  0.7;  c   = 0.7;  qfactor  = 0.25;
     
     
 [Ori, QF,   lambda,  c, rou, qfactor, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final, jj, diff, Time_s]= Deblocking_JPG_SR_Test(filename, QF, IterNum, lambda,  c, rou,  qfactor);
 
 m_40_1= m_40_1+1;
 
 s=strcat('A',num2str(m_40_1));
 
 All_data_Results_40_1{m_40_1}={Ori, QF,   qfactor,    lambda,  c, rou,   Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,jj, diff, Time_s};
 
 xlswrite('NEW_JPG_SR_Deblock_20_final.xls', All_data_Results_40_1{m_40_1},'sheet1',s);
 
 

 elseif  JPEG_Quality==30
     

         
 lambda  =   0.01;   rou  =  0.9;   c   = 0.4;  qfactor  = 0.25;
     
 [Ori, QF,   lambda,  c, rou, qfactor, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final, jj, diff, Time_s]= Deblocking_JPG_SR_Test(filename, QF, IterNum, lambda,  c, rou,  qfactor);
 
 m_50_1= m_50_1+1;
 
 s=strcat('A',num2str(m_50_1));
 
 All_data_Results_50_1{m_50_1}={Ori, QF,   qfactor,    lambda,  c, rou,   Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,jj, diff, Time_s};
 
 xlswrite('NEW_JPG_SR_Deblock_30_final.xls', All_data_Results_50_1{m_50_1},'sheet1',s);
 

 
 
 elseif  JPEG_Quality==40
     

lambda  =   0.07;   rou  =  0.8;   c   =  0.4;  qfactor  = 0.25;
     
 [Ori, QF,   lambda,  c, rou, qfactor, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final, jj, diff, Time_s]= Deblocking_JPG_SR_Test(filename, QF, IterNum, lambda,  c, rou,  qfactor);
 
 m_75_1= m_75_1+1;
 
 s=strcat('A',num2str(m_75_1));
 
 All_data_Results_75_1{m_75_1}={Ori, QF,   qfactor,    lambda,  c, rou,   Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,jj, diff, Time_s};
 
 xlswrite('NEW_JPG_SR_Deblock_40_final.xls', All_data_Results_75_1{m_75_1},'sheet1',s);
 


elseif  JPEG_Quality== 50
     

         
    lambda  =   0.07;   rou  =  0.8;   c   =  0.4;  qfactor  = 0.25;
     
 [Ori, QF,   lambda,  c, rou, qfactor, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final, jj, diff, Time_s]= Deblocking_JPG_SR_Test(filename, QF, IterNum, lambda,  c, rou,  qfactor);
 
 m_100_1= m_100_1+1;
 
 s=strcat('A',num2str(m_100_1));
 
 All_data_Results_100_1{m_100_1}={Ori, QF,   qfactor,    lambda,  c, rou,   Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,jj, diff, Time_s};
 
 xlswrite('NEW_JPG_SR_Deblock_50_final.xls', All_data_Results_100_1{m_100_1},'sheet1',s);
 
 
elseif  JPEG_Quality== 60
         
    lambda  =   0.07;   rou  =  0.8;   c   =  0.4;  qfactor  = 0.25;
     
 [Ori, QF,   lambda,  c, rou, qfactor, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final, jj, diff, Time_s]= Deblocking_JPG_SR_Test(filename, QF, IterNum, lambda,  c, rou,  qfactor);
 
 m_100_2= m_100_2+1;
 
 s=strcat('A',num2str(m_100_2));
 
 All_data_Results_100_2{m_100_2}={Ori, QF,   qfactor,    lambda,  c, rou,   Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,jj, diff, Time_s};
 
 xlswrite('NEW_JPG_SR_Deblock_60_final.xls', All_data_Results_100_2{m_100_2},'sheet1',s);         
          
elseif  JPEG_Quality== 70         
         
    lambda  =   0.07;   rou  =  0.8;   c   =  0.4;  qfactor  = 0.25;
     
 [Ori, QF,   lambda,  c, rou, qfactor, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final, jj, diff, Time_s]= Deblocking_JPG_SR_Test(filename, QF, IterNum, lambda,  c, rou,  qfactor);
 
 m_100_3= m_100_3+1;
 
 s=strcat('A',num2str(m_100_3));
 
 All_data_Results_100_3{m_100_3}={Ori, QF,   qfactor,    lambda,  c, rou,   Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,jj, diff, Time_s};
 
 xlswrite('NEW_JPG_SR_Deblock_70_final.xls', All_data_Results_100_3{m_100_3},'sheet1',s);     
 
 
 else
 
    lambda  =   0.07;   rou  =  0.8;   c   =  0.4;  qfactor  = 0.25;
     
 [Ori, QF,   lambda,  c, rou, qfactor, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final, jj, diff, Time_s]= Deblocking_JPG_SR_Test(filename, QF, IterNum, lambda,  c, rou,  qfactor);
 
 m_10_2= m_10_2+1;
 
 s=strcat('A',num2str(m_10_2));
 
 All_data_Results_10_2{m_10_2}={Ori, QF,   qfactor,    lambda,  c, rou,   Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,jj, diff, Time_s};
 
 xlswrite('NEW_JPG_SR_Deblock_80_final.xls', All_data_Results_10_2{m_10_2},'sheet1',s);   
         
  
 end
 

clearvars -except filename m_10_1 m_10_2 m_10_3 m_20_1 m_20_2 m_20_3 m_30_1 m_30_2 m_30_3 m_40_1 m_40_2 m_40_3...
m_50_1 m_50_2 m_50_3 m_75_1 m_75_2 m_75_3 m_100_1 m_100_2 m_100_3 All_data_Results_10_1...
All_data_Results_10_2 All_data_Results_10_3 All_data_Results_20_1 All_data_Results_20_2...
All_data_Results_20_3 All_data_Results_30_1 All_data_Results_30_2 All_data_Results_30_3...
All_data_Results_40_1 All_data_Results_40_2 All_data_Results_40_3 All_data_Results_50_1...
All_data_Results_50_2 All_data_Results_50_3 All_data_Results_75_1 All_data_Results_75_2...
All_data_Results_75_3 All_data_Results_100_1 All_data_Results_100_2 All_data_Results_100_3
end






         
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



filename = 'Mickey';

for j  =  1:6
    
 filename       
    
randn ('seed',0);

IterNum          =       300;
  
miss_rate        =     [0.1,0.2,0.3,0.4,0.5, 0.6]; % 0.6 represents Inlayed Text Removal


p_miss           =       miss_rate(j)


 if  p_miss == 0.1
     
     
   mu  =   0.2;   c1  =  0.2; Err_or  =  0.001;
   
  
   [Ori, p_miss, mu, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or]= Inpainting_JPG_SR_Main(filename, IterNum, p_miss, mu, c1, Err_or);
 
 m_10_1= m_10_1+1;
 
 s=strcat('A',num2str(m_10_1));
 
 All_data_Results_10_1{m_10_1}={Ori, p_miss, mu,  c1, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or};

 
 xlswrite('JPG_SR_Inpaint_90_Final.xls', All_data_Results_10_1{m_10_1},'sheet1',s);
 

 elseif  p_miss== 0.2
     

         
       mu  =   0.2;   c1  =  0.2;  Err_or  =  0.0007;
     
 [Ori, p_miss, mu, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or]= Inpainting_JPG_SR_Main(filename, IterNum, p_miss, mu, c1, Err_or);
 
 m_20_1= m_20_1+1;
 
 s=strcat('A',num2str(m_20_1));
 
 All_data_Results_20_1{m_20_1}={Ori, p_miss, mu,  c1, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or};
 
 xlswrite('JPG_SR_Inpaint_80_Final.xls', All_data_Results_20_1{m_20_1},'sheet1',s);
 

 
  elseif  p_miss== 0.3
     

         
 mu  =   0.2;   c1  = 0.2;  Err_or  =  0.00048;
     
 [Ori, p_miss, mu, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or]= Inpainting_JPG_SR_Main(filename, IterNum, p_miss, mu, c1, Err_or);
 
 m_30_1= m_30_1+1;
 
 s=strcat('A',num2str(m_30_1));
 
 All_data_Results_30_1{m_30_1}={Ori, p_miss, mu,  c1, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or};
 
xlswrite('JPG_SR_Inpaint_70_Final.xls', All_data_Results_30_1{m_30_1},'sheet1',s);


   elseif  p_miss==0.4
     

   mu  =   0.2;   c1  =  0.2;  Err_or  =  0.00066;
     
 [Ori, p_miss, mu, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or]= Inpainting_JPG_SR_Main(filename, IterNum, p_miss, mu, c1, Err_or);
 
 m_40_1= m_40_1+1;
 
 s=strcat('A',num2str(m_40_1));
 
 All_data_Results_40_1{m_40_1}={Ori, p_miss, mu,  c1, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or};
 
 xlswrite('JPG_SR_Inpaint_60_Final.xls', All_data_Results_40_1{m_40_1},'sheet1',s);
 



 elseif  p_miss==0.5
     

         
 mu  =   0.2;   c1  =  0.2;   Err_or  =  0.0005;
     
 [Ori, p_miss, mu, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or]= Inpainting_JPG_SR_Main(filename, IterNum, p_miss, mu, c1, Err_or);
 
 m_50_1= m_50_1+1;
 
 s=strcat('A',num2str(m_50_1));
 
 All_data_Results_50_1{m_50_1}={Ori, p_miss, mu,  c1, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or};
 
 xlswrite('JPG_SR_Inpaint_50_Final.xls', All_data_Results_50_1{m_50_1},'sheet1',s);

 
 elseif  p_miss==0.6
     
         
mu  =   0.2;   c1  =  0.2;   Err_or  = 0.0003;
     
 [Ori, p_miss, mu, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or]= Inpainting_JPG_SR_Main(filename, IterNum, p_miss, mu, c1, Err_or);
 
 m_75_1= m_75_1+1;
 
 s=strcat('A',num2str(m_75_1));
 
 All_data_Results_75_1{m_75_1}={Ori, p_miss, mu,  c1, jj, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, Err_or};
 
 xlswrite('JPG_SR_Inpaint_text.xls', All_data_Results_75_1{m_75_1},'sheet1',s);
 


 end

clearvars -except filename m_10_1 m_10_2 m_10_3 m_20_1 m_20_2 m_20_3 m_30_1 m_30_2 m_30_3 m_40_1 m_40_2 m_40_3...
m_50_1 m_50_2 m_50_3 m_75_1 m_75_2 m_75_3 m_100_1 m_100_2 m_100_3 All_data_Results_10_1...
All_data_Results_10_2 All_data_Results_10_3 All_data_Results_20_1 All_data_Results_20_2...
All_data_Results_20_3 All_data_Results_30_1 All_data_Results_30_2 All_data_Results_30_3...
All_data_Results_40_1 All_data_Results_40_2 All_data_Results_40_3 All_data_Results_50_1...
All_data_Results_50_2 All_data_Results_50_3 All_data_Results_75_1 All_data_Results_75_2...
All_data_Results_75_3 All_data_Results_100_1 All_data_Results_100_2 All_data_Results_100_3
end






         
function ret=Cross(pcross,lenchrom,chrom,sizepop,bound)
if size(chrom,1) ~= sizepop
    error('Error', size(chrom,1), sizepop);
end
for i=1:sizepop     
    pick = rand(1,2);        
    index1 = randi(sizepop);
    index2 = randi(sizepop);        
    while index1 == index2
        index2 = randi(sizepop);
    end    
    index = [index1, index2];       
    if rand > pcross
        continue;
    end    
    flag = 0;
    while flag == 0
        
        pos = randi(lenchrom);         
       
        v1 = chrom(index1, pos);
        v2 = chrom(index2, pos);
                
        alpha = rand;
        new1 = alpha * v1 + (1-alpha) * v2;
        new2 = alpha * v2 + (1-alpha) * v1;        
       
        orig1 = chrom(index1, pos);
        orig2 = chrom(index2, pos);        
       
        chrom(index1, pos) = new1;
        chrom(index2, pos) = new2;        
        
        flag1 = test(lenchrom, bound, chrom(index1, :));
        flag2 = test(lenchrom, bound, chrom(index2, :));
        
        if flag1 && flag2
            flag = 1; 
        else            
            chrom(index1, pos) = orig1;
            chrom(index2, pos) = orig2;           
            pos = randi(lenchrom);
        end
    end
end
ret = chrom;
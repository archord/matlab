
order=5;
cofnum = (order+1)*(order+2)/2;
flag = -1;

fid = fopen('starlist');
data=textscan(fid,'%f%f%f%f%*f%*f');
fclose(fid);

refx=data{1};
refy=data{2};
inx=data{3};
iny=data{4};

indepvar=[inx,iny];
modelterms=ones(cofnum, 2);
k=1;
for i=0:1:order
    for j=0:1:(order-i)
        modelterms(k,1)=j;
        modelterms(k,2)=i;
        k=k+1;
    end
end


polymodel = polyfitn(indepvar,refy,modelterms);
polymodel

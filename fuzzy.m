load("fuzzyworkspace.mat")

fzy = mamfis('name','OgrenciVerimi');
    % Çalışma süresi
    fzy=addInput(fzy,[0 20],'name','CalismaSuresi');
        fzy=addMF(fzy,'CalismaSuresi','trimf',[0 0 7],'name','dusuk');
        fzy=addMF(fzy,'CalismaSuresi','trimf',[5 9 13],'name','orta');
        fzy=addMF(fzy,'CalismaSuresi','trimf',[11 14 17],'name','yuksek');
        fzy=addMF(fzy,'CalismaSuresi','trimf',[16 20 20],'name','cok_yuksek');
    
        % Devamsızlık
        fzy=addInput(fzy,[0 29],'name','Devamsizlik');
        fzy=addMF(fzy,'Devamsizlik','trimf',[0 0 8],'name','dusuk');
        fzy=addMF(fzy,'Devamsizlik','trimf',[6 13 18],'name','orta');
        fzy=addMF(fzy,'Devamsizlik','trimf',[17 20 25],'name','yuksek');
        fzy=addMF(fzy,'Devamsizlik','trimf',[23.5 29 29],'name','cok_yuksek');
       
        % Özel Ders
        fzy=addInput(fzy,[0 1],'name','OzelDers');
        fzy=addMF(fzy,'OzelDers','trimf',[0 0 0],'name','dusuk');
        fzy=addMF(fzy,'OzelDers','trimf',[1 1 1],'name','yuksek');
        
        % Ebeveyn Desteği
        fzy=addInput(fzy,[0 4],'name','EbeveynDestegi');
        fzy=addMF(fzy,'EbeveynDestegi','trimf',[0 0 1.5],'name','dusuk');
        fzy=addMF(fzy,'EbeveynDestegi','trimf',[1.4 2.2 3],'name','orta');
        fzy=addMF(fzy,'EbeveynDestegi','trimf',[2.9 4 4],'name','yuksek');
        
        % Gönüllülük
        fzy=addInput(fzy,[0 1],'name','Gonulluluk');
        fzy=addMF(fzy,'Gonulluluk','trimf',[0 0 0],'name','dusuk');
        fzy=addMF(fzy,'Gonulluluk','trimf',[1 1 1],'name','yuksek');
        
        % Ortalama
        fzy=addOutput(fzy,[0 4],'name','Ortalama');
        fzy=addMF(fzy,'Ortalama','trimf',[0 0 1],'name','cok_dusuk');
        fzy=addMF(fzy,'Ortalama','trimf',[0.9 1.5 2],'name','dusuk');    
        fzy=addMF(fzy,'Ortalama','trimf',[1.85 2.3 3],'name','orta');
        fzy=addMF(fzy,'Ortalama','trimf',[2.9 3 3.4],'name','yuksek');
        fzy=addMF(fzy,'Ortalama','trimf',[3.35 4 4],'name','cok_yuksek');

ruleList = [
    % Çalışma Düşük, 
    % Devamsızlık Düşük, Özel Ders Düşük
    1 1 1 1 1 1 1 1
    1 1 1 1 2 1 1 1
    1 1 1 2 1 1 1 1
    1 1 1 2 2 3 1 1
    1 1 1 3 1 1 1 1
    1 1 1 3 2 3 1 1

    % Çalışma Düşük, Devamsızlık Düşük, Özel Ders Yüksek
    1 1 2 1 1 2 1 1
    1 1 2 1 2 3 1 1
    1 1 2 2 1 2 1 1
    1 1 2 2 2 3 1 1
    1 1 2 3 1 3 1 1
    1 1 2 3 2 4 1 1
    
    % Çalışma Düşük, Devamsızlık orta, Özel Ders Düşük
    1 2 1 1 1 1 1 1
    1 2 1 1 2 1 1 1
    1 2 1 2 1 2 1 1
    1 2 1 2 2 2 1 1
    1 2 1 3 1 3 1 1
    1 2 1 3 2 3 1 1

    % Çalışma Düşük, Devamsızlık orta, Özel Ders Yüksek
    1 2 2 1 1 2 1 1
    1 2 2 1 2 3 1 1
    1 2 2 2 1 2 1 1
    1 2 2 2 2 3 1 1
    1 2 2 3 1 2 1 1
    1 2 2 3 2 3 1 1

    % Çalışma Düşük, Devamsızlık Yüksek, Özel Ders Düşük
    1 3 1 1 1 1 1 1
    1 3 1 1 2 1 1 1
    1 3 1 2 1 1 1 1
    1 3 1 2 2 1 1 1
    1 3 1 3 1 2 1 1
    1 3 1 3 2 2 1 1

    % Çalışma Düşük, Devamsızlık Yüksek, Özel Ders Yüksek
    1 3 2 1 1 1 1 1
    1 3 2 1 2 1 1 1
    1 3 2 2 1 1 1 1
    1 3 2 2 2 2 1 1
    1 3 2 3 1 1 1 1
    1 3 2 3 2 3 1 1

    % Çalışma Düşük, Devamsızlık Çok Yüksek, Özel Ders Düşük
    1 4 1 1 1 1 1 1
    1 4 1 1 2 1 1 1
    1 4 1 2 1 1 1 1
    1 4 1 2 2 1 1 1
    1 4 1 3 1 1 1 1
    1 4 1 3 2 1 1 1

    % Çalışma Düşük, Devamsızlık Çok Yüksek, Özel Ders Yüksek
    1 4 2 1 1 1 1 1
    1 4 2 1 2 1 1 1
    1 4 2 2 1 1 1 1
    1 4 2 2 2 1 1 1
    1 4 2 3 1 1 1 1
    1 4 2 3 2 1 1 1

    % Çalışma Orta, 
    % Devamsızlık Düşük, Özel Ders Düşük
    2 1 1 1 1 1 1 1
    2 1 1 1 2 2 1 1
    2 1 1 2 1 2 1 1
    2 1 1 2 2 3 1 1
    2 1 1 3 1 3 1 1
    2 1 1 3 2 4 1 1

    % Çalışma Orta, Devamsızlık Düşük, Özel Ders Yüksek
    2 1 2 1 1 2 1 1
    2 1 2 1 2 3 1 1
    2 1 2 2 1 3 1 1
    2 1 2 2 2 3 1 1
    2 1 2 3 1 4 1 1
    2 1 2 3 2 5 1 1
    
    % Çalışma Orta, Devamsızlık Orta, Özel Ders Düşük
    2 2 1 1 1 2 1 1
    2 2 1 1 2 2 1 1
    2 2 1 2 1 2 1 1
    2 2 1 2 2 3 1 1
    2 2 1 3 1 2 1 1
    2 2 1 3 2 3 1 1

    % Çalışma Orta, Devamsızlık Orta, Özel Ders Yüksek
    2 2 2 1 1 2 1 1
    2 2 2 1 2 3 1 1
    2 2 2 2 1 2 1 1
    2 2 2 2 2 3 1 1
    2 2 2 3 1 3 1 1
    2 2 2 3 2 4 1 1

    % Çalışma Orta, Devamsızlık Yüksek, Özel Ders Düşük
    2 3 1 1 1 1 1 1
    2 3 1 1 2 2 1 1
    2 3 1 2 1 1 1 1
    2 3 1 2 2 2 1 1
    2 3 1 3 1 3 1 1
    2 3 1 3 2 3 1 1

    % Çalışma Orta, Devamsızlık Yüksek, Özel Ders Yüksek
    2 3 2 1 1 3 1 1
    2 3 2 1 2 3 1 1
    2 3 2 2 1 3 1 1
    2 3 2 2 2 4 1 1
    2 3 2 3 1 1 1 1
    2 3 2 3 2 2 1 1

    % Çalışma Orta, Devamsızlık Çok Yüksek, Özel Ders Düşük
    2 4 1 1 1 1 1 1
    2 4 1 1 2 1 1 1
    2 4 1 2 1 1 1 1
    2 4 1 2 2 2 1 1
    2 4 1 3 1 1 1 1
    2 4 1 3 2 2 1 1

    % Çalışma Orta, Devamsızlık Çok Yüksek, Özel Ders Yüksek
    2 4 2 1 1 1 1 1
    2 4 2 1 2 1 1 1
    2 4 2 2 1 1 1 1
    2 4 2 2 2 2 1 1
    2 4 2 3 1 2 1 1
    2 4 2 3 2 3 1 1

    % Çalışma Yüksek, 
    % Devamsızlık Düşük, Özel Ders Düşük
    3 1 1 1 1 3 1 1
    3 1 1 1 2 4 1 1
    3 1 1 2 1 3 1 1
    3 1 1 2 2 4 1 1
    3 1 1 3 1 3 1 1
    3 1 1 3 2 5 1 1

    % Çalışma Yüksek, Devamsızlık Düşük, Özel Ders Yüksek
    3 1 2 1 1 3 1 1
    3 1 2 1 2 3 1 1
    3 1 2 2 1 3 1 1
    3 1 2 2 2 5 1 1
    3 1 2 3 1 4 1 1
    3 1 2 3 2 5 1 1

    % Çalışma Yüksek, Devamsızlık orta, Özel Ders Düşük
    3 2 1 1 1 2 1 1
    3 2 1 1 2 2 1 1
    3 2 1 2 1 2 1 1
    3 2 1 2 2 3 1 1
    3 2 1 3 1 2 1 1
    3 2 1 3 2 3 1 1

    % Çalışma Yüksek, Devamsızlık orta, Özel Ders Yüksek
    3 2 2 1 1 2 1 1
    3 2 2 1 2 2 1 1
    3 2 2 2 1 2 1 1
    3 2 2 2 2 3 1 1
    3 2 2 3 1 3 1 1
    3 2 2 3 2 3 1 1

    % Çalışma Yüksek, Devamsızlık Yüksek, Özel Ders Düşük
    3 3 1 1 1 1 1 1
    3 3 1 1 2 1 1 1
    3 3 1 2 1 1 1 1
    3 3 1 2 2 3 1 1
    3 3 1 3 1 1 1 1
    3 3 1 3 2 3 1 1

    % Çalışma Yüksek, Devamsızlık Yüksek, Özel Ders Yüksek
    3 3 2 1 1 1 1 1
    3 3 2 1 2 1 1 1
    3 3 2 2 1 2 1 1
    3 3 2 2 2 2 1 1
    3 3 2 3 1 2 1 1
    3 3 2 3 2 3 1 1

    % Çalışma Yüksek, Devamsızlık Çok Yüksek, Özel Ders Düşük
    3 4 1 1 1 1 1 1
    3 4 1 1 2 1 1 1
    3 4 1 2 1 1 1 1
    3 4 1 2 2 1 1 1
    3 4 1 3 1 1 1 1
    3 4 1 3 2 3 1 1

    % Çalışma Yüksek, Devamsızlık Çok Yüksek, Özel Ders Yüksek
    3 4 2 1 1 1 1 1
    3 4 2 1 2 1 1 1
    3 4 2 2 1 1 1 1
    3 4 2 2 2 3 1 1
    3 4 2 3 1 2 1 1
    3 4 2 3 2 3 1 1

    % Çalışma Çok Yüksek, 
    % Devamsızlık Düşük, Özel Ders Düşük
    4 1 1 1 1 4 1 1
    4 1 1 1 2 5 1 1
    4 1 1 2 1 5 1 1
    4 1 1 2 2 5 1 1
    4 1 1 3 1 5 1 1
    4 1 1 3 2 5 1 1

    % Çalışma Çok Yüksek, Devamsızlık Düşük, Özel Ders Yüksek
    4 1 2 1 1 5 1 1
    4 1 2 1 2 4 1 1
    4 1 2 2 1 4 1 1
    4 1 2 2 2 5 1 1
    4 1 2 3 1 4 1 1
    4 1 2 3 2 5 1 1
    
    % Çalışma Çok Yüksek, Devamsızlık orta, Özel Ders Düşük
    4 2 1 1 1 2 1 1
    4 2 1 1 2 3 1 1
    4 2 1 2 1 3 1 1
    4 2 1 2 2 4 1 1
    4 2 1 3 1 3 1 1
    4 2 1 3 2 5 1 1

    % Çalışma Çok Yüksek, Devamsızlık orta, Özel Ders Yüksek
    4 2 2 1 1 4 1 1
    4 2 2 1 2 4 1 1
    4 2 2 2 1 3 1 1
    4 2 2 2 2 5 1 1
    4 2 2 3 1 5 1 1
    4 2 2 3 2 5 1 1

    % Çalışma Çok Yüksek, Devamsızlık Yüksek, Özel Ders Düşük
    4 3 1 1 1 1 1 1
    4 3 1 1 2 2 1 1
    4 3 1 2 1 1 1 1
    4 3 1 2 2 3 1 1
    4 3 1 3 1 2 1 1
    4 3 1 3 2 3 1 1

    % Çalışma Çok Yüksek, Devamsızlık Yüksek, Özel Ders Yüksek
    4 3 2 1 1 1 1 1
    4 3 2 1 2 2 1 1
    4 3 2 2 1 2 1 1
    4 3 2 2 2 4 1 1
    4 3 2 3 1 3 1 1
    4 3 2 3 2 4 1 1

    % Çalışma Çok Yüksek, Devamsızlık Çok Yüksek, Özel Ders Düşük
    4 4 1 1 1 1 1 1
    4 4 1 1 2 1 1 1
    4 4 1 2 1 1 1 1
    4 4 1 2 2 3 1 1
    4 4 1 3 1 2 1 1
    4 4 1 3 2 3 1 1

    % Çalışma Çok Yüksek, Devamsızlık Çok Yüksek, Özel Ders Yüksek
    4 4 2 1 1 1 1 1
    4 4 2 1 2 1 1 1
    4 4 2 2 1 1 1 1
    4 4 2 2 2 3 1 1
    4 4 2 3 1 2 1 1
    4 4 2 3 2 3 1 1
];


fzy = addRule(fzy, ruleList);
showrule(fzy)

plotfis(fzy);
figure;
plotmf(fzy, 'input', 1);
figure;
plotmf(fzy, 'input', 2);
figure;
plotmf(fzy, 'input', 3);
figure;
plotmf(fzy, 'input', 4);
figure;
plotmf(fzy, 'input', 5);
figure;

plotmf(fzy, 'output', 1);
figure;

writeFIS(fzy, 'fuzzy.fis');


f=readfis('fuzzy.fis');

x = 0;
for i=1:length(Devamsizlik)
    tahmin(i,1)=evalfis([HaftalikCalismaSuresi(i,1) Devamsizlik(i,1) OzelDers(i,1) EbeveynDestegi(i,1) Gonulluluk(i,1)],f);
    x(i,1) = i;
end    
tahmin(isnan(tahmin))= 0; 
plot(x, tahmin, 'b', x, Ortalama, 'r');
xlabel("x");
ylabel("y");
title("Değerler");

mse_gercek = Ortalama'; 
mse_Tahmin = tahmin';

% MSE Hesaplama
mse = mean((mse_Tahmin - mse_gercek).^2);

gercek_ortalama = mean(mse_gercek);

% R^2 Hesaplama
pay = sum((mse_gercek - mse_Tahmin).^2);       
payda = sum((mse_gercek - gercek_ortalama).^2); 

rkare = 1 - (pay / payda);
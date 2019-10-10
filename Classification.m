clc
clear all
x1 = 5;
y1 = 5;

x2 = 8;
y2 = 8;

for i=1:1000
    
    Data1_org(:,i) = [x1+random('Normal',0,1);y1+random('Normal',0,1)];
    Data2_org(:,i) = [x2+random('Normal',0,1);y2+random('Normal',0,1)];
    
end
Data = [Data1_org,Data2_org];
mean1 = [4;5];
mean2 = [5;4];
MEAN_REC1 = mean1;
MEAN_REC2 = mean2;
run = 5;
for j =1:run
    a=1;
b=1;
    for i =1:2000
        dist1 = norm(Data(:,i)-mean1);
        dist2 = norm(Data(:,i)-mean2);
        if dist1 < dist2
            Data1(:,a) = Data(:,i);
            a = a+1;
        end
        if dist1 > dist2
            Data2(:,b) = Data(:,i);
            b=b+1;
        end
    end
    mean1 = [mean(Data1(1,:));mean(Data1(2,:))];
    mean2 = [mean(Data2(1,:));mean(Data2(2,:))];
    MEAN_REC1 = [MEAN_REC1,mean1];
    MEAN_REC2 = [MEAN_REC2,mean2];
    clear Data a b
    Data = [Data1,Data2];
    figure(1)
    pause(1)
    scatter(Data1(1,:),Data1(2,:),'b');
    hold on;
    scatter(Data2(1,:),Data2(2,:),'r');
    hold on
    plot(mean1(1,1),mean1(2,1),'*')
    hold on
    plot(mean2(1,1),mean2(2,1),'*')
    pause(1)
    if j <= run-1
    clear Data1 Data2
    end
    
end
figure(1)
scatter(Data1(1,:),Data1(2,:),'b');
hold on;
scatter(Data2(1,:),Data2(2,:),'r');
hold on
plot(mean1(1,1),mean1(2,1),'*')
hold on
plot(mean2(1,1),mean2(2,1),'*')

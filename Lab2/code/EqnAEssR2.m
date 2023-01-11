function [V,P1,P2,P3,P4]=EqnAEssR2(infA,supA,Aq,infb,supb,bq)
%
% Функция EqnAEssR2 рисует множество AE-решений
% для интервальной системы линейных уравнений  A x = b, где
%   A - интервальная матрица, у которой m строк и 2 столбца;
%   b - интервальный вектор длины m.
%
% Входные аргументы:
% infA, supA - нижний и верхний концы матрицы A - вещественные матрицы;
% Aq - матрица из букв 'A' и 'E' (набирать на английском языке),
%      которые соответствуют кванторам всеобщности и существования 
%      в описании AE-решения;
%   размер матриц infA, supA и Aq такой же как размер матрицы A 
%   (m строк и 2 столбца);
% infb, supb - нижний и верхний концы вектора b - вещественные векторы длины m;
% bq - вектор длины m из букв 'A' и 'E' (назначение букв как в Aq).
%
% Выходные аргументы:
% V -  ориентиры (вершины пересечений множества решений с ортантами);
% Pk - если множество решений в ортанте k ограничено, Pk дает
%      замкнутый обход по часовой стрелке множества решений в ортанте k,
%      а если неограничено, то аналогичный обход, но для пересечения 
%      множества решений в ортанте k с брусом обрезки.
%
% автор: Шарая Ирина Александровна (Институт вычислительных технологий, Новосибирск)
% дата:  07/03/2012

    % перейдем к интервальному включению [uC,oC] x \subseteq [ud,od]
    % в арифметике Каухера
    m=size(infA,1);
    uC=infA; 
    oC=supA;
    Aqe=[Aq==ones(m,2)*'E'];
    uC(Aqe)=supA(Aqe);
    oC(Aqe)=infA(Aqe);
    ud=infb; 
    od=supb; 
    bqa=[bq==ones(m,1)*'A'];
    ud(bqa)=supb(bqa);
    od(bqa)=infb(bqa);

    % нарисуем множество решений включения [uC,oC] x \subseteq [ud,od]
    % и, если надо, напечатаем V и Pk (k=1,2,3,4)
    if nargout < 1
        CxindR2(uC,oC,ud,od);
    end
    if nargout == 1
        [V]=CxindR2(uC,oC,ud,od);
    end
    if nargout > 1
        [V,P1,P2,P3,P4]=CxindR2(uC,oC,ud,od);
    end

end

function [Q] = setQ(Q_diagonal, index)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

Q = eye(4, 4);

for i = 1:1:4
    Q(i,i) = Q_diagonal(index,i);
end
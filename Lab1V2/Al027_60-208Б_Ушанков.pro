/*      ����� ��������� ����� �������? 
����� ����� ��������� � ��������. � ���� ��� ����� �� ����� ���������: 
    - ������� � �������; 
    - ������� � ��������; 
    - ������� � ��������; 
    - ���������� � ��������; 
    - ���������� � ���������. 
� ������ ��������� ����� �� ��������� ��� ��� ����������, ��� �����������, � � 
�����  ��������  ��  ��  ���������  ��  ���������,  ��  �����������.  ���  ��������� 
����������� �� ��������� ��������� ������ �� ������ �����. ����� �� ��������� � � 
������ �������� ����� �����?*/

% ��� � ����� � ������ ��������, ��� ��� �����, ������� � �������� - �����

CONSTANTS
% ������ ��������� ������������ ��� ��������� ����� ���������, ������� �� �������� ��������� ��� ��������
  ����������_����������_��_�����������_�������� = 4
  ����������_����������_��_�����������_��������� = 1
DOMAINS
% ��������� ������� (���������� ��������� � ������)
  ��������� = ���������(���_����������, �����������)
  ���������_��������� = ���������*

  ���_���������� = symbol
  ����������� = symbol

% �������� - ��, ����� ��������� ����� 
  ���������_����� = ���������_�����(���_����������, �����������)
PREDICATES
% �������� ���������� �������� �� ������
  nondeterm ���������_���_����������(���_����������)
  nondeterm ���������_�����������(�����������)
% ������������ ������ ��������� ���������
  nondeterm ���������_���������_�_����(���������)

% �������, ������������ ��������, �� ������� ��������� �� ��������
  nondeterm ���_����������_��_��������(���������_�����, ���������)
  nondeterm �����������_��_��������(���������_�����, ���������)

% ����������� �2� ������� ������, ������������ ������� ������
  nondeterm ��_��������_���_����������_���_�����������(���������_�����, ���������)
  nondeterm ��_��������_���_�_�����������(���������_�����, ���������)

% �� ���������� ������������ ��, ������� ��������� �� �������� ��������
  nondeterm ����������_�����_������������_���������_��_����_���_������������(���������_�����, ���������_���������, integer)
% � ������� ���������
  nondeterm ����������_�����_������������_���������_��_����_�_������������(���������_�����, ���������_���������, integer)

% ��������� ��������
  nondeterm �����������_����������_�����(���������_�����)
% �������� ��������
  nondeterm ���������_����������_�����(���������_�����)
CLAUSES
  ���������_���_����������(���) :-
    ��� = �������;
    ��� = ����������.
  
  ���������_�����������(�����������) :-
    ����������� = �����;
    ����������� = ������;
    ����������� = �������;
    ����������� = ��������.
  
  ���������_���������_�_����(���������) :-
    ��������� = ���������(�������, �����);
    ��������� = ���������(�������, ������);
    ��������� = ���������(�������, �������);
    ��������� = ���������(����������, �������);
    ��������� = ���������(����������, ��������).
  
  �����������_����������_�����(���������_�����(���������, �����������)) :-
    ���������_���_����������(���������),
    ���������_�����������(�����������).

  ���_����������_��_��������(���������_�����(������������������, _), ���������(�������������, _)) :- 
    not(������������� = ������������������).

  �����������_��_��������(���������_�����(_, ����������������), ���������(_, �����������)) :-
    not(���������������� = �����������).
    
% ���� ������� ���������, �� ��������� �� �������� ������ ��������
  ��_��������_���_����������_���_�����������(��������������, ���������) :-
  % ���� �� �������� ��� ����������
    ���_����������_��_��������(��������������, ���������),
  % ��� ���� ����������� �������
    not(�����������_��_��������(��������������, ���������));
  % ���� �� �������� �����������
    �����������_��_��������(��������������, ���������),
  % �� ����� ��� ���������� �������
    not(���_����������_��_��������(��������������, ���������)).
    
% ���� ������� �����������, �� ��������� �� �������� ���������
  ��_��������_���_�_�����������(��������������,���������) :-
  % �� ������� ��� ����������
    ���_����������_��_��������(��������������, ���������),
  % � �����������
    �����������_��_��������(��������������, ���������).
    
% � ������ ������ ��� ������������� ����������
  ����������_�����_������������_���������_��_����_���_������������(_, [], 0).
  ����������_�����_������������_���������_��_����_���_������������(��������������, [������|���������], ���������������������������������):-

    ����������_�����_������������_���������_��_����_���_������������(��������������, ���������, �������������������),
  % ���� ��������� �� ��������
    ��_��������_���_����������_���_�����������(��������������, ������),
  % �� ���������� ������������� ���������� �������������
    ��������������������������������� = ������������������� + 1;

    ����������_�����_������������_���������_��_����_���_������������(��������������, ���������, ���������������������������������),
  % ���� ��������� �������� (not(�� ��������) => ��������), �� ���������� �� ��������
    not(��_��������_���_����������_���_�����������(��������������, ������)).
    
% � ������ ������ ��� ������������� ����������
  ����������_�����_������������_���������_��_����_�_������������(_, [], 0).
  ����������_�����_������������_���������_��_����_�_������������(��������������, [������|���������], ���������������������������������):-

    ����������_�����_������������_���������_��_����_�_������������(��������������, ���������, �������������������),
  % ���� ��������� �� ��������
    ��_��������_���_�_�����������(��������������, ������),
  % �� ���������� �� ��������
    ��������������������������������� = ������������������� + 1;

    ����������_�����_������������_���������_��_����_�_������������(��������������, ���������, ���������������������������������),
  % ���� ��������� �������� (not(�� ��������) => ��������), �� ���������� �� ��������
    not(��_��������_���_�_�����������(��������������, ������)).
  
  ���������_����������_�����(��������������):-
  % ������������� ��� ���������� �����
    �����������_����������_�����(��������������),
  % ������� ��� ��������� ���������
    findall(���������, ���������_���������_�_����(���������), ������������������),
  % ��������������� ���������� �� ����������� ��������� ��� ��������
    ����������_�����_������������_���������_��_����_���_������������(��������������, ������������������, ����������_����������_��_�����������_��������),
    ����������_�����_������������_���������_��_����_�_������������(��������������, ������������������, ����������_����������_��_�����������_���������).
GOAL   
  ���������_����������_�����(�����_�����).
/*			�����
������ ������� ������ �� �����, ������ �� ����� ������. ��� ��������� �� ���� � 
������ ��������. ���������, ��� � ������ ���� ������� ���� ���� � ����� 
�� �������� �� ����� �������. ����� ������� �� �������� - ��� ��������, ���������
�� ����� ������ ������, ����� ���� �������, ������ ������, ��� �������, ���� ������
���� �������� � ��� ���������. ��� � ��� �������?	*/

DOMAINS
	������� = �������(���, ���_������������, ���, �����_��_�����������_�����)
	��� = symbol
	���_������������ = symbol
	��� = symbol
	�����_��_�����������_����� = integer
PREDICATES
	%nondeterm ������������(�������, �������)
	%nondeterm ������_����_������(�������, �������)
	nondeterm ����_�_�������(�������, �������)
	nondeterm �������_����_�����(�������, �������)
CLAUSES
	����_�_�������(�������(���1, ���_������������1, ���1, �����_��_�����������_�����1),
		�������(���2, ���_������������2, ���2, �����_��_�����������_�����2)) :- 
		���1 = ���_������������2,
		���2 = ���_������������1,
		���1 >< ���2.
		
	�������_����_�����(�������(���1, ���_������������1, ���1, �����_��_�����������_�����1),
		�������(���2, ���_������������2, ���2, �����_��_�����������_�����2)) :-
		���1 >< ���2,
		���1 = �������, �����_��_�����������_�����1 < �����_��_�����������_�����2;
		���1 >< ���2,
		���2 = �������, �����_��_�����������_�����2 < �����_��_�����������_�����1.
GOAL
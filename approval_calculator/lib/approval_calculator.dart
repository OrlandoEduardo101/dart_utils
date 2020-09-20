bool isApproved(double n1, double n2, double med){
  if(med ==0)
    throw ArgumentError('A média não pode ser igual a zero!');
  if(n1 < 0 && n1 < 0)
    throw ArgumentError('Notas não podem ser negativas!');
  if(n1 > 10 && n1 > 10)
    throw ArgumentError('Notas não podem ser maior que 10!');


  double result = (n1 + n2)/2;
  if(result < med)
    return false;
  else
    return true;
}
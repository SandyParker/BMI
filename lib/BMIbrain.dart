import 'dart:math';

class BMICal{
  BMICal({required this.height,required this.wieght});

  int height;
  int wieght;

  double _BMI = 0;

  String CalculateBMI()
  {
    _BMI = wieght/ pow(height/100, 2);
    return _BMI.toStringAsFixed(1);
  }

  String getResult()
  {
    if (_BMI >= 25)
      {
        return 'OVERWEIGHT';
      }
    else if (_BMI>18.5)
      {
        return 'NORMAL';
      }
    else
      {
        return 'UNDERWEIGHT';
      }
  }

  String getInter()
  {
    if (_BMI >= 25)
    {
      return 'You have higher than normal body weight. Try to exercise more';
    }
    else if (_BMI>18.5)
    {
      return 'You have normal body weight. Good job!';
    }
    else
    {
      return 'You have lower than normal body weight. You can w';
    }
  }
}
enum DurationEnum{
  AZ,
  ORTA,
  COK,
}

extension DurationDegerAta on DurationEnum{
  Duration time(){
    switch(this){
      case DurationEnum.AZ:
        return Duration(seconds: 2);
      case DurationEnum.ORTA:
        return Duration(seconds: 5);
      case DurationEnum.COK:
        return Duration(seconds: 10);
       default:
          return Duration(seconds: 0);
    }
  }
}
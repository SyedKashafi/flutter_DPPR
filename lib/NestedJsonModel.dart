

    import 'dart:math';

class NestedJsonModel {

      String? ProdMonth;
      String? Shift;
      String? Plan;
      String? Prod;

      NestedJsonModel({
        this.ProdMonth,
        this.Shift,
        this.Plan,
        this.Prod
      });

      NestedJsonModel.fromJson(Map<String, dynamic> json){
        ProdMonth = json['ProdMonth'];
        Shift = json['Shift'];
        Plan = json['Plan'];
        Prod = json['Prod'];
      }
    }

    class Shift {
      String? A;
      String? B;

      Shift({this.A, this.B});

      Shift.fromJson(Map<String, dynamic> json){
        A = json['A'];
        B = json['B'];
      }
    }








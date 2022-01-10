import 'package:get/get.dart';

class MyTranslation extends Translations
{
  @override
  Map<String , Map<String , String>> get keys =>
      {
        'en':
        {
          'title':'Hello world %s'
        },
        'en_Us':
        {
          'title':'Hello World from Us'
        },
        'pt':
        {
          'title':'Ola de portugal'
        },
        'pt_Br':
        {
          'title':'ola de Brasil'
        },
        'ar':
        {
          'title':'اهلا وسهلا'
        }
      };
}
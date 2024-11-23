// ignore_for_file: unused_local_variable, avoid_print

import 'dart:io';
void main()
{
  final projectpath = "${Directory.current.path}/lib";


  final directories = [
      '$projectpath/core/utils',
      '$projectpath/data/models',
      '$projectpath/data/repositories',
      '$projectpath/data/datasources',
      '$projectpath/domain/entities',
      '$projectpath/domain/unsecases',
      '$projectpath/domain/repositories',
      '$projectpath/presentation/pages',
      '$projectpath/presentation/widgets',
  ];


  for(var dir in directories ){
    final directory = Directory(dir);


    if(!directory.existsSync()){
      directory.createSync(recursive: true);
      print('created : $dir done');
    }else{
      print('Directory already exists : $dir');
    }
  }

  print('تم انشاء المجلدات بنجاح ');
}
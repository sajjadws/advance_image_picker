import 'dart:io';

class CropController{

  File _inputFile,_outputFile;

  File get inputFile => _inputFile;

  set inputFile(File value) {
    _inputFile = value;
  }

  get outputFile => _outputFile;

  set outputFile(value) {
    _outputFile = value;
  }


}
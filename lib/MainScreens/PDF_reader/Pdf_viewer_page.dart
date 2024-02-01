import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class pdf_viewer_page extends StatefulWidget {
  const pdf_viewer_page({Key? key}) : super(key: key);

  @override
  State<pdf_viewer_page> createState() => _pdf_viewer_pageState();
}

class _pdf_viewer_pageState extends State<pdf_viewer_page> {
  bool _isLoading = true;
 late PDFDocument document;

  getPdf()async{
    document= await PDFDocument.fromURL('https://catalogimages.wiley.com/images/db/pdf/9780470377277.excerpt.pdf');
   setState(()=>_isLoading=false);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPdf();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:_isLoading
            ? Center(child: CircularProgressIndicator())
            : PDFViewer(document: document)),

    );
  }
}

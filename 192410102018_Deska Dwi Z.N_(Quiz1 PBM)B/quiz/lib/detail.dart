import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:quiz/home.dart';

class Detail extends StatefulWidget {
  final int detail;
  final List data;
  const Detail({Key key, this.detail, this.data})
      : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  void setJumlah(data, detail, operasi) {
    if (operasi == true) {
      data[detail]["jumlah"] = data[detail]["jumlah"] + 1;
    } else {
      data[detail]["jumlah"] = data[detail]["jumlah"] - 1;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Barang"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 320,
              width: double.infinity,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(widget.data[widget.detail]["image"]),
                    fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 5,
                    blurRadius: 5,
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Text(widget.data[widget.detail]["name"].toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600)),
                          Text(
                              "Harga : Rp " +
                                  widget.data[widget.detail]["price"]
                                      .toString(),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    Text(
                      widget.data[widget.detail]["deskripsi"],
                    )
                  ],
                )),
            Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                            height: 30,
                            minWidth: 30,
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: Icon(Icons.remove),
                            splashColor: Colors.lightGreen,
                            onPressed: () {
                              setState(() {
                                if (!(widget.data[widget.detail]["jumlah"] <=
                                    0)) {
                                  setJumlah(widget.data, widget.detail, false);
                                }
                              });
                            }),
                        Container(
                            height: 30,
                            width: 100,
                            child: Center(
                              child: Text(
                                  widget.data[widget.detail]["jumlah"]
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                            )),
                        MaterialButton(
                            height: 30,
                            minWidth: 30,
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: Icon(Icons.add),
                            splashColor: Colors.lightGreen,
                            onPressed: () {
                              setState(() {
                                setJumlah(widget.data, widget.detail, true);
                              });
                            })
                      ],
                    ),
                    MaterialButton(
                        height: 30,
                        minWidth: 30,
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text("Konfirmasi"),
                        splashColor: Colors.lightGreen,
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home(
                                      counter: widget.data[widget.detail]
                                      ["jumlah"],
                                      index: widget.detail)));
                        })
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

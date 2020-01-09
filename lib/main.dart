import 'package:creditcard_neumorphism/nm_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

double transLimit = 1250;

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainCard(),
    );
  }
}

class MainCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mC,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                NMButton(down: false, icon: Icons.arrow_back),
                NMButton(down: false, icon: Icons.search),
              ],
            ),
            Text(
              'Main Card',
              style: TextStyle(
                  color: fCD, fontSize: 30, fontWeight: FontWeight.w700),
            ),
            CreditCard(),
            NMCard(
              active: false,
              icon: Icons.wifi,
              label: 'NFC Payment',
            ),
            NMCard(
              active: true,
              icon: Icons.attach_money,
              label: 'Deposit',
            ),
            NMCard(
              active: true,
              icon: Icons.lock_outline,
              label: 'Fast blocking',
            ),
            TransactionSlider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                NMButton(
                  down: false,
                  icon: Icons.home,
                ),
                NMButton(
                  down: true,
                  icon: Icons.credit_card,
                ),
                NMButton(
                  down: false,
                  icon: Icons.trending_up,
                ),
                NMButton(
                  down: false,
                  icon: Icons.notifications_none,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TransactionSlider extends StatefulWidget {
  @override
  _TransactionSliderState createState() => _TransactionSliderState();
}

class _TransactionSliderState extends State<TransactionSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Transaction Limit', style: TextStyle(color: fCD, fontSize: 16, fontWeight: FontWeight.w500),),
            Text('€ ' + transLimit.toStringAsFixed(0), style: TextStyle(color: fCD, fontSize: 16, fontWeight: FontWeight.w700),)
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.green.shade300,
            inactiveTrackColor: fCL.withOpacity(0.25),
            trackHeight: 5,
            thumbColor: mCL,
            overlayColor: mCL.withOpacity(0.75),
          ),
          child: Slider(
            value: transLimit,
            min: 1,
            max: 3000,
            onChanged: (limitInput){
              setState(() {
                transLimit = limitInput;
              });
            },
          ),
        )
      ],
    );
  }
}

class CreditCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: nMbox,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('VISA', style: TextStyle(color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
              Icon(Icons.more_horiz, color: fCD,),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('* * * *', style: TextStyle(color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
              Text('* * * *', style: TextStyle(color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
              Text('* * * *', style: TextStyle(color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
              Text('8014', style: TextStyle(color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Card Holder', style: TextStyle(color: fCL, fontSize: 12, fontWeight: FontWeight.w700)),
                  Text('Lindsey Johnson', style: TextStyle(color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Expires', style: TextStyle(color: fCL, fontSize: 12, fontWeight: FontWeight.w700)),
                  Text('08 / 21', style: TextStyle(color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class NMButton extends StatelessWidget {
  final bool down;
  final IconData icon;
  const NMButton({this.down, this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: down ? nMboxInvert : nMbox,
      child: Icon(
        icon,
        color: down ? fCD : fCL,
      ),
    );
  }
}

class NMCard extends StatelessWidget {
  final bool active;
  final IconData icon;
  final String label;
  const NMCard({this.active, this.icon, this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      decoration: nMbox,
      child: Row(
        children: <Widget>[
          Icon(icon, color: fCL),
          SizedBox(width: 15),
          Text(
            label,
            style: TextStyle(
                color: fCD, fontWeight: FontWeight.w700, fontSize: 16),
          ),
          Spacer(),
          Container(
            decoration: active ? nMboxInvertActive : nMboxInvert,
            width: 70,
            height: 40,
            child: Container(
              margin: active
                  ? EdgeInsets.fromLTRB(35, 5, 5, 5)
                  : EdgeInsets.fromLTRB(5, 5, 35, 5),
              decoration: nMbtn,
            ),
          ),
        ],
      ),
    );
  }
}

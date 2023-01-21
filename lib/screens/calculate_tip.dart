import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculateTip extends StatefulWidget {
  const CalculateTip({super.key});

  @override
  State<CalculateTip> createState() => _CalculateTipState();
}

class _CalculateTipState extends State<CalculateTip> {
  final TextEditingController controller = TextEditingController();

  double tipAmount = 0.00;
  double total = 0.00;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void calTip(final val, final percent) {
    final amount = int.tryParse(val);

    setState(() {
      tipAmount = percent * amount!;
      total = tipAmount + amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Total Bill Amount",
                  style: GoogleFonts.pangolin(fontSize: 30.0),
                ),
              ),
              const SizedBox(height: 30.0),
              TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Color.fromARGB(255, 230, 229, 229),
                  hintText: "Cost of Service",
                ),
              ),
              const SizedBox(height: 40.0),
              const Center(
                child: Text(
                  "Tip Percentage",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              BuildPercentButton(
                text: "10%",
                onPressed: () {
                  calTip(controller.text, 0.10);
                },
              ),
              const SizedBox(height: 30.0),
              BuildPercentButton(
                text: "15%",
                onPressed: () {
                  calTip(controller.text, 0.15);
                },
              ),
              const SizedBox(height: 30.0),
              BuildPercentButton(
                text: "20%",
                onPressed: () {
                  calTip(controller.text, 0.20);
                },
              ),
              const SizedBox(height: 40.0),
              BuildTextRow(
                text: "Tip Amount:",
                amount: tipAmount,
              ),
              BuildTextRow(
                text: "Total Amount with tip:",
                amount: total,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildTextRow extends StatelessWidget {
  const BuildTextRow({
    Key? key,
    required this.text,
    required this.amount,
  }) : super(key: key);

  final String text;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "\$$amount",
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}

class BuildPercentButton extends StatelessWidget {
  const BuildPercentButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}

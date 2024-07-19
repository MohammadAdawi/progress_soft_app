import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OtpScreen extends StatelessWidget {
  final String verificationId;
  final VoidCallback onVerified;
  final TextEditingController _otpController = TextEditingController();

  OtpScreen({required this.verificationId, required this.onVerified});

  void _verifyOtp(BuildContext context) async {
    String otp = _otpController.text.trim();

    if (otp.isEmpty) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter the OTP")),
      );
      return;
    }

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      onVerified();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid OTP: ${e}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verify OTP")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _otpController,
              decoration: InputDecoration(labelText: "OTP"),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              child: Text("Verify"),
              onPressed: () {
                _verifyOtp(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

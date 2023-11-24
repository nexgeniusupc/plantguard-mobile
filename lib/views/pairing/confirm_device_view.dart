import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/device/pairing.dart';
import '../../services/pairing/pairing_service.dart';
import '../home/home_view.dart';

class ConfirmDeviceView extends StatefulWidget {
  final DevicePairFindResponse response;

  const ConfirmDeviceView(this.response, {super.key});

  @override
  State<ConfirmDeviceView> createState() => _ConfirmDeviceViewState();
}

class _ConfirmDeviceViewState extends State<ConfirmDeviceView> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  String name = '';

  Future<void> handleSubmit(BuildContext context) async {
    final formState = _formKey.currentState;
    if (formState == null) return;
    if (formState.validate()) {
      formState.save();
      final pairingService = context.read<PairingService>();
      await pairingService.confirm(widget.response.code, name: name);
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeView(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm device'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('PlantGuard IoT Sensor'),
              SizedBox.fromSize(size: const Size.fromHeight(16.0)),
              Text('Serial number: ${widget.response.serialNumber}'),
              SizedBox.fromSize(size: const Size.fromHeight(16.0)),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Name'),
                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Required';
                  if (value.length > 50) return 'Max 50 characters';
                  return null;
                },
                onSaved: (value) => name = value!,
              ),
              SizedBox.fromSize(size: const Size.fromHeight(16.0)),
              FilledButton(
                onPressed: () => handleSubmit(context),
                child: const Text('Register device'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/pairing/pairing_service.dart';
import 'confirm_device_view.dart';

class AddDeviceView extends StatefulWidget {
  const AddDeviceView({super.key});

  @override
  State<AddDeviceView> createState() => _AddDeviceViewState();
}

class _AddDeviceViewState extends State<AddDeviceView> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  String code = '';

  Future<void> handleSubmit(BuildContext context) async {
    final formState = _formKey.currentState;
    if (formState == null) return;
    if (formState.validate()) {
      formState.save();
      final pairingService = context.read<PairingService>();
      final response = await pairingService.find(code);
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmDeviceView(response),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add device'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Pairing code'),
                    hintText: '123456',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Required';
                    final regex = RegExp(r'^\d{6}$');
                    if (!regex.hasMatch(value)) return 'Invalid pairing code';
                    return null;
                  },
                  onSaved: (value) => code = value!,
                ),
                SizedBox.fromSize(size: const Size.fromHeight(16.0)),
                FilledButton(
                  onPressed: () => handleSubmit(context),
                  child: const Text('Search'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

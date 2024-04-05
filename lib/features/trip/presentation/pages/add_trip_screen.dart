import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTripScreen extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController(text: "City 1");
  final _descController = TextEditingController(text: "City 1");
  final _locationController = TextEditingController(text: "City 1");
  final _pictureController = TextEditingController(text: "City 1");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(child: 
    
    )
  }
}

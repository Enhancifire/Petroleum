import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:petroleum/src/core/utils/date_utils.dart';
import 'package:petroleum/src/core/utils/size_utils.dart';
import 'package:petroleum/src/features/records/controllers/records_controller.dart';
import 'package:petroleum/src/ui/colors.dart';
import 'package:petroleum/src/ui/theme.dart';

class AddRecordPage extends ConsumerStatefulWidget {
  const AddRecordPage({super.key});

  @override
  AddRecordPageState createState() => AddRecordPageState();
}

class AddRecordPageState extends ConsumerState<AddRecordPage> {
  final TextEditingController _kmCountController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  String shownDate = "Today";

  String? kmCountErrorText;
  String? priceErrorText;
  String? quantityErrorText;

  bool isLoading = false;

  selectDateTime() async {
    final res = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 1100)),
      lastDate: DateTime.now(),
    );

    if (res != null) {
      setState(() {
        selectedDate = res;
        shownDate = convertDateToButtonString(res);
      });
    }
  }

  @override
  void dispose() {
    _kmCountController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  validate() {
    if (_kmCountController.text.isEmpty) {
      setState(() {
        kmCountErrorText = "Km Count is required!";
      });
      return false;
    } else {
      setState(() {
        kmCountErrorText = null;
      });
    }
    if (_priceController.text.isEmpty) {
      setState(() {
        priceErrorText = "Price is required!";
      });
      return false;
    } else {
      setState(() {
        priceErrorText = null;
      });
    }
    if (_quantityController.text.isEmpty) {
      setState(() {
        quantityErrorText = "Quantity is required!";
      });
      return false;
    } else {
      setState(() {
        quantityErrorText = null;
      });
    }
    return true;
  }

  uploadData() async {
    if (!validate()) {
      return;
    }
    setState(() {
      isLoading = true;
    });

    final kmCount = _kmCountController.text;
    final price = _priceController.text;
    final quantity = _quantityController.text;

    final recordsProvider = ref.read(recordsControllerProvider.notifier);

    final res = await recordsProvider.addRecord(
      kmCount: kmCount,
      price: price,
      quantity: quantity,
      date: selectedDate,
    );

    if (res != null) {
      if (mounted) GoRouter.of(context).pop();
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add Record",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                addVerticalSpace(heightValue(context, 24)),
                TextField(
                  controller: _kmCountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Km Count",
                    errorText: kmCountErrorText,
                  ),
                ),
                addVerticalSpace(heightValue(context, 24)),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _priceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Price",
                          errorText: priceErrorText,
                        ),
                      ),
                    ),
                    addHorizontalSpace(widthValue(context, 16)),
                    Expanded(
                      child: TextField(
                        controller: _quantityController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Quantity",
                          errorText: quantityErrorText,
                        ),
                      ),
                    ),
                  ],
                ),
                addVerticalSpace(heightValue(context, 24)),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: selectDateTime,
                        child: Container(
                          height: heightValue(context, 50),
                          decoration: BoxDecoration(
                            border: Border.all(
                              // color: Theme.of(context).inputDecorationTheme.border,
                              color: Colors.white60,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white.withOpacity(0.1),
                          ),
                          padding: const EdgeInsets.only(left: 12),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today),
                              addHorizontalSpace(widthValue(context, 8)),
                              Text(shownDate),
                            ],
                          ),
                        ),
                      ),
                    ),
                    addHorizontalSpace(widthValue(context, 16)),
                    const Spacer(
                      flex: 1,
                    )
                  ],
                ),
                addVerticalSpace(heightValue(context, 24)),
                // Spacer(),
                ElevatedButton(
                  onPressed: uploadData,
                  child: const Center(child: Text("Add")),
                ),
              ],
            ),
          ),
        ),
        if (isLoading)
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
            ),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}

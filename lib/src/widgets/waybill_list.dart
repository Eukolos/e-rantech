import 'package:erantech/src/models/waybill_entity.dart';
import 'package:erantech/src/providers/waybill_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WaybillListWidget extends ConsumerStatefulWidget {
  const WaybillListWidget({super.key});

  @override
  ConsumerState createState() => _WaybillListWidgetState();
}

class _WaybillListWidgetState extends ConsumerState<WaybillListWidget> {
  @override
  Widget build(BuildContext context) {
    final waybillListAsyncValue = ref.read(waybillProvider);

    return waybillListAsyncValue.when(
      data: (waybillList) {
        return ListView.builder(
          itemCount: waybillList.length,
          itemBuilder: (context, index) {
            final waybill = waybillList[index];
            return ListTile(
              title: Text(waybill.waybillNumber ?? 'No waybill number'),
            );
          },
        );
      },
      loading: () => CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
    );
  }
}
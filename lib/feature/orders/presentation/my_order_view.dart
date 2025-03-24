import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntigradproject/feature/orders/presentation/my_order_cancel.dart';
import 'package:ntigradproject/feature/orders/presentation/my_order_complete_view.dart';
import 'package:ntigradproject/feature/orders/presentation/myorder_achieve_view.dart';
import 'package:ntigradproject/feature/orders/presentation/sharedwidget/nofound_order.dart';

class MyOrderView extends StatelessWidget {
  const MyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
    // BlocProvider(
    //   create: (context) => ToggleCubit(index: 0),
    //   child: SafeArea(
    //     child:
    //      Scaffold(
    //       body: Builder(
    //         builder: (context) {
    //           return Column(
    //             children: [
    //               BlocBuilder<ToggleCubit, ToggleState>(
    //                 builder: (context, state) {
    //                   final cubit = context.read<ToggleCubit>();
    //                   if (state is ToggleLoading) {
    //                     return const Center(child: CircularProgressIndicator());
    //                   }
    //                   if (state is ToggleFailure) {
    //                     return noFoundOrder(context);
    //                   }

    //                   Widget currentView = const SizedBox();
    //                   if (cubit.index == 0) {
    //                     currentView = MyOrdersActiveViews();
    //                   } else if (cubit.index == 1) {
    //                     currentView = MyOrdersComplView();
    //                   } else if (cubit.index == 2) {
    //                     currentView = MyOrdersCancelView();
    //                   }
    //                   return Expanded(
    //                     child: AnimatedSwitcher(
    //                       switchInCurve: Curves.easeInCirc,
    //                       duration: const Duration(seconds: 1),
    //                       child: currentView,
    //                     ),
    //                   );
    //                 },
    //               ),
    //             ],
    //           );
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }
}

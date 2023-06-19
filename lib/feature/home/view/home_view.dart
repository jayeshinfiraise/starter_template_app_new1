import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_template_app_new1/app/l10n/l10n.dart';
import 'package:starter_template_app_new1/feature/home/view_model/home_view_model.dart';


class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {


  @override
  void initState() {
    super.initState();
    ref.read(HomeNotifier.provider).getHomeScreenData();
    
  }

  @override
  Widget build(BuildContext context, ) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.flutter,
        ),
      ),
      body: ListView.builder(
        itemCount: ref.watch(HomeNotifier.provider).arrPizzas.length,
        itemBuilder: (context, index){
          final item = ref.watch(HomeNotifier.provider).arrPizzas[index];
          return ListTile(title: Text(item));
        },
        ),
    );
  }
}

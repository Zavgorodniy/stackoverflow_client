import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackoverflow_client/bloc/base_state.dart';
import 'package:stackoverflow_client/data/model/tag.dart';
import 'package:stackoverflow_client/utils/routes.dart';
import 'package:stackoverflow_client/utils/srings.dart';
import 'package:stackoverflow_client/view/home/block/home_cubit.dart';
import 'package:stackoverflow_client/view/home/widgets/tag_list_item.dart';
import 'package:stackoverflow_client/view/base/pagination_manager.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with PaginationManager {
  @override
  Widget build(BuildContext context) => BlocProvider<HomeCubit>(
        create: (context) => HomeCubit(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(Strings.homeTitle),
          ),
          body: BlocBuilder<HomeCubit, BaseListState<Tag>>(
            buildWhen: (previousState, state) =>
                previousState.data.length != state.data.length,
            builder: (context, state) {
              final bloc = context.watch<HomeCubit>();
              return NotificationListener<ScrollNotification>(
                onNotification: (scrollInfo) =>
                    onScroll(scrollInfo, bloc.getData),
                child: state.data != null
                    ? ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: state.data.length,
                        itemBuilder: (_, i) =>
                            TagListItem(state.data[i], onTap),
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                      )
                    : CircularProgressIndicator(),
              );
            },
          ),
        ),
      );

  void onTap(String tag) {
    Navigator.of(context).pushNamed(Routes.questions, arguments: tag);
  }
}
